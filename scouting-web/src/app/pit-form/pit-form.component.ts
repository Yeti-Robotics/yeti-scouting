import { HttpClient } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup, ValidatorFn, Validators } from "@angular/forms";

@Component({
  selector: "app-pit-form",
  templateUrl: "./pit-form.component.html",
  styleUrls: ["./pit-form.component.css"]
})
export class PitFormComponent implements OnInit {
  form: FormGroup;
  pictures = [];
  picCounter = [];

  constructor(private fb: FormBuilder, private httpClient: HttpClient) {
    this.form = this.fb.group(
      {
        teamNumber: ["", Validators.required],
        pictures: [],
        comment: ""
      },
      { validators: this.pitFormValidator() }
    );
  }

  ngOnInit() {}

  onSubmit() {
    const formData = new FormData();
    formData.append("teamNumber", this.form.controls.teamNumber.value);
    for (let picture of this.pictures) {
      formData.append("files[]", picture);
    }
    if (this.form.controls.comment.value) {
      formData.append("comment", this.form.controls.comment.value);
    }

    this.httpClient
      .post("/api/pitForms", formData)
      .subscribe(() => this.form.reset(), error => console.error(error));
    this.pictures = [];
    this.picCounter = [];
  }

  onFileSelected(event, index) {
    console.log(event);
    if (this.pictures[index]) {
      this.pictures[index] = event;
    }else{
      this.pictures.push(event);
    }
  }

  pitFormValidator(): ValidatorFn {
    return (form: FormGroup) => {
      if (form) {
        if (!form.controls.comment.value && !form.controls.pictures.value) {
          return { error: true };
        }
        return null;
      }
    };
  }

  addPicture() {
    this.picCounter.push(this.picCounter.length);
  }

  deletePicture(index) {
    this.pictures.splice(index, 1);
    this.picCounter.splice(index, 1);
    console.log(index);
  }
}
