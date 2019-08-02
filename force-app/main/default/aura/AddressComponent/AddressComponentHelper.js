({
    populateAddress : function(component, streetShort, locality, postal_code, country, administrative_area_level_1, isChanged) {
        var sObject = component.get('v.sObjectType');
        sObject[component.get('v.streetAPIName')] = streetShort;
        sObject[component.get('v.ZipAPIName')] = postal_code;
        sObject[component.get('v.CityAPIName')] = locality;
        sObject[component.get('v.StateAPIName')] = administrative_area_level_1;
        sObject[component.get('v.CountryAPIName')] = country;
        component.set('v.sObjectType', sObject);
        var test = component.get('v.sObjectType');
        console.log(test.Street__c);
        if(!isChanged){
            component.set("v.streetValue", streetShort);
            component.set("v.cityValue", locality);
            component.set("v.countryValue", country);
            component.set("v.stateValue", administrative_area_level_1);
            component.set("v.zipValue", postal_code);
        }
    },
    populateZipCode : function(component, place_Id, helper) {
        var action = component.get('c.fetchZipCode');
        var apiKey = $A.get("$Label.c.API_Key");
        var endPoint = $A.get("$Label.c.PlaceAPI");
        console.log(' apiKey ', apiKey);
        /*console.log(' place_Id ', place_Id);
        console.log(' endPoint ', endPoint);*/
        var addressVar = "&key="+apiKey+"&fields=address_component,formatted_address";
        let endPointToMakeCall = endPoint+place_Id+addressVar;
        console.log(endPointToMakeCall);
        action.setParams({
            endPoint : endPointToMakeCall
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            var responseValue = JSON.parse(response.getReturnValue());
            console.log(responseValue);
            if( state === 'SUCCESS' && responseValue && responseValue.result ){
                var address_components = responseValue.result.address_components;
                //console.log(address_components);
                for(let i=0; i < address_components.length; i++){
                    var type = address_components[i].types;
                    if(type.includes('street_number')){
                        var street_number = address_components[i].short_name;
                    }
                    if(type.includes('route')){
                        var route = address_components[i].long_name;
                    }
                    if(type.includes('locality')){
                        var locality = address_components[i].short_name;
                    }
                    if(type.includes('administrative_area_level_2')){
                        var administrative_area_level_2 = address_components[i].short_name;
                    }
                    if(type.includes('administrative_area_level_1')){
                        var administrative_area_level_1 = address_components[i].short_name;
                    }
                    if(type.includes('country')){
                        var country = address_components[i].short_name;
                    }
                    if(type.includes('postal_code')){
                        var postal_code = address_components[i].short_name;
                    }
                    if(type.includes('neighborhood')){
                        var neighborhood = address_components[i].short_name;
                    }
                    if(type.includes('sublocality_level_2')){
                        var sublocality_level_2 = address_components[i].short_name;
                    }
                    if(type.includes('sublocality_level_3')){
                        var sublocality_level_3 = address_components[i].short_name;
                    }
                    if(type.includes('sublocality_level_1')){
                        var sublocality_level_1 = address_components[i].short_name;
                    }
                    
                }
                if( country === 'US' || country !== "IN"){
                    var streetShort = '';
                    if(street_number)
                        streetShort += street_number;
                    if(route)
                   		streetShort += ' '+route;
                }else if(country === 'IN'){
                    var streetShort ='';
                    if(route){
                        streetShort += route;
                    }
                    if(neighborhood){
                        streetShort += ' '+neighborhood;
                    }
                    if(sublocality_level_3){
                        streetShort += ' '+ sublocality_level_3;
                    }
                    if(sublocality_level_2){
                        streetShort += ' '+ sublocality_level_2;
                    }
                    if(sublocality_level_1){
                        streetShort += ' '+ sublocality_level_1;
                    }
                }
                helper.populateAddress(component, streetShort, locality, 
                                       postal_code, country, 
                                       administrative_area_level_1
                                      , false);
            }else if( state === 'INCOMPLETE' ){
                console.log('User if Offline! System does not support Offline')
            }else if( state === 'ERROR' ){
                var errors = response.getError();
                if(errors || errors[0].message){
                    console.log(' Error Occured ', errors[0].message);
                }
            }else{
                
            }
        });
        
        $A.enqueueAction(action);
        
    },
})