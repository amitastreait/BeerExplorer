import { LightningElement, api, track, wire } from 'lwc';
import { showToast } from 'c/utils';
import getRecordList from '@salesforce/apex/Utility.getRecordList';
export default class AccountList extends LightningElement {
    @api recordList;
    @api error;
    @track fieldstoQuery = ['Name', 'Industry' ];
    @api sobjectName = 'Account';
    @api noOfRecords = 10;
    /* eslint-disable */

    @wire(getRecordList, {
        sobjectName : '$sobjectName',
        fieldNames : '$fieldstoQuery',
        noOfRecords : '$noOfRecords'
    })
    wiredRecords({ error, data }){
        if(data){
            console.log(' Data ', data)
            const eventSuccess = showToast('dismissable',
                                        'success',
                                        'Record Loaded', 
                                        'Record Loaded'
            );
            this.dispatchEvent(eventSuccess);
            this.recordList = data;
        }
        if(error){
            console.log(' Error occured ', error)
            this.error = error;
            const eventSuccess = showToast('dismissable',
                                    'error',
                                    'Error Occured', 
                                    JSON.stringify(error)
            );
            this.dispatchEvent(eventSuccess);
        }
    }
    showToast(){
        const eventSuccess = showToast('dismissable',
                                    'success',
                                    'Record Loaded', 
                                    'Record Loaded'
        );
        this.dispatchEvent(eventSuccess);
    }
    
    
}