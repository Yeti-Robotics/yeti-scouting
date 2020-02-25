import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'climbingValues'
})
export class ClimbingValuesPipe implements PipeTransform {

  transform(value: any, args?: any): any {
    switch (value) {
      case 0:
        return 'Cannot Climb'
      case 1:
        return 'Can Climb, Not Level'
      case 2:
        return 'Can Climb, Level'
    }
  }

}
