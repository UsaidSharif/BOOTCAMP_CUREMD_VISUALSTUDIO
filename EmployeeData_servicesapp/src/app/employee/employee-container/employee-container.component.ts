import { Component, Input, OnInit } from '@angular/core';
import { map } from 'rxjs';
import { employee } from '../employee.model';
import { EmpoloyeeService } from '../empoloyee.service';

@Component({
  selector: 'app-employee-container',
  templateUrl: './employee-container.component.html',
  styleUrls: ['./employee-container.component.css']
})
export class EmployeeContainerComponent implements OnInit {
  selectedEmployee: employee;
  isShowDiv:boolean=true;
  @Input() list: employee[];


  constructor(private EmpoloyeeService: EmpoloyeeService) { }

  ngOnInit(): void {
    this.EmpoloyeeService.getEmployees().pipe(
      map((data: employee[]) => {
        if (data !== null && data !== undefined) {
          this.list = data;
        }
      })
    ).subscribe()
  }

  setSelectedEmployee(employee: employee) {
    this.EmpoloyeeService.getDetails(employee.id).pipe(
      map((data: employee) => {
        if (data !== null && data !== undefined) {
          this.selectedEmployee = data;
        }
      })
    ).subscribe();
  }

  setNext(currentEmployee) {
    let indx = this.list.indexOf(currentEmployee);
    if (indx == this.list.length - 1) {
      this.selectedEmployee = this.list[0];
    }
    else {
      this.selectedEmployee = this.list[indx + 1];
    }


  }
  setPrev(currentEmployee) {
    let indx = this.list.indexOf(currentEmployee);
    if (indx == 0) {
      this.selectedEmployee = this.list[this.list.length - 1];
    }
    else {
      this.selectedEmployee = this.list[indx - 1];
    }
  }
  DeleteEmployee(currentEmployee:employee)
  {
    this.EmpoloyeeService.deleteEmployee(currentEmployee.id).subscribe(()=>
      this.EmpoloyeeService.getEmployees().pipe(
        map((data: employee[]) => {
          if (data !== null && data !== undefined) {
            this.list = data;
          }
        })
      ).subscribe()
    );
  }
  firstEve() {
    this.selectedEmployee = this.list[this.list.length - 1];
  }
  
  AddEmployee(employee:employee){
    this.EmpoloyeeService.AddNewEmp(employee).subscribe(()=>
    this.EmpoloyeeService.getEmployees().pipe(
      map((data: employee[]) => {
        if (data !== null && data !== undefined) {
          this.list = data;
        }
      })
    ).subscribe()
    )
  }
  UpdateEmployee(employee:employee){
    this.EmpoloyeeService.UpdateEmp(employee).subscribe(()=>
    this.EmpoloyeeService.getEmployees().pipe(
      map((data: employee[]) => {
        if (data !== null && data !== undefined) {
          this.list = data;
        }
      })
    ).subscribe(()=>this.EmpoloyeeService.getDetails(employee.id).pipe(
      map((data: employee) => {
        if (data !== null && data !== undefined) {
          this.selectedEmployee = data;
        }
      })
    ).subscribe())
    )
  }
}
