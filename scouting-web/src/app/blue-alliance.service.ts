import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {tap} from "rxjs/operators";

@Injectable({
  providedIn: 'root'
})
export class BlueAllianceService {

  futureMatches: any;
  futureRobotPositions: any;

  constructor(private httpClient: HttpClient) { }

  getFutureMatches() {
    return this.httpClient.get("/api/tba/getFutureMatches")
      .pipe(tap(
        matches => this.futureMatches = matches,
        () => this.futureMatches = null
      ));
  }

  selectRobotPos(robotPos: string) {
    this.futureRobotPositions = [];
    let [alliance, position] = robotPos.split(' ');
    for (let match of this.futureMatches) {
      this.futureRobotPositions.push({
        team: match['alliances'][alliance]['team_keys'][parseInt(position) - 1],
        number: match.match_number
      });
    }

    return this.futureRobotPositions;
  }
}
