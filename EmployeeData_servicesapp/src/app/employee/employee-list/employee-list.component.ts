import { useAnimation } from '@angular/animations';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { employee } from '../employee.model';
import { EmpoloyeeService } from '../empoloyee.service';
@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit {
@Input() showList:employee[];
@Output() clickedEmployee = new EventEmitter<employee>();

onEmployeeClick(employeeList: employee){
  this.clickedEmployee.emit(employeeList);
}
  constructor() { }
  ngOnInit(): void {
  }
}
