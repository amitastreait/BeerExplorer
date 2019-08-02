({
    doInit: function(component, event, helper) {
        
        component.find("recordEditor").getNewRecord(
            "Address_Book__c", 
            null,      
            false,    
            $A.getCallback(function() {
                var rec = component.get("v.record");
                var error = component.get("v.recordError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec.sobjectType);
                }
            })
        );
    },
    doSaveAddress : function(component, event, helper){
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved.",
                    "type" : "success",
                    messageTemplate: 'Record {0} created! See it {1}!',
                    messageTemplateData: ['Address Book', {
                        url: '/'+saveResult.recordId,
                        label: 'here',
                    }
                                         ]
                });
                resultsToast.fire();
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' + 
                            JSON.stringify(saveResult.error));
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Error",
                    "message": 'Problem saving record, error: ' + 
                            JSON.stringify(saveResult.error)
                });
                resultsToast.fire();
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
    }
})