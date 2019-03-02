import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-pit',
  templateUrl: './pit.component.html',
  styleUrls: ['./pit.component.css']
})
export class PitComponent implements OnInit {
  teamNumber: number;
  pitPictures: any;
  pitComments: any;


  constructor(private httpClient: HttpClient, private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.teamNumber = params["params"]["teamNumber"];
    });
    this.httpClient.get(`/api/pitPictures/search/findByTeamNumber?teamNumber=${this.teamNumber}`)
    .subscribe(data => this.pitPictures = data["_embedded"]["pitPictures"]);
  }

}
