import { LightningElement , track, api, wire} from 'lwc';
//import Engine from 'lwc';
import opportunityList from '@salesforce/apex/OpportunityController.opportunityList';
export default class DynamicLWC extends LightningElement {
    @api oppList;
    @api error;
    @api matchedRecord;
    @track selectedOpportunity;
    /* eslint(no-empty)*/
    /* eslint-disable */

    @wire (opportunityList)
    wiredOpportunity({error, data}){
        if(error){
            this.error = error;
            console.log('error is ', error);
        }if(data){
            
            console.log('Data is ', data);
            this.oppList =JSON.parse(JSON.stringify(data)); //Object.assign({}, data);
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
        console.log('Selected Record ', responseBusiness.value);
        var oppId = event.target.dataset.id;
        
        this.selectedOpportunity = this.oppList.find(
            opp => opp.Id === oppId
        );        
        console.log(` selectedOpportunity ${this.selectedOpportunity} `);
        this.selectedOpportunity.Amount = responseBusiness.value;
        console.log(JSON.stringify(foundElement));
   }

   constructor() {
        super();
        console.log('In Constructor...');
        console.log(this.oppList);
        //opportunityList();
        //console.log(' After Imperative Method ' , this.oppList);
        //console.log(JSON.stringify(this.myContacts.data));
    }

    opportunityFetch(){
        console.log(' Method Called ');
        opportunityList()
            .then((result) =>{
                this.oppList = {...result};//Object.assign({}, result);
                this.error = undefined;
                console.log('Opportunity List ', this.oppList)
            })
            .catch((error) =>{
                this.oppList =undefined;
                this.error = error;
                console.log('Opportunity Error ', this.error)
            });
    }

    connectedCallback() {
        console.log('In connectedCallback()...');
        //console.log(JSON.stringify(this.oppList));
        
    }

    renderedCallback() {
        console.log('In renderedCallback()...');
        //console.log(JSON.stringify(this.oppList));
        //opportunityFetch();
    }

    /* my custom function, will use it later */
    get jsonData() {
        returnJSON.stringify(this.oppList);
    }
}