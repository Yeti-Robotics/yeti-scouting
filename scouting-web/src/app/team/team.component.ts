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
  scoutForms: any[];
  teamStats: any;

  constructor(private httpClient: HttpClient, private route: ActivatedRoute) {}

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.teamNumber = params['params']['teamNumber'];
    });
    this.httpClient.get("/api/teams/" + this.teamNumber)
    .subscribe(data => this.teamInfo = data,
      error => {
        if (error && error.status === 404){
          this.teamInfo = {
            number: this.teamNumber,
            name: "unknown"
          };
        }
      });
    this.httpClient.get(`/api/scoutingForms/search/findByTeamNumber?teamNumber=${this.teamNumber}`)
    .subscribe(data => this.scoutForms = data["_embedded"]["scoutingForms"]);
    this.httpClient.get(`/api/teams/search/teamStats?teamNumber=${this.teamNumber}`)
    .subscribe(data => this.teamStats = data);
  }
}
