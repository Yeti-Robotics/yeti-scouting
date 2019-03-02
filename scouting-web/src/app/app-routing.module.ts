import { AuthGuard } from './auth-guard.service';
import { AnonymousGuard } from './anonymous-guard.service';
import { RegisterComponent } from './register/register.component';
import { TeamComponent } from './team/team.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ScoutingFormComponent } from './scouting-form/scouting-form.component';
import { TeamListComponent } from './team-list/team-list.component';
import { PitFormComponent } from './pit-form/pit-form.component';
import { LoginComponent } from './login/login.component';


const routes: Routes = [
  {
    path: "login",
    canActivate: [AnonymousGuard],
    component: LoginComponent
  },
  {
    path: "register",
    canActivate: [AnonymousGuard],
    component: RegisterComponent
  },
  {
    path: "pit-scouting",
    canActivate: [AuthGuard],
    component: PitFormComponent
  },
  {
    path: "team/:teamNumber",
    component: TeamComponent
  },
  {
    path: "scouting",
    pathMatch: "full",
    canActivate: [AuthGuard],
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
