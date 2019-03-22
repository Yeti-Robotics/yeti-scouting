import { UserService } from '../user.service';
import { Validators } from "@angular/forms";
import { FormGroup } from "@angular/forms";
import { Component, OnInit } from "@angular/core";
import { FormBuilder } from "@angular/forms";
import { Router } from '@angular/router';
import {ToastrService} from "ngx-toastr";

@Component({
  selector: "app-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.css"]
})
export class LoginComponent implements OnInit {

  form: FormGroup;
  constructor(private fb: FormBuilder,
              private userService: UserService,
              private router: Router,
              private toastrService: ToastrService) {
    this.form = this.fb.group({
      username: ["", Validators.required],
      password: ["", Validators.required]
    });
  }

  ngOnInit() {}

  onSubmit() {
    const username = this.form.controls.username.value;
    const password = this.form.controls.password.value;
    return this.userService.login(username, password).subscribe(user => {
        this.userService.user = user;
        this.router.navigate([""]);
      }, error => {
        this.userService.user = null;
        this.toastrService.error('Incorrect username or password');
        this.form.controls.password.reset();
        console.error(error);
      });
  }
}
