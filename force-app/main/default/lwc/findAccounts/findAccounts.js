import { LightningElement, wire, track } from 'lwc';

import findAccount from '@salesforce/apex/Utility.findAccount';
import findAccounts from '@salesforce/apex/Utility.findAccounts';

export default class FindAccounts extends LightningElement {
    @track accounts;
    @track error;
    @track searchKey
    @track selectedAccount;

    @wire(findAccounts, {
        searchParam : '$searchKey'
    })
        wiredAccount({ data, error}){
            if(data){
                this.accounts = data;
                this.error = undefined;
            }
            if(error){
                this.error = error;
                this.data = undefined;
            }
        }

    searchAccount(){
        findAccount({
            searchParam : this.searchKey
        })
        .then( (data) => {
            this.accounts = data;
            this.error = undefined;
        })
        .catch( (error) => {
            this.error = error;
            this.data = undefined;
        });
    }

    valueChange(event){
        event.preventDefault();
        const searchKey = event.target.value;
        this.searchKey = searchKey; 
    }

}