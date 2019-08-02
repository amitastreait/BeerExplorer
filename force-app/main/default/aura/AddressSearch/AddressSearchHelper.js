({
    makeApiCall : function(component, event, helper) {
        var searchValue = component.find('addressValue').get('v.value');
        var apiKey = $A.get("$Label.c.API_Key");
        var endPoint = $A.get("$Label.c.Endpoint"); 
        var radius = $A.get("$Label.c.radius"); 
        var language = $A.get("$Label.c.language");
        var endPointToCall = endPoint+'key='+apiKey+'&sessiontoken='+Math.random()+'&radius='+radius+'&language='+language+'&input=';
        console.log('endPointToCall ', endPointToCall);
        var action = component.get('c.findPlaces');
        action.setParams({
            endPointURL : endPointToCall,
            input : searchValue
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            var responseValue = JSON.parse(response.getReturnValue());
            console.log(!responseValue.isSuccess);
            if( state === 'SUCCESS' && responseValue.isSuccess && responseValue.prediction){
                component.set('v.errorMessage', null);
                var pred = [];
                var predictions = responseValue.prediction;
                for(let i=0; i< predictions.length; i++){
                    var predict =  predictions[i];
                    pred.push({
                        label : predictions[i].split(',')[0],
                        value : predictions[i].split('####')[0],
                        place_Id : predictions[i].split('####')[1],
                    });
                }
                component.set('v.predictions', pred);
            }else if( state === 'INCOMPLETE' ){
                console.log('User if Offline! System does not support Offline');
                component.set('v.errorMessage', 'User if Offline! System does not support Offline');
            }else if( state === 'ERROR' || !responseValue.isSuccess ){
                var errors = response.getError();
                if(errors && responseValue.isSuccess){
                    console.log(' Error Occured ', errors);
                    component.set('v.errorMessage',JSON.stringify(errors));
                }else if(!responseValue.isSuccess ){
                    console.log(' Error Occured ', responseValue.errorMessage);
                    component.set('v.errorMessage',responseValue.errorMessage);
                }
            }else{
                
            }
        });
        $A.enqueueAction(action);
    }
})