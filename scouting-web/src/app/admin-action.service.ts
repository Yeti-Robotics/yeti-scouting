import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";

export enum AdminPreference {
  TeamValidation = "teamValidation",
  CompetitionKey = "competitionKey"
}

@Injectable({
  providedIn: 'root'
})
export class AdminActionService {

  constructor(private httpClient: HttpClient) { }

  setPreference(pref: AdminPreference, value: string) {
    const params = new HttpParams().append("name", pref).append("value", value);
    return this.httpClient.put("/api/preference", {}, {params: params})
  }

  getPreferences() {
    return this.httpClient.get("/api/preference");
  }
}
