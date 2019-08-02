({
    init: function (cmp, event, helper) {
        var action = cmp.get('c.getAccList');
        action.setCallback(this, function(response){
            var state = response.getState();
            //alert(state);
            if( state === 'SUCCESS'){
                var responseValue = response.getReturnValue();
                var mapArray = [];
                for(var i = 0; i < responseValue.length; i++){
                    console.log(' responseValue ', responseValue[i]);
                    mapArray.push(
                        {
                                location: {
                                    City: responseValue[i].ShippingCity,
                                    Country: responseValue[i].ShippingCountry,
                                    PostalCode: responseValue[i].ShippingPostalCode,
                                    State: responseValue[i].ShippingState,
                                    Street: responseValue[i].ShippingStreet
                                },
                        
                                icon: 'standard:account',
                                title: responseValue[i].Name
                        }
                    );
                }
                cmp.set('v.mapMarkers', mapArray);
                cmp.set('v.center', {
                    location: {
                        City: 'Denver'
                    }
                });
                
                cmp.set('v.zoomLevel', 4);
                cmp.set('v.markersTitle', 'Salesforce locations in United States');
                cmp.set('v.showFooter', true);
                //cmp.set('v.zoomLevel', 10);
            }
        });
        $A.enqueueAction(action);
    }
})