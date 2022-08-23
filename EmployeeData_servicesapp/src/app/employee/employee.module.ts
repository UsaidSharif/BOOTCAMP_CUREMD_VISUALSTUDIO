import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmployeeContainerComponent } from './employee-container/employee-container.component';
import { EmployeeListComponent } from './employee-list/employee-list.component';
import { EmployeeDetailComponent } from './employee-detail/employee-detail.component';
import { AddEmployeeComponent } from './add-employee/add-employee.component';
import { ReactiveFormsModule } from '@angular/forms';



@NgModule({
  declarations: [
    EmployeeContainerComponent,
    EmployeeListComponent,
    EmployeeDetailComponent,
    AddEmployeeComponent

  ],
  imports: [
    CommonModule,
    ReactiveFormsModule
  ],
  exports: [
    EmployeeContainerComponent
  ]
})
export class EmployeeModule { }
