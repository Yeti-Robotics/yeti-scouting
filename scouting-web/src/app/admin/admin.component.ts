import {Component, OnInit} from '@angular/core';
import {AdminPreference, PreferenceService} from "../preference.service";
import {ToastrService} from "ngx-toastr";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {BlueAllianceService} from "../blue-alliance.service";


@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  AdminPreference = AdminPreference;
  prefs: any;
  eventInfo: FormGroup;

  constructor(private preferenceService: PreferenceService,
              private toastrService: ToastrService,
              private blueAllianceService: BlueAllianceService,
              private fb: FormBuilder) {

  }

  ngOnInit() {
    this.eventInfo = this.fb.group({
      teamNumber: ["", [Validators.min(1), Validators.required]],
      eventKey: ["", [Validators.pattern("20[0-9]{2}[a-z]{3,5}"), Validators.required]]
    });

    this.preferenceService.getPreferences().subscribe(
      prefs => this.prefs = prefs,
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.status}: ${error.statusText}`);
      }
    );
  }

  updatePreference(pref: AdminPreference, value: string) {
    this.preferenceService.setPreference(pref, value).subscribe(
      prefs => this.prefs = prefs,
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.status}: ${error.statusText}`);
      }
    );
  }

  resetTeam() {
    this.blueAllianceService.resetTeam(this.eventInfo.controls.teamNumber.value).toPromise().catch(
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.status}: ${error.statusText}`);
      }
    );
  }

  updateSchedule() {
    this.blueAllianceService.updateSchedule().toPromise().catch(
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.status}: ${error.statusText}`);
      }
    );
  }

}
