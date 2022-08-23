import { Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { employee } from '../employee.model';
import { Form, FormBuilder, FormGroup, Validators } from '@angular/forms';
@Component({
  selector: 'app-employee-detail',
  templateUrl: './employee-detail.component.html',
  styleUrls: ['./employee-detail.component.css']
})
export class EmployeeDetailComponent implements OnInit {
  updateForm: FormGroup;
  @Input() currentEmployee: employee;
  @Output() nextEvent = new EventEmitter<employee>();
  @Output() prevEvent = new EventEmitter<employee>();
  @Output() delEvent = new EventEmitter<employee>();
  @Output() firstEvent = new EventEmitter<employee>();
  @Output() updateEvent = new EventEmitter<employee>();
  updateEmp: employee;
  isshowDiv: boolean=true;
  @ViewChild('scrollMe') private myScrollContainer: ElementRef;

  constructor(private formBuilder:FormBuilder) { }

  nextFunc(currentEmployee){
  this.nextEvent.emit(currentEmployee);
  }

  prevFunc(currentEmployee){
    this.prevEvent.emit(currentEmployee);
    }
  ngOnInit(): void {
    this.updateForm=this.formBuilder.group({
      name:['',[Validators.required]],
      gender:['',[Validators.required]],
      role:['',[Validators.required]]
    });
  }
  firstFunc(currentEmployee){
    this.firstEvent.emit(currentEmployee);
  }
  delEmp(currentEmployee){
    this.delEvent.emit(currentEmployee);
  }
  UpdateEmp(){

    this.isshowDiv = (!this.isshowDiv);
    this.scrollToBottom();
  }
  onSubmit(currentEmployee:employee){
    this.updateEmp={
      
      id:currentEmployee.id,
      name: this.updateForm.get('name').value,
      gender: Boolean(this.updateForm.get('gender').value),
      role: this.updateForm.get('role').value

    }
    this.updateEvent.emit(this.updateEmp);
  }
  onCancel(){
    this.isshowDiv = (!this.isshowDiv);
  }
  scrollToBottom(): void {
    try {
        this.myScrollContainer.nativeElement.scrollTop = this.myScrollContainer.nativeElement.scrollHeight;
    } catch(err) { }                 
}
}
