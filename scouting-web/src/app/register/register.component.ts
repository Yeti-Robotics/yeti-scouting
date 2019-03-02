import { Validators, FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  form: FormGroup;
  constructor(private fb:FormBuilder, private httpClient:HttpClient) {
    this.form = this.fb.group(
     {
       username: ["", Validators.required],
       password: ["", Validators.required],
       teamNumber: ["", Validators.required]
     }
    );
   }

  ngOnInit() {
  }

  onSubmit() {
    this.httpClient.post("/api/users", this.form.getRawValue()).subscribe(
      data => {
        this.form.reset();
      }, error => {
        console.error(error);
      }
    );
  }

  checkPasswords(formGroup: FormGroup) {
    let password = formGroup.controls.password.value;
    let confirmPassword = formGroup.controls.confirmPassword.value;

    return password == confirmPassword;
  }
}
