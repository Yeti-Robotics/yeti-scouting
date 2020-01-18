import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class BlueAllianceService {

  constructor(private httpClient: HttpClient) {
  }

  getFutureMatches() {
    return this.httpClient.get("/api/tba/getFutureMatches");
  }

  resetTeam(teamNumber: number) {
    return this.httpClient.patch("/api/tba/resetTeam/" + teamNumber, null);
  }

  updateSchedule() {
    return this.httpClient.post("/api/tba/updateSchedule", null);
  }
}
