import { HttpClient } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { ActivatedRoute } from "@angular/router";

@Component({
  selector: "app-team",
  templateUrl: "./team.component.html",
  styleUrls: ["./team.component.css"]
})
export class TeamComponent implements OnInit {
  teamNumber: number;
  teamInfo: any;

  constructor(private httpClient: HttpClient, private route: ActivatedRoute) {}

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.teamNumber = params['params']['teamNumber'];
    });
    this.httpClient.get("/api/teams/" + this.teamNumber).subscribe(data => {
      this.teamInfo['number'] = data['number'];
      this.teamInfo['name'] = data['name'];
    });
  }
}
