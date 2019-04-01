import {Component, OnInit} from '@angular/core';
import {PreferenceService, AdminPreference} from "../preference.service";
import {ToastrService} from "ngx-toastr";
import {FormControl} from "@angular/forms";
import {BlueAllianceService} from "../blue-alliance.service";


@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  AdminPreference = AdminPreference;
  prefs: any;
  teamNumber = new FormControl();

  constructor(private preferenceService: PreferenceService, private toastrService: ToastrService, private blueAllianceService: BlueAllianceService) {
    preferenceService.getPreferences().subscribe(
      prefs => this.prefs = prefs,
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.error.status}: ${error.error.message}`);
      }
    )
  }

  ngOnInit() {
  }

  updatePreference(pref: AdminPreference, value: string) {
    this.preferenceService.setPreference(pref, value).subscribe(
      prefs => this.prefs = prefs,
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.error.status}: ${error.error.message}`);
      }
    );
  }

  resetTeam() {
    this.blueAllianceService.resetTeam(this.teamNumber.value).toPromise().catch(
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.error.status}: ${error.error.message}`);
      }
    )
  }

}
