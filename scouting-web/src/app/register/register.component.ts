import {FormBuilder, FormGroup, ValidatorFn, Validators} from "@angular/forms";
import {Component, OnInit} from "@angular/core";
import {Router} from "@angular/router";
import {UserService} from '../user.service';
import {ToastrService} from "ngx-toastr";

@Component({
  selector: "app-register",
  templateUrl: "./register.component.html",
  styleUrls: ["./register.component.css"]
})
export class RegisterComponent implements OnInit {
  form: FormGroup;
  constructor(private fb: FormBuilder,
    private router: Router,
    private userService: UserService,
    private toastrService: ToastrService) {
    this.form = this.fb.group(
      {
        username: ["", Validators.compose([Validators.required, Validators.minLength(4), Validators.maxLength(50)])],
        password: ["", Validators.compose([Validators.required, Validators.minLength(4), Validators.maxLength(500)])],
        confirmPassword: ["", Validators.compose([Validators.required, Validators.minLength(4), Validators.maxLength(500)])],
        teamNumber: ["", Validators.required]
      },
      {
        validator: this.checkPasswords()
      }
    );
  }

  ngOnInit() {}

  onSubmit() {
    this.userService.createUser(this.form.getRawValue()).subscribe(
      data => {
        this.router.navigate(["login"]);
      },
      error => {
        console.error(error);
        if (error && error.status === 409) {
          this.toastrService.warning('Username already registered');
        } else {
          this.toastrService.warning('Unable to register');
        }
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
