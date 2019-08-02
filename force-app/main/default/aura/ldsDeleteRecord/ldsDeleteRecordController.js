({
	handleDelete : function(component, event, helper) {
        component.find('recordHandler').deleteRecord($A.getCallback(function(deleteResult){
            if(deleteResult.state === 'SUCCESS' || deleteResult.state === 'DRAFT'){
                var showToast = $A.get('e.force:showToast');
                showToast.setParams({
                    "title" : "Record Saved",
                    "type" : "success",
                    "message" : "Beer Record Has been Deleted "
                });
                showToast.fire();
                var pageReference = component.find('naveReference');
                var pageReferenceNav = {
                    type: 'standard__objectPage',
                    attributes: {
                        objectApiName: 'Beer__c',
                        actionName: 'list'
                    },
                    state: {
                        
                    }
                };
                pageReference.navigate(pageReferenceNav);
            } else if(deleteResult.state === 'INCOMPLETE'){
                
            }else if(deleteResult.state === 'ERROR'){
                
            }else{
                
            }
        }));
    }
})