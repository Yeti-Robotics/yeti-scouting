import {BrowserModule} from '@angular/platform-browser';
import {APP_INITIALIZER, NgModule} from '@angular/core';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {ScoutingFormComponent} from './scouting-form/scouting-form.component';
import {TableSortDirective, TeamListComponent} from './team-list/team-list.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {TeamComponent} from './team/team.component';
import {PitFormComponent} from './pit-form/pit-form.component';
import {CommonModule} from '@angular/common';
import {PictureComponent} from './picture/picture.component';
import {LoginComponent} from './login/login.component';
import {RegisterComponent} from './register/register.component';
import {DefaultHeaderInterceptorService} from './default-header-interceptor.service';
import {UserService} from './user.service';
import {of} from 'rxjs';
import {catchError, flatMap} from 'rxjs/operators';
import {PitComponent} from './pit/pit.component';
import {ToastrModule} from "ngx-toastr";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {Ng2ImgMaxModule} from "ng2-img-max";
import { AdminComponent } from './admin/admin.component';
import { EndPositionPipe } from './end-position.pipe';

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
    RegisterComponent,
    PitComponent,
    TableSortDirective,
    AdminComponent,
    EndPositionPipe
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    NgbModule,
    CommonModule,
    FormsModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot({
      timeOut: 3000,
      autoDismiss: true,
      positionClass: 'toast-top-center',
      preventDuplicates: true,
      resetTimeoutOnDuplicate: true
    }),
    Ng2ImgMaxModule
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
export class AppModule {
}
