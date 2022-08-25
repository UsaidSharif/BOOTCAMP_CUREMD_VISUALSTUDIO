import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Country } from '../Model/Country';
import { FormInput } from '../Model/FormInput';
import { map } from 'rxjs/operators';
import { PenaltyService } from '../Services/penalty.service';
import { FormOutput } from '../Model/FormOutput';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent implements OnInit {
    myForm: FormGroup;
    input: FormInput;
    CountryList: Country[];
    formOutput: FormOutput;
    constructor(private fb: FormBuilder, private PenaltyService: PenaltyService) { }

    ngOnInit(): void {

        this.myForm = this.fb.group({

            startDate: ['', [Validators.required]],
            endDate: ['', [Validators.required]],
            id: ['Please Select Country', [Validators.required]]
        })

        this.PenaltyService.GetCountries().pipe(map((data: Country[]) => {
            if (data != null && data != undefined) {
                this.CountryList = data;
            }
        })).subscribe();
             

        
        
            
    }
    onSubmit() {
        console.log("hello")
        this.input = {
            startDate: this.myForm.get('startDate').value,
            endDate: this.myForm.get('endDate').value,
            id: parseInt(this.myForm.get('id').value)
        }
        console.log(this.input)
        this.PenaltyService.GetPenalty(this.input).pipe(map((data: FormOutput) => {
            if (data != null && data != undefined) {
                this.formOutput = data;
            }



        })).subscribe();
        console.log(this.formOutput);
        this.myForm.patchValue({
            startDate: '',
            endData: '',
            country:'Please Select Country'
        })

    }
    
}
