import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { ThrowStmt } from '@angular/compiler';

@Component({
  selector: 'app-picture',
  templateUrl: './picture.component.html',
  styleUrls: ['./picture.component.css']
})
export class PictureComponent implements OnInit {

  fileLabel = "Choose file";
  file: File;
  @Output()
  fileOutput = new EventEmitter<File>();
  @Output()
  deletePictureOutput = new EventEmitter<boolean>();
  imgPreview: any;

  constructor() { }

  ngOnInit() {
  }

  onFileSelected(event) {
    this.file = event.target.files[0];
    this.fileLabel = this.file.name;
    console.log(event);
    this.fileOutput.emit(this.file);

    let reader = new FileReader();
    reader.readAsDataURL(this.file);
    reader.onload = (_) => {
      this.imgPreview = reader.result;
    }
  }

  deletePicture(){
    this.deletePictureOutput.emit(true);
  }

}
