({
    doInit : function(component, event, helper) {
        /* Step 1*/
        var action = component.get('c.getContactList');
        action.setStorable();
        //action.setForeGround();
        //action.setBackGround();
        /* Optional  /* Step 2*/ 
        action.setParams({
            accountId : component.get('v.recordId'),
        });
        /* Step 4*/
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue();
            console.log('responseValue ', responseValue);
            component.set('v.contactList', responseValue);
        });
        /* Step 3*/
        $A.enqueueAction(action, false);
    },
    doRedirect : function(component, event, helper) {
        var eventSource = event.getSource();
        var id = eventSource.get('v.name');
        
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": id,
            "slideDevName": "detail"
        });
        navEvt.fire();
    },
    handleCompEvent : function(component, event, helper) {
        var availableContact = component.get('v.contactList');
        var ContactRecord = event.getParam('ContactRecord');
        console.log(ContactRecord)
        availableContact.push(ContactRecord);
        component.set('v.contactList',availableContact);
    },
    loded : function(component, event, helper) {
        alert('Scripts Loaded ');
    }
})