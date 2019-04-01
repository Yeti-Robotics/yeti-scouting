import {Component, OnInit} from "@angular/core";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {HttpClient} from "@angular/common/http";
import {UserService} from '../user.service';
import {finalize, timeout} from 'rxjs/operators';
import {ToastrService} from "ngx-toastr";

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
  timeout = 5;

  constructor(
    private toastrService: ToastrService,
    private fb: FormBuilder,
    private httpClient: HttpClient,
    private userService: UserService
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
      lifted: [false, Validators.required],
      gotLifted: [false, Validators.required],
      buddyClimb: [false, Validators.required],
      droppedGamePieces: [{value: 0, disabled: true}, numberValidators],
      rocketLevel: [0, numberValidators]
    });
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

  onSubmit() {
    this.cachedForms.push(this.form.getRawValue());
    this.submitting = true;
    this.httpClient
      .post("/api/scoutingForm", this.cachedForms)
      .pipe(
        timeout(this.timeout),
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
          }
          this.toastrService.error("Uh oh! Error: " + error.error.status + ". " + error.error.message);
        }
      );
  }

  private resetForm() {
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
