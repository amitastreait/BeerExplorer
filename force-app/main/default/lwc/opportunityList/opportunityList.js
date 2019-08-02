import { LightningElement, api, wire, track } from 'lwc';
import opportunityList from '@salesforce/apex/OpportunityController.opportunityList';
export default class OpportunityList extends LightningElement {
    @api oppList;
    @api error;
    @api matchedRecord;
    /* eslint(no-empty)*/
    /* eslint-disable */
    @wire (opportunityList)
      wiredOpportunity({error, data}){
        if(error){
            this.error = error;
            console.log('error is ', error);
        }if(data){
            /* eslint-disable */
            console.log('Data is ', data);
            this.oppList ={...data}; //Object.assign({}, data);
        }
    }

    @track options = [
        { label: '10K', value: 10000 },
        { label: '30K', value: 30000 }
     ];
    /* eslint-disable*/
    statusChanged(event){
         let responseBusiness = event.detail; 
         console.log(event.target.dataset.id);
         console.log(responseBusiness.value);
         
         var foundElement = this.oppList.find(function (element){
             console.log(' element '+element.StageName)
             return element.Id == event.target.dataset.Id;
         });
         
         console.log(' foundElement ', foundElement)
         foundElement.Amount = responseBusiness.value;
         console.log(JSON.stringify(foundElement));
    }
}