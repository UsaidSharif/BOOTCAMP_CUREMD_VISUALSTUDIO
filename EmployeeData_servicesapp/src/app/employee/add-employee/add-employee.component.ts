import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Form, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { employee } from '../employee.model';

@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.css']
})
export class AddEmployeeComponent implements OnInit {

  addForm:FormGroup;
  newEmployee:employee;
  @Output() addEvent=new EventEmitter<employee>();
  cancelEvent:boolean=true;

  constructor(private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.addForm=this.formBuilder.group({
      name:['',[Validators.required]],
      gender:['',[Validators.required]],
      role:['',[Validators.required]]
    });
  }

  onSubmit(){
    console.log(this.addForm.get('gender').value);
    let bool=(Boolean(this.addForm.get('gender').value));
    this.newEmployee={
      id:0,
      name:this.addForm.get('name').value,
      gender:bool,
      role:this.addForm.get('role').value,
    }
    
    this.addEvent.emit(this.newEmployee);
  }
  onCancel(){
    this.cancelEvent=true;
  }
  isShow(){
    this.cancelEvent=!this.cancelEvent;
  }

}
