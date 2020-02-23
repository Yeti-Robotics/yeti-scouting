import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'heightValues'
})
export class HeightValuesPipe implements PipeTransform {

  transform(value: any, args?: any): any {
    switch(value){
      case 0:
        return 'Can drive through trench'
      case 1:
        return 'Cannot drive through trench'
    }
  }

}
