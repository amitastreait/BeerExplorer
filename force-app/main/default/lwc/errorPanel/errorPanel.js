import { LightningElement, api, track } from 'lwc';


export default class ErrorPanel extends LightningElement {
    /** Generic / user-friendly message */
    @api friendlyMessage = 'Error retrieving data';

    @track viewDetails = false;

    /** Single or array of LDS errors */
    @api errors;

    get errorMessages() {
        return this.errors;
    }

    handleCheckboxChange(event) {
        this.viewDetails = event.target.checked;
    }
}