import { Injectable } from '@angular/core';
import {employee} from './employee.model';
import { HttpClient } from "@angular/common/http"
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmpoloyeeService {
  getEmployees():Observable<employee[]>{
    return this.httpClient.get<employee[]>('http://localhost/EmployeeAngularAPI/api/values');
  }
  getDetails(id: string | Number):Observable<employee>{
    return this.httpClient.get<employee>('http://localhost/EmployeeAngularAPI/api/values/'+id)
  }
 deleteEmployee(id):Observable<void>{
    return this.httpClient.delete<void>('http://localhost/EmployeeAngularAPI/api/values/'+id)
  }
  AddNewEmp(employee: employee): Observable<void>{
    return this.httpClient.post<void>("http://localhost/EmployeeAngularAPI/api/values",{
      id: employee.id,
      name: employee.name,
      gender: employee.gender,
      role: employee.role

    })
  }
  UpdateEmp(employee:employee)
  {
    return this.httpClient.put<void>("http://localhost/EmployeeAngularAPI/api/values/"+employee.id,{
      
      name: employee.name,
      gender: employee.gender,
      role: employee.role

    })
  }
  constructor(private httpClient:HttpClient) { }
}
