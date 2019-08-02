import { LightningElement, track } from 'lwc';
import findContacts from '@salesforce/apex/Utility.findContacts';
export default class ImperativeApex extends LightningElement {
    @track contacts;
    @track error;
    @track searchKey;

    searchContacts(){
        findContacts({
            searchParam : this.searchKey
        })
        .then( (data) => {
            this.contacts = data;
            this.error = undefined;
        })
        .catch( (error) => {
            this.contacts = undefined;
            this.error = error;
        });
    }

    changeValue(event){
        event.preventDefault();
        this.searchKey = event.target.value;
    }
}