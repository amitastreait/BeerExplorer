({
    doInit : function(component, event, helper) {
        var pageReference = component.get('v.pageReference');
        if(pageReference){
            var state = pageReference.state;
            alert(state.beerId);
            component.set('v.beerId', state.beerId);
            component.find("recordEditor").reloadRecord();
        }
        component.find("newRecordCreator").getNewRecord(
            "Beer_Order__c", 
            null,      
            false,    
            $A.getCallback(function() {
                var rec = component.get("v.newRecordObject");
                var error = component.get("v.newRecordError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec.sobjectType);
                }
            })
        );
    },
    handleSubmit : function(component, event, helper) {
        var beerRecord = component.get('v.simpleRecord');
        console.log('beerRecord Price', beerRecord.Price__c);
        console.log('beerRecord Tag', beerRecord.Tag__c);
        
        var quantity = component.get('v.beerOrder.Ordered_Quantity__c');
        console.log('Ordered price ', quantity);
        var totalPrice = parseInt(beerRecord.Price__c)*parseInt(quantity);
        console.log(' totalPrice ', totalPrice);
        var isValid = helper.validateForm(component, event, helper);
        if(component.get("v.beerOrder.Billing_Same_as_Shipping__c")){
            component.set('v.beerOrder.Billing_Street__c', component.get('v.beerOrder.Shipping_Street__c'));
            component.set('v.beerOrder.Billing_City__c', component.get('v.beerOrder.Shipping_City__c'));
            component.set('v.beerOrder.Billing_Country__c', component.get('v.beerOrder.Shipping_Country__c'));
            component.set('v.beerOrder.Billing_State__c', component.get('v.beerOrder.Shipping_State__c'));
            component.set('v.beerOrder.Billing_Postal_Code__c', component.get('v.beerOrder.Shipping_Postal_Code__c'));
            
        }
        if(!isValid)
            return;
        var userId = $A.get("$SObjectType.CurrentUser.Id");
        //alert(userId);
        component.set("v.beerOrder.Beer__c", component.get("v.beerId"));
        component.set("v.beerOrder.Ordered_By__c", userId); 
        component.set("v.beerOrder.Order_Amount__c", parseInt(totalPrice));
        component.find("newRecordCreator").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Order Placed",
                    "message": "Your Order has been successfully placed. " ,
                    "type" : "success"
                });
                resultsToast.fire();
                helper.updateBeerQty(component, event,quantity, saveResult.recordId);
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving contact, error: ' + 
                            JSON.stringify(saveResult.error));
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Error While Placing Your Order.",
                    "message": JSON.stringify(saveResult.error),
                    "type" : "success"
                });
                resultsToast.fire();
            } else {
                console.log('Unknown problem, state: ' + saveResult.state +
                            ', error: ' + JSON.stringify(saveResult.error));
            }
        });
    },
})