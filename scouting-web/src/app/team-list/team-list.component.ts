import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-team-list',
  templateUrl: './team-list.component.html',
  styleUrls: ['./team-list.component.css']
})
export class TeamListComponent implements OnInit {

  teams: any[];
  constructor(private httpClient:HttpClient) {

  }

  ngOnInit(): void {
    this.httpClient.get("/api/teams/search/teamList")
    .subscribe(data => {
      this.teams = data['_embedded']['teamLists'];
    });
  }
}
