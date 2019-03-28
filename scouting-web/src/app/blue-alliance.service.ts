import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {tap} from "rxjs/operators";

@Injectable({
  providedIn: 'root'
})
export class BlueAllianceService {

  futureMatches: any;

  constructor(private httpClient: HttpClient) { }

  getFutureMatches() {
    return this.httpClient.get("/api/tba/getFutureMatches")
      .pipe(tap(
        matches => this.futureMatches = matches,
        () => this.futureMatches = null
      ));
  }
}
