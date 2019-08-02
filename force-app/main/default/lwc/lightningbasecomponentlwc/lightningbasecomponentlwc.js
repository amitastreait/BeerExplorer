/* eslint-disable no-console */
/* eslint-disable no-alert */
import { LightningElement, api, wire, track } from 'lwc';
import opportunityList from '@salesforce/apex/OpportunityController.opportunityList';
export default class Lightningbasecomponentlwc extends LightningElement {
    @api progress = 30;
    @track inputVal;
    @api inputVal1;
    @wire(opportunityList) oppList;
    /*
        oppList.data,
        oppList.error => array of errors
    */

    handleClick(event){
        event.preventDefault();
        alert(' I am clicked ');
        /* To get the value from input */
        /*

            Variables in JavaScript
            1 - var => global ( We can anywhere in the same file)
            2 - const => 
            3 - let => Avaialable within scope

        */
        const inputComp =  this.template.querySelectorAll('lightning-input');

        console.log(' inputComp ', inputComp[1].value);

        for(let i = 0; i < inputComp.length; i++){
            if(inputComp[i].name === 'amit'){
                this.inputVal = inputComp[i].value;
            }else if(inputComp[i].name === 'moiana'){
                this.inputVal1 = inputComp[i].value;
            }
        }

    }

    inputValue(event){
        this.inputVal = event.target.value;
    }   
}