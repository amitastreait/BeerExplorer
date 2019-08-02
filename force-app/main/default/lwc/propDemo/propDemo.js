import { LightningElement, api, track } from 'lwc';

export default class PropDemo extends LightningElement {
    greetMessage = 'Hello Amit'; //private
    @api myVar = 'This is test Var'; // can be accessible from any other lwc
    @track anitherVar = 'Test value'; // private

    changeValues(){
        this.myVar = "LWC Demo";
        this.greetMessage = "Demo Value";
        this.anitherVar = "DEmo Value ";
    }
}