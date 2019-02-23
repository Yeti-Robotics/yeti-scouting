import { TeamComponent } from './team/team.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ScoutingFormComponent } from './scouting-form/scouting-form.component';
import { TeamListComponent } from './team-list/team-list.component';

const routes: Routes = [
  {
    path: "team/:teamNumber",
    component: TeamComponent
  },
  {
    path: "scouting",
    pathMatch: "full",
    component: ScoutingFormComponent
  },
  {
    path: "",
    pathMatch: "full",
    component: TeamListComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
