import {Component, OnInit, ElementRef, ViewChild} from "@angular/core";
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
  cachedForms = [];
  submitting = false;
  matches = [];
  filteredMatches$: Observable<any[]>;
  showTeamChooser = true;
  noMatches = false;
  selectedScouterPos = new FormControl('', Validators.required);
  teamSelected = false;

  //Timer variables
  timerToggled: boolean = false;
  timerButtonText: string = "Start";
  tick: int = 0;
  time: string = "0.0";
  timerInterval;
  validTime: boolean = true;

  @ViewChild('timerButton') timerButton: ElementRef;
  @ViewChild('alert') alert: ElementRef;
  @ViewChild('timeInput') timeInput: ElementRef;

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
      crossHabitatLine: [false, Validators.required],
      sandstormCargoHatchPanelCount: [
        {value: 0, disabled: true},
        numberValidators
      ],
      sandstormCargoBallCount: [{value: 0, disabled: true}, numberValidators],
      sandstormRocketHatchPanelCount: [
        {value: 0, disabled: true},
        numberValidators
      ],
      sandstormRocketBallCount: [
        {value: 0, disabled: true},
        numberValidators
      ],
      teleopCargoHatchPanelCount: [
        {value: 0, disabled: true},
        numberValidators
      ],
      teleopCargoBallCount: [{value: 0, disabled: true}, numberValidators],
      teleopRocketHatchPanelCount: [
        {value: 0, disabled: true},
        numberValidators
      ],
      teleopRocketBallCount: [{value: 0, disabled: true}, numberValidators],
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
      droppedGamePieces: [{value: 0, disabled: true}, numberValidators],
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

  //User Input Sanity
  isValidTime(str: string) {
    const regex = RegExp("^[0-9][0-9]*\\.[0-9]$");
    return regex.test(str);
  }
  isPartialTime(str: string) {
    const noPoint = RegExp("^[0-9][0-9]*$");
    const withPoint = RegExp("^[0-9][0-9]*\\.$");
    return noPoint.test(str) || withPoint.test(str);
  }
  //Recreate the new user input
  evaluateNewString(str, event) {
    var selectionLength = window.getSelection().toString().length;
    if (event.keyCode == 8) {
      // If there is a selected region, backspace will remove selected regions
      if (selectionLength > 0) {
        return str.substring(0, event.target.selectionStart) + str.substring(event.target.selectionStart + selectionLength);
      }
      // Else backspace will remove character behind cursor
      else {
        return str.substring(0, event.target.selectionStart - 1) + str.substring(event.target.selectionStart);
      }
    }
    else {
      return str.substring(0, event.target.selectionStart) + event.key + str.substring(event.target.selectionStart + selectionLength);
    }
  }
  timerInputKeyDown(event){
    if (!this.timerToggled) {
      var newString = this.evaluateNewString(event.target.value, event);
      //Backspace
      if (event.keyCode == 8) {
        if (!this.isValidTime(newString)) {
          this.validTime = false;
        }
        return true;
      }
      //Left and right arrow keys
      if ([37, 39].includes(event.keyCode)) {
        return true;
      }
      if (this.isValidTime(newString)) {
        this.validTime = true;
        return true;
      }
      else if (this.isPartialTime(newString)) {
        this.validTime = false;
        return true;
      }
      else {
        return false;
      }
    }
  }
  //Timer Functions
  resetTimer() {
    console.log("Reset");

    this.stopTimer();

    this.timerToggled = false;
    this.timerButtonText = "Start";
    this.tick = 0;
    this.time = "0.0";
    this.validTime = true;
  }
  stopTimer() {
    clearInterval(this.timerInterval);
  }
  startTimer() {
    this.tick = parseInt(parseFloat(this.time)*10);
    this.timerInterval = setInterval(() => {
      this.tick += 1;
      this.time = (this.tick/10.0).toFixed(1);
    },100)
  }
  toggleTimer() {
    console.log("Toggled");
    this.timerToggled = !this.timerToggled;
    if (this.timerToggled) {
      this.timerButtonText = "Stop";
      this.startTimer();
    }
    else {
      this.timerButtonText = "Start";
      this.stopTimer();
    }
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
    this.cachedForms.push(this.form.getRawValue());
    this.submitting = true;

    if (this.form.value.habLevelClimb == 0) {
      this.form.value.habLevelClimb = null;
    }
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
          this.toastrService.success("Success!");
          this.resetForm();
        },
        error => {
          console.error(error);
          if (error.name == "TimeoutError") {
            this.resetForm();
            this.toastrService.warning("Dear Scouter, due to a lack of internet, we regret to inform you we could not submit your " +
              "form. However, using recent advancements in technology and our big brain energy, we are storing (caching) your form. Sincerely, " +
              "Yeti Programmers ", "Cashed (and moneyed)", {timeOut: 9000});
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
  }
}
