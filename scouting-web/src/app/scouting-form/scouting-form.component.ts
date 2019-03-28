import { Component, OnInit } from "@angular/core";
import {FormBuilder, FormControl, FormGroup, FormsModule, ValidatorFn, Validators} from "@angular/forms";
import {HttpClient, HttpEvent, HttpEventType} from "@angular/common/http";
import { UserService } from '../user.service';
import {ToastrService} from "ngx-toastr";
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {BlueAllianceService} from "../blue-alliance.service";
import {Observable} from "rxjs";
import {map, startWith, tap} from "rxjs/operators";

@Component({
  selector: "app-scouting-form",
  templateUrl: "./scouting-form.component.html",
  styleUrls: ["./scouting-form.component.css"]
})
export class ScoutingFormComponent implements OnInit {
  form: FormGroup;
  user: any;
  submitting = false;
  matches = [];
  filteredMatches$: Observable<any[]>;
  showTeamChooser = true;
  noMatches = false;
  selectedScouterPos = new FormControl('', Validators.required);
  teamSelected = false;

  scouterPositions = [
    "red 1",
    "red 2",
    "red 3",
    "blue 1",
    "blue 2",
    "blue 3",
  ];

  constructor(
    private fb: FormBuilder,
    private httpClient: HttpClient,
    private userService: UserService,
    private toastrService: ToastrService,
    private modal: NgbModal,
    private blueAlliance: BlueAllianceService
  ) {
    this.user = userService.getUserInfo();

    const numberValidators = Validators.compose([
      Validators.required,
      Validators.min(0)
    ]);

    this.form = this.fb.group({
      teamNumber: ["", numberValidators],
      matchNumber: ["", numberValidators],
      crossHabitatLine: [false, Validators.required],
      sandstormCargoHatchPanelCount: [
        { value: 0, disabled: true },
        numberValidators
      ],
      sandstormCargoBallCount: [{ value: 0, disabled: true }, numberValidators],
      sandstormRocketHatchPanelCount: [
        { value: 0, disabled: true },
        numberValidators
      ],
      sandstormRocketBallCount: [
        { value: 0, disabled: true },
        numberValidators
      ],
      teleopCargoHatchPanelCount: [
        { value: 0, disabled: true },
        numberValidators
      ],
      teleopCargoBallCount: [{ value: 0, disabled: true }, numberValidators],
      teleopRocketHatchPanelCount: [
        { value: 0, disabled: true },
        numberValidators
      ],
      teleopRocketBallCount: [{ value: 0, disabled: true }, numberValidators],
      comment: ["", Validators.required],
      score: ["", numberValidators],
      habLevelClimb: [0, Validators.required],
      defense: [false, Validators.required],
      preload: [0, Validators.required],
      habLevelStart: [0, Validators.required],
      climbTime: [0, numberValidators],
      lifted: [false, Validators.required],
      gotLifted: [false, Validators.required],
      buddyClimb: [false, Validators.required],
      droppedGamePieces: [{ value: 0, disabled: true }, numberValidators],
      rocketLevel: [0, numberValidators]
    });

    this.blueAlliance.getFutureMatches().subscribe(
      (matches: any) => {
        this.matches = matches;
        if (this.matches.length == 0) {
          this.noMatches = true;
        }
      },
      error => {
        this.showTeamChooser = false;
        console.error(error);
        this.toastrService.error("Error retrieving future matches. Please enter manually.");
      }
    );

    this.filteredMatches$ = this.selectedScouterPos.valueChanges.pipe(
      startWith(this.matches),
      map(() => this.selectScouterPos())
    );
  }

  ngOnInit() {
  }

  incrementField(field: string) {
    let value = this.form.controls[field].value;
    if (value) {
      value++;
    } else {
      value = 1;
    }
    this.form.controls[field].setValue(value);
  }

  decrementField(field: string) {
    let value = this.form.controls[field].value;
    if (value) {
      value--;
    } else {
      value = 0;
    }
    this.form.controls[field].setValue(Math.max(0, value));
  }

  selectTeam(matchNumber, teamNumber) {
    this.form.controls.matchNumber.setValue(matchNumber);
    this.form.controls.teamNumber.setValue(teamNumber);
    this.teamSelected = true;
    this.modal.dismissAll();
  }

  selectScouterPos() {
    if (this.selectedScouterPos.valid) {
      let filteredMatches = [];
      let [alliance, position] = this.selectedScouterPos.value.split(' ');
      for (let match of this.matches) {
          filteredMatches.push({
            team: match['alliances'][alliance]['team_keys'][parseInt(position) - 1],
            number: match.match_number
        });
      }
      return filteredMatches;
    }
  }

  onSubmit() {
    this.submitting = true;

    if (this.form.value.habLevelClimb == 0) {
      this.form.value.habLevelClimb = null;
    }
    this.httpClient
      .post("/api/scoutingForms", this.form.getRawValue())
      .subscribe(
        data => {
          console.log(data);
          this.form.reset({
            teamNumber: "",
            matchNumber: "",
            crossHabitatLine: false,
            sandstormCargoHatchPanelCount: 0,
            sandstormCargoBallCount: 0,
            sandstormRocketHatchPanelCount: 0,
            sandstormRocketBallCount: 0,
            teleopCargoHatchPanelCount: 0,
            teleopCargoBallCount: 0,
            teleopRocketHatchPanelCount: 0,
            teleopRocketBallCount: 0,
            comment: "",
            score: "",
            habLevelClimb: 0,
            defense: false,
            preload: 0,
            habLevelStart: 0,
            climbTime: 0,
            lifted: false,
            gotLifted: false,
            buddyClimb: false,
            droppedGamePieces: 0,
            rocketLevel: 0
          });

          this.toastrService.success("Success!");
          this.matches = this.matches.slice(1);
          this.teamSelected = false;
        },
        error => {
          console.error(error);
          this.toastrService.error("Error during submission. Contact a programmer.");
        },
        () => {
          this.submitting = false;
        }
      );
  }
}
