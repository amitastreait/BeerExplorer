({
    /*
     * This function is responsible for taking the search input 
     * and then making the REST API call to the Google server
     * and then returning all the predictions related to input String
     */ 
	handleChange : function(component, event, helper) {
		helper.makeApiCall(component, event, helper);
	},
    /*
     * This function is responsible to find the selected address
     * and then send that selected address to the parent component
     */ 
    onSelectAddress : function(component, event, helper) {
        var index = event.currentTarget.id;
        var componentEvent = component.getEvent("addressEvent");
        var addressPredicitons = component.get('v.predictions');
        var selectedAddress = addressPredicitons[index];
        //component.set('v.modalBodyAttributeName', selectedAddress);
        componentEvent.setParams({
            selectedAddress : selectedAddress.value,
            place_Id : selectedAddress.place_Id
        })
        componentEvent.fire();
    },
})