import {Component, OnInit} from "@angular/core";
import {FormBuilder, FormControl, FormGroup, Validators} from "@angular/forms";
import {HttpClient} from "@angular/common/http";
import {UserService} from '../user.service';
import {ToastrService} from "ngx-toastr";
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {BlueAllianceService} from "../blue-alliance.service";
import {Observable} from "rxjs";
import {finalize, map, startWith, timeout} from "rxjs/operators";
import {AdminPreference, PreferenceService} from "../preference.service";

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
  cachedForms = [];

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
    private blueAlliance: BlueAllianceService,
    private preferenceService: PreferenceService
  ) {
    this.user = userService.getUserInfo();
    this.preferenceService.getPreferences().subscribe(
      prefs => this.showTeamChooser = prefs[AdminPreference.TeamValidation] === "true",
      error => {
        this.showTeamChooser = false;
        console.error(error);
        this.toastrService.error(`Error ${error.status}: ${error.statusText}`, "Error retrieving application preferences");
      }
    );

    const numberValidators = Validators.compose([
      Validators.required,
      Validators.min(0)
    ]);

    this.form = this.fb.group({
      teamNumber: ["", numberValidators],
      matchNumber: ["", numberValidators],
      preload: [0, Validators.required],
      crossInitiationLine: [false, Validators.required],
      autoUpperScoredBalls: [
        {value: 0, disabled: true},
        numberValidators
      ],
      autoUpperMissedBalls: [{value: 0, disabled: true}, numberValidators],
      
      autoLowScoredBalls: [
        {value: 0, disabled: true},
        numberValidators
      ],
      autoLowMissedBalls: [
        {value: 0, disabled: true},
        numberValidators
      ],

      spillBalls: [0, Validators.required],
      
      teleopUpperMissedBalls: [
        {value: 0, disabled: true},
        numberValidators
      ],
      teleopUpperScoredBalls: [
        {value: 0, disabled: true},
        numberValidators
      ],
      teleopLowScoredBalls: [
        {value: 0, disabled: true},
        numberValidators
      ],
      teleopLowMissedBalls: [
        {value: 0, disabled: true}, 
        numberValidators
      ],
      defense: [0, Validators.required],
      
      comment: ["", Validators.required],
      habLevelClimb: [0, Validators.required],
      positionControl: [false, Validators.required],
      rotationControl: [false, Validators.required],
      
      endPosition: [0, Validators.required],
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
    this.cachedForms = JSON.parse(localStorage.getItem('form')) || [];
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
    this.httpClient
      .post("/api/scoutingForm", [this.form.getRawValue()])
      .pipe(
        timeout(3000),
        finalize(() => this.submitting = false)
      )
      .subscribe(
        data => {
          console.log(data);
          this.toastrService.success("Success!");
          this.resetForm();
        },
        error => {
          console.error(error);
          if (error.name == "TimeoutError" || error.name == "HttpErrorResponse"){
            this.cachedForms = JSON.parse(localStorage.getItem('form')) || [];
            this.cachedForms.push(this.form.getRawValue());
            localStorage.setItem('form', JSON.stringify(this.cachedForms));
            this.resetForm();
            this.toastrService.warning("Dear Scouter, due to a lack of internet, we regret to inform you we could not submit your " +
              "form. However, using recent advancements in technology and our big brain energy, we are storing (caching) your form. Sincerely, " +
              "Yeti Programmers ", "Cached (and moneyed)", {timeOut: 9000});
          } else {
            this.toastrService.error("Uh oh! Error: " + error.status + ". " + error.statusText);
          }
        }
      );
  }

  onSubmitCachedForms(){
    this.submitting = true; 
    this.httpClient
      .post("/api/scoutingForm", this.cachedForms)
      .pipe(
        timeout(3000), 
        finalize(() => this.submitting = false)
      )
      .subscribe(
        data => {
          console.log(data);
          this.cachedForms = [];
          localStorage.clear();
          this.toastrService.success("Success!");
        }, 
        error => {
          console.error(error);
          if (error.name == "TimeoutError" || error.name == "HttpErrorResponse"){
            this.toastrService.warning("Please connect to the Internet before trying to submit cached forms!", error.name + "; " + error.statusText, {timeOut: 9000});
          } else {
            this.toastrService.error("Uh oh! Error: " + error.status + ". " + error.statusText);
          }
        }
      );
  }

  private resetForm() {
    this.matches.splice(0, 1);
    window.scroll(0, 0);
    this.teamSelected = false;
    this.form.reset({
      teamNumber: "",
      matchNumber: "",
      crossInitiationLine: false,
      autoUpperScoredBalls: 0,
      autoUpperMissedBalls: 0,
      autoLowScoredBalls: 0,
      autoLowMissedBalls: 0,
      spillBalls: 0,
      teleopUpperMissedBalls: 0,
      teleopUpperScoredBalls: 0,
      teleopLowScoredBalls: 0,
      teleopLowMissedBalls: 0,
      defense: 0,
      comment: "",
      habLevelClimb: 0,
      preload: 0,
      positionControl: false,
      rotationControl: false,
      endPosition: 0
    });
  }
}
