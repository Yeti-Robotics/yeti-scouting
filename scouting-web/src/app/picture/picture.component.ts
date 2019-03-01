import { Component, OnInit } from '@angular/core';
import { ThrowStmt } from '@angular/compiler';

@Component({
  selector: 'app-picture',
  templateUrl: './picture.component.html',
  styleUrls: ['./picture.component.css']
})
export class PictureComponent implements OnInit {

  fileLabel = "Choose file";
  file: File;

  constructor() { }

  ngOnInit() {
  }
  onFileSelected(event) {
    this.file = event.target.files[0];
    this.fileLabel = this.file.name;
    console.log(event);
  }

}
