import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'endPosition'
})
export class EndPositionPipe implements PipeTransform {

  transform(value: any, args?: any): any {
    switch (value) {
      case 0: 
        return 'Nothing'
      case 1:
        return 'Parked'
      case 2:
        return 'Buddy Climb Got Lifted'
      case 3:
        return 'Buddy Climb Lifted'
      case 4:
        return 'Solo Climb Not Level'
      case 5:
        return 'Solo Climb Level'
    }
  }

}
