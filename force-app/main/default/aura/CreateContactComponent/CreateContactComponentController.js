({
	handleReview : function(component, event, helper) {
		var isValid = helper.validateFields(component, event, helper);
        if(isValid){
            var componetEvent = component.getEvent('CreateContacts');
            component.set('v.ContactRecord.AccountId', component.get('v.recordId'));
            componetEvent.setParams({
                'conReord' : component.get('v.ContactRecord')
            });
            componetEvent.fire();
        }else{
            alert('Please fill all required fields');
        }
	},
    selectRecord : function(component, event, helper) {
        //alert('in create contact component ');
        var params = event.getParam('arguments');
        if(params){
            var contactRecord = params.contact;
            console.log(' contactRecord ', contactRecord.LastName);
            component.set('v.ContactRecord', contactRecord);
        }
    }
})