// wireFunction.js
import { LightningElement, api, track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class WireFunction extends LightningElement {
    @api recordId;
    @track record;
    @track error;

    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name'] })
    wiredAccount({ error, data }) {
        if (data) {
            this.record = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }
    get name() {
        return this.record.fields.Name.value;
    }
}