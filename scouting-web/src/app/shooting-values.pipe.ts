import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'shootingValues'
})
export class ShootingValuesPipe implements PipeTransform {

  transform(value: any, args?: any): any {
    switch (value) {
      case 0:
        return 'None'
      case 1:
        return 'Low'
      case 2:
        return 'High'
      case 3:
        return 'Both'
    }
  }

}
