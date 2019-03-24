import {Component, OnInit, QueryList, ViewChildren} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {compare, SortEvent, TableSortDirective} from "../table-sort.directive";

@Component({
  selector: 'app-team-list',
  templateUrl: './team-list.component.html',
  styleUrls: ['./team-list.component.css']
})
export class TeamListComponent implements OnInit {

  @ViewChildren(TableSortDirective) headers: QueryList<TableSortDirective>;

  teams: any[];
  unsortedTeams: any[];

  constructor(private httpClient:HttpClient) {

  }

  ngOnInit(): void {
    this.httpClient.get("/api/teams/search/teamList")
    .subscribe(data => {
      this.teams = this.unsortedTeams = data['_embedded']['teamLists'];
    });
  }

  onSort({column, direction}: SortEvent) {

    // resetting other headers
    this.headers.forEach(header => {
      if (header.sortable !== column) {
        header.direction = '';
      }
    });

    if (direction === '') {
      this.teams = this.unsortedTeams;
    } else {
      this.teams = [...this.unsortedTeams].sort((a, b) => {
        const res = compare(a[column], b[column]);
        return direction === 'asc' ? res : -res;
      });
    }
  }
}
