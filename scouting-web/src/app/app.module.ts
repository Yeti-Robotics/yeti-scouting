import { BrowserModule } from '@angular/platform-browser';
import { NgModule, APP_INITIALIZER } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ScoutingFormComponent } from './scouting-form/scouting-form.component';
import { TeamListComponent } from './team-list/team-list.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { TeamComponent } from './team/team.component';
import { PitFormComponent } from './pit-form/pit-form.component';
import { CommonModule } from '@angular/common';
import { PictureComponent } from './picture/picture.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { DefaultHeaderInterceptorService } from './default-header-interceptor.service';
import { UserService } from './user.service';
import { Observable, of } from 'rxjs';
import { flatMap, catchError } from 'rxjs/operators';

export function appInit(userService: UserService): Function {
  return () =>
    userService.checkAuth()
      .pipe(
        flatMap(() => of(true)),
        catchError(() => of(true))
      ).toPromise();
}

@NgModule({
  declarations: [
    AppComponent,
    ScoutingFormComponent,
    TeamListComponent,
    TeamComponent,
    PitFormComponent,
    PictureComponent,
    LoginComponent,
    RegisterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    NgbModule,
    CommonModule,
    FormsModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: DefaultHeaderInterceptorService,
      multi: true
    },
    {
      provide: APP_INITIALIZER,
      useFactory: appInit,
      multi: true,
      deps: [UserService]
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
