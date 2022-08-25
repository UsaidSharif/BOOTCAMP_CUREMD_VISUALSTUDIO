import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';
import { Country } from '../Model/Country';
import { FormOutput } from '../Model/FormOutput';
import { FormInput } from '../Model/FormInput';

@Injectable({
  providedIn: 'root'
})
export class PenaltyService {

    constructor(private http: HttpClient) { }

    GetCountries(): Observable<Country[]> {
        return this.http.get<Country[]>('api/penalty/GetCountry');
    }
    GetPenalty(input: FormInput): Observable<FormOutput> {
        return this.http.post<FormOutput>('api/penalty/GetPenalty', {
            startDate: input.startDate,
            endDate: input.endDate,
            id: input.id

        })
    }
 
}
