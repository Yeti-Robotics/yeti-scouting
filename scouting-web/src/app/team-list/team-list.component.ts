import {
  Component,
  Directive,
  EventEmitter,
  Input,
  OnInit,
  Output,
  PipeTransform,
  QueryList,
  ViewChildren
} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {DecimalPipe} from "@angular/common";
import {Observable, pipe} from "rxjs";
import {FormControl} from "@angular/forms";
import {map, startWith} from "rxjs/operators";

// Table sorting directive
export type SortDirection = 'asc' | 'desc' | '';
const rotate: {[key: string]: SortDirection} = { 'desc': 'asc', 'asc': '', '': 'desc' };
export const compare = (v1, v2) => v1 < v2 ? -1 : v1 > v2 ? 1 : 0;

export interface SortEvent {
  column: string;
  direction: SortDirection;
}

@Directive({
  selector: 'th[sortable]',
  host: {
    '[class.asc]': 'direction === "asc"',
    '[class.desc]': 'direction === "desc"',
    '(click)': 'rotate()'
  }
})
export class TableSortDirective {

  @Input() sortable: string;
  @Input() direction: SortDirection = '';
  @Output() sort = new EventEmitter<SortEvent>();

  rotate() {
    this.direction = rotate[this.direction];
    this.sort.emit({column: this.sortable, direction: this.direction});
  }
}

// Main component
@Component({
  selector: 'app-team-list',
  templateUrl: './team-list.component.html',
  styleUrls: ['./team-list.component.css'],
  providers: [DecimalPipe]
})
export class TeamListComponent implements OnInit {

  @ViewChildren(TableSortDirective) headers: QueryList<TableSortDirective>;

  teams: any[];
  teams$: Observable<any[]>;
  unsortedTeams: any[];
  filter = new FormControl('');


  constructor(private httpClient: HttpClient, private pipe: DecimalPipe) {
  }

  ngOnInit(): void {
    this.httpClient.get("/api/teams/search/teamList")
    .subscribe(data => {
      this.teams = this.unsortedTeams = data['_embedded']['teamLists'];

      this.teams$ = this.filter.valueChanges.pipe(
        startWith(''),
        map(text => this.search(text, this.pipe))
      );
    });
  }

  onSort({column, direction}: SortEvent) {
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
    this.teams$ = this.teams$.pipe(map(teams => this.search(this.filter.value, this.pipe)));
  }

  search(text: string, pipe: PipeTransform) {
    this.teams$.pipe(source => {
      return source;
    });
    return this.teams.filter(team => {
      const term = text.toLowerCase();
      return team.teamName.toLowerCase().includes(term)
        || String(team.teamNumber).includes(term);
    });
  }
}
