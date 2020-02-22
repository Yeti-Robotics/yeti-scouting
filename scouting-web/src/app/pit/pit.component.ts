import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import {NgbCarouselConfig} from "@ng-bootstrap/ng-bootstrap";

@Component({
  selector: 'app-pit',
  templateUrl: './pit.component.html',
  styleUrls: ['./pit.component.css'],
  providers: [NgbCarouselConfig]
})
export class PitComponent implements OnInit {
  teamNumber: number;
  pictures: any[];
  pitData: any[];
  comments: any[];


  constructor(private httpClient: HttpClient, private route: ActivatedRoute, private carouselConfig: NgbCarouselConfig) {
    carouselConfig.interval = 0;
  }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.teamNumber = params["params"]["teamNumber"];
    });
    this.httpClient.get(`/api/pit/${this.teamNumber}`)
      .subscribe(data => {
        this.pictures = data["pictures"];
        this.comments = data["comments"];
      });
  }

}
