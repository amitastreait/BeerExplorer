({
    doInit : function(component, event, helper) {
        var options = [{ label: 'English', value: 'en' },
        { label: 'German', value: 'de' },
        { label: 'Spanish', value: 'es' },
        { label: 'French', value: 'fr' },
        { label: 'Italian', value: 'it' },
        { label: 'Japanese', value: 'ja' }];
        component.set('v.options', options);
    },
    createContact : function(component, event, helper) {
        var createRecord = $A.get('e.force:createRecord');
        createRecord.setParams({
            "entityApiName" : "Contact",
            "defaultFieldValues": {
                'AccountId' : component.get('v.recordId'),
                'Email' : 'amitasinghsfdc@gmail.com'
            }
        });
        createRecord.fire();
        
    },
    editRecord : function(component, event, helper) {
        var editRecord = $A.get('e.force:editRecord');
        editRecord.setParams({
            "recordId" : component.get('v.recordId')
        });
        editRecord.fire();
        
    },
    handleChange: function (cmp, event) {
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue.toString() + "'");
    },
})