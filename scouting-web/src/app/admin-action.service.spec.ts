import { TestBed } from '@angular/core/testing';

import { AdminActionService } from './admin-action.service';

describe('AdminActionService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: AdminActionService = TestBed.get(AdminActionService);
    expect(service).toBeTruthy();
  });
});
