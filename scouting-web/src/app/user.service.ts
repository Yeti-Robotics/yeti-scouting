import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  user: any;
  constructor(private httpClient: HttpClient) { }

  login(username: string, password: string) {
    
  }
}
