import { LightningElement, wire } from 'lwc';
import contactRecords from '@salesforce/apex/contactlistlwc.contactRecords';
export default class Contactlistlwc extends LightningElement {
    //@api contacts;

    @wire(contactRecords) contacts;

    
}