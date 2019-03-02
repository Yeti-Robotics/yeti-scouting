import { Router } from '@angular/router';
import { UserService } from './user.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  isCollapsed = true;

  constructor(public userService: UserService, private router: Router) {}

  ngOnInit(): void {

  }

  onLogout(){
    this.userService.logout().subscribe(() => {
      this.router.navigate(["/login"]);
    });
  }

}
