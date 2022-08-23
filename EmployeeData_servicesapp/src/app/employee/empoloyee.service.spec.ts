import { TestBed } from '@angular/core/testing';

import { EmpoloyeeService } from './empoloyee.service';

describe('EmpoloyeeService', () => {
  let service: EmpoloyeeService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(EmpoloyeeService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
