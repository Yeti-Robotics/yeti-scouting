import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-scouting-form',
  templateUrl: './scouting-form.component.html',
  styleUrls: ['./scouting-form.component.css']
})
export class ScoutingFormComponent implements OnInit {

  form: FormGroup;

  constructor(private fb: FormBuilder, private httpClient: HttpClient) {

    this.form = this.fb.group({
      teamNumber: ["", Validators.required],
      matchNumber: ["", Validators.required],
      crossHabitatLine: [false, Validators.required],
      sandstormCargoHatchPanelCount: ["", Validators.required],
      sandstormCargoBallCount: ["", Validators.required],
      sandstormRocketHatchPanelCount: ["", Validators.required],
      sandstormRocketBallCount: ["", Validators.required]
    });

  }

  ngOnInit() {
  }

  onSubmit() {
    this.httpClient.post("/api/scoutingForms", this.form.value)
      .subscribe(data => {
        console.log(data);
        this.form.reset({
          crossHabitatLine: false
        });
      }, error => {
        console.error(error);
      });
  }
}
