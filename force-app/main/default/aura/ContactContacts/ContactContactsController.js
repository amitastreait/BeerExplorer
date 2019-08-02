({
	doHandleEvent : function(component, event, helper) {
        //alert('Event Handled ');
		var conRecord = event.getParam('conReord');
        console.log('conRecord ', conRecord);
        var contactList = component.get('v.contactList');
        if(contactList){
            contactList.push(conRecord);
            component.set('v.contactList', contactList);
        }else{
            contactList = [];
            contactList.push(conRecord);
            component.set('v.contactList', contactList);
            //alert('Test ');
        }
        
	},
    handleSave : function(component, event, helper) {
        var action = component.get('c.createContact');
        action.setParams({
            contactList : component.get('v.contactList'),
            accountId : component.get('v.recordId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' || state === 'DRAFT'){
                $A.get('e.force:refreshView').fire();
            }else if(state === 'INCOMPLETE'){
                
            }else if(state === 'ERROR'){
                var errors = response.getError();
                console.log(' errors ', errors);
            }else{
                
            }
        },'ALL');
        $A.enqueueAction(action);
    },
    handleSelectEvent : function(component, event, helper) {
        //alert('Event Handled ');
        var selectedRecord = event.getParam('Contact');
        console.log(' selectedRecord ', selectedRecord.FirstName);
        var createContact = component.find('createContact');
        createContact.selectRecord(selectedRecord);
    }
})