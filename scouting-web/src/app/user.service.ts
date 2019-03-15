import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  user: any;

  constructor(private httpClient: HttpClient) {
  }

  login(username: string, password: string): Observable<any> {
    const auth = btoa(`${username}:${password}`);
    const headers = new HttpHeaders()
      .append("Authorization", `Basic ${auth}`);
    return this.httpClient.get('/api/users', {
      headers: headers
    }).pipe(tap(user => this.user = user, () => this.user = null));
  }

  getUserName() {
    return {
      firstName: decodeURIComponent(this.user.principal.firstName),
      lastName: decodeURIComponent(this.user.principal.lastName)
    }
  }

  checkAuth(): Observable<any> {
    return this.httpClient.get('/api/users')
      .pipe(tap(user => this.user = user, () => this.user = null));
  }

  logout(): Observable<any> {
    return this.httpClient.get('/api/logout')
      .pipe(tap(user => this.user = user));
  }

  createUser(user: any): Observable<any> {
    user.firstName = encodeURIComponent(user.firstName);
    user.lastName = encodeURIComponent(user.lastName);
    console.log(user);
    return this.httpClient.post('/api/users', user);
  }

}
