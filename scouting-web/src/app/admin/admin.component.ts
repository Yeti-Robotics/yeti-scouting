import {Component, OnInit} from '@angular/core';
import {AdminActionService, AdminPreference} from "../admin-action.service";
import {ToastrService} from "ngx-toastr";
import {FormControl} from "@angular/forms";


@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  AdminPreference = AdminPreference;
  prefs: any;
  teamNumber = new FormControl();

  constructor(private adminActionService: AdminActionService, private toastrService: ToastrService) {
    adminActionService.getPreferences().subscribe(
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
    this.adminActionService.setPreference(pref, value).subscribe(
      prefs => this.prefs = prefs,
      error => {
        console.error(error);
        this.toastrService.error(`Error ${error.error.status}: ${error.error.message}`);
      }
    );
  }

}
