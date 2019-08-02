({
	handleCompEvent : function(component, event, helper) {
		var searchParam = event.getParam('searchText');
        var action = component.get('c.searchBeer');
        action.setParams({
            searchParam : searchParam
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var responseValue = response.getReturnValue();
                console.log(' responseValue ', responseValue);
                component.set('v.beerList', responseValue);
            }else{
                console.log(response.getError())
            }
        });
        $A.enqueueAction(action);
        
	},
    
    updateCart : function(component, event, helper){
        var params = event.getParam('beerRecord');
        //component.set('v.beerRecord', beerRecord);
        var headerComp = component.find('headerComp');
        headerComp.updateCart(params);
    },
})