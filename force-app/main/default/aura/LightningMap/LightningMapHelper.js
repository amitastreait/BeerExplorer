({
    onInit : function(component, event, helper) {
        var action = component.get('c.fetchAccounts');
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if(state === 'SUCCESS' || state === 'DRAFT'){
                var resultData = response.getReturnValue();
                console.log(resultData)
                var mapMarkers = [];
                for(let i = 0; i < resultData.length; i++){
                    mapMarkers.push(
                        {
                            location : {
                                Street: resultData[i].ShippingStreet,
                                City: resultData[i].ShippingCity,
                                State : resultData[i].ShippingState,
                                PostalCode : resultData[i].ShippingPostalCode,
                                Country : resultData[i].ShippingCountry
                            },
                            title:resultData[i].Name,
                            description: resultData[i].Description,
                            icon : 'standard:account'
                        }
                    );
                }
                console.log(' mapMarkers ', mapMarkers)
                component.set('v.mapMarkers',mapMarkers);
                component.set('v.zoomLevel',4 );
            }else{
                var errors = response.getError();
                console.log(' Error ', errors);
            }
        });
        $A.enqueueAction(action);
    }
})