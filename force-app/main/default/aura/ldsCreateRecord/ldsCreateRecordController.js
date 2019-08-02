({
    doInit : function(component, event, helper) {
        component.find('recordCreator').getNewRecord(
            'Beer__c',
            null,
            false,
            $A.getCallback(function(){
                var record = component.get('v.record');
                var error = component.get('v.recordError');
                if(error || (record === null)){
                    console.log(' Error while creating the template ',error);
                }else{
                    console.log(' Successfuly Created');
                    //alert('Templated Initiated');
                }
            })
        );
    },
    handleSave : function(component, event, helper) {
        component.set('v.recordFields.Id__c','974643');
        component.find('recordCreator').saveRecord(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT'){
                var showToast = $A.get('e.force:showToast');
                showToast.setParams({
                    "title" : "Record Saved",
                    "type" : "success",
                    "message" : "Beer Record Has been Save with the Record Id "+saveResult.id
                });
                showToast.fire();
            } else if(saveResult.state === 'INCOMPLETE'){
                
            }else if(saveResult.state === 'ERROR'){
                
            }else{
                
            }
        });
    }
})