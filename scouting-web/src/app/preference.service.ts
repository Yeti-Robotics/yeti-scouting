import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";

export enum AdminPreference {
  TeamValidation = "teamValidation",
  EventKey = "eventKey"
}

@Injectable({
  providedIn: 'root'
})
export class PreferenceService {

  constructor(private httpClient: HttpClient) { }

  setPreference(pref: AdminPreference, value: string) {
    return this.httpClient.put("/api/preference", {
      preferenceName: pref,
      preferenceValue: value
    });
  }

  getPreferences() {
    return this.httpClient.get("/api/preference");
  }
}
