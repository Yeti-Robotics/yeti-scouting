import { ValidatorFn } from "@angular/forms";
import { Validators, FormGroup } from "@angular/forms";
import { HttpClient } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { FormBuilder } from "@angular/forms";
import { Router } from "@angular/router";

@Component({
  selector: "app-register",
  templateUrl: "./register.component.html",
  styleUrls: ["./register.component.css"]
})
export class RegisterComponent implements OnInit {
  form: FormGroup;
  constructor(private fb: FormBuilder,
    private httpClient: HttpClient,
    private router: Router) {
    this.form = this.fb.group(
      {
        username: ["", Validators.required],
        password: ["", Validators.required],
        confirmPassword: ["", Validators.required],
        teamNumber: ""
      },
      {
        validator: this.checkPasswords()
      }
    );
  }

  ngOnInit() {}

  onSubmit() {
    this.httpClient.post("/api/users", this.form.getRawValue()).subscribe(
      data => {
        this.router.navigate(["login"]);
      },
      error => {
        console.error(error);
      }
    );
  }

  checkPasswords(): ValidatorFn {
    return (formGroup: FormGroup) => {
      if (formGroup) {
        let password = formGroup.controls.password.value;
        let confirmPassword = formGroup.controls.confirmPassword.value;

        return password === confirmPassword ? null : { error: true };
      } else {
        return null;
      }
    };
  }
}
