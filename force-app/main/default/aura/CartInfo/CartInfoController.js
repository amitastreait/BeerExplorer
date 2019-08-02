({
    goToCart : function(component, event, helper) {
        var action = component.get('c.getCartId');
        // debugger;
        action.setParams({
            'beerList' : component.get('v.beerNameList')
        });
     
        action.setCallback(this, function(response){
            var state = response.getState();
            	 //debugger;
            if(state === 'SUCCESS' || state === 'DRAFT'){
                
                var pageReference = component.find("navigation");
                var pageReferenceNav = {    
                    "type": "standard__component",
                    "attributes": {
                        "componentName": "c__CartDetail"    
                    },    
                    "state": {
                        "cartId": response.getReturnValue()
                    }
                };
                pageReference.navigate(pageReferenceNav, true);
                 debugger;
            }else if(state === 'INCOMPLETE'){
                console.log('User is offline System does not support offline');
            }else if(state ==='ERROR'){
                var errors = response.getError();
                if(errors || errors[0].pageMessage){
                    console.log(' page Error ', errors[0].pageMessage);
                }
                if(errors || errors[0].duplicateResults){
                    console.log(' duplicate Error ', errors[0].duplicateResults);
                }
            }else{
                
            }
        });
        $A.enqueueAction(action);
    },
    createCartItems : function(component, event, helper){
        //console.log(' Selected Beer ', component.get('v.recordList'));
        var names = [];
        for(var i=0; i<component.get('v.recordList').length;  i++){
            names.push(component.get('v.recordList')[i].Id);
        }
        //console.log(names);
        component.set('v.beerNameList', names);
    },
})