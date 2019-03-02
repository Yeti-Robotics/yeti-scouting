import { Validators } from '@angular/forms';
import { FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

 form: FormGroup;
  constructor(private fb:FormBuilder, private httpClient:HttpClient) {
    this.form = this.fb.group(
     {
       username: ["", Validators.required],
       password: ["", Validators.required]
     }
    );
   }

  ngOnInit() {
  }

  onSubmit() {
    this.httpClient.post("", this.form.getRawValue()).subscribe(
      data => {
        this.form.reset();
      }, error => {
        console.error(error);
      }
    )
  }

}
