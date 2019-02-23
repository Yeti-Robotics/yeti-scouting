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
  file: File;

  constructor(private fb: FormBuilder, private httpClient: HttpClient) {
    this.form = this.fb.group(
      {
        teamNumber: ["", Validators.required],
        file: "",
        comment: ""
      },
      { validators: this.pitFormValidator() }
    );
  }

  ngOnInit() {}

  onSubmit() {
    const formData = new FormData();
    formData.append("teamNumber", this.form.controls.teamNumber.value);
    if (this.file) {
      formData.append("file", this.file);
    }
    if (this.form.controls.comment.value) {
      formData.append("comment", this.form.controls.comment.value);
    }

    this.httpClient
      .post("/api/pitForms", formData)
      .subscribe(() => this.form.reset(), error => console.error(error));
  }

  onFileSelected(event) {
    console.log(event);
    this.file = event.target.files[0];
  }

  pitFormValidator(): ValidatorFn {
    return (form: FormGroup) => {
      if (form) {
        if (!form.controls.comment.value && !form.controls.file.value) {
          return { error: true };
        }
        return null;
      }
    };
  }
}
