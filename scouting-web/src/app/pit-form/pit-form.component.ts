import {HttpClient} from "@angular/common/http";
import {Component, OnInit} from "@angular/core";
import {
  FormBuilder,
  FormGroup,
  ValidatorFn,
  Validators
} from "@angular/forms";
import {UserService} from "../user.service";
import {Ng2ImgMaxService} from "ng2-img-max";

@Component({
  selector: "app-pit-form",
  templateUrl: "./pit-form.component.html",
  styleUrls: ["./pit-form.component.css"]
})
export class PitFormComponent implements OnInit {
  form: FormGroup;
  pictures = [];
  picCounter = [];
  user: any;

  constructor(
    private fb: FormBuilder,
    private httpClient: HttpClient,
    private userService: UserService,
    private imgResizer: Ng2ImgMaxService
  ) {
    this.user = userService.getUserInfo();

    this.form = this.fb.group(
      {
        teamNumber: ["", Validators.required],
        pictures: [],
        comment: ""
      },
      {validators: this.pitFormValidator()}
    );
  }

  ngOnInit() {
  }

  onSubmit() {
    const formData = new FormData();
    formData.append("teamNumber", this.form.controls.teamNumber.value);
    formData.append("scouter", this.user.username);
    for (let picture of this.pictures) {
      formData.append("files[]", picture);
    }
    if (this.form.controls.comment.value) {
      formData.append("comment", this.form.controls.comment.value);
    }

    this.httpClient
      .post("/api/pit", formData)
      .subscribe(() => this.form.reset(), error => console.error(error));
    this.pictures = [];
    this.picCounter = [];
  }

  onFileSelected(event, index) {
    console.log(event);
    this.imgResizer.resizeImage(event, 640, 640).subscribe(
      result => {
        event = new File([result], result.name);
        if (this.pictures[index]) {
          this.pictures[index] = event;
        } else {
          this.pictures.push(event);
        }
      },
      error => {
        console.error(error);
      }
    );
  }

  pitFormValidator(): ValidatorFn {
    return (form: FormGroup) => {
      if (form) {
        if (!form.controls.comment.value && !form.controls.pictures.value) {
          return {error: true};
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
