import { TestBed } from '@angular/core/testing';

import { BlueAllianceService } from './blue-alliance.service';

describe('BlueAllianceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BlueAllianceService = TestBed.get(BlueAllianceService);
    expect(service).toBeTruthy();
  });
});
