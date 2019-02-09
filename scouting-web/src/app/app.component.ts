import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  
  teams: any[];
  constructor(private httpClient:HttpClient) {
    
  }

  ngOnInit(): void {
    this.httpClient.get("/api/teams")
    .subscribe(data => {
      this.teams = data['_embedded']['teams'];
    });
  }
}
