({
    /*
     * Get the Current Record Information 
     * Populate the Address informatio based on the FieldAPI provided
     * 
     */ 
    doInit : function(component, event, helper) {
        var recordId = component.get('v.recordId');  
        component.set('v.recordId', recordId);
        component.find('recordViewer').reloadRecord();
        window.setTimeout(
            $A.getCallback(function() {
                var recordData = component.get('v.simpleRecord');
                if(recordData){
                    var streetShort = recordData[component.get('v.streetAPIName')];
                    var locality = recordData[component.get('v.CityAPIName')];
                    var postal_code = recordData[component.get('v.ZipAPIName')];
                    var country = recordData[component.get('v.CountryAPIName')];
                    var state = recordData[component.get('v.StateAPIName')];
                    helper.populateAddress(component, streetShort, locality, postal_code, country, state, false);
                }
                
            }), 1000
        );
    },
    /* Responsible for opening the Modal */
	handleSearch : function(component, event, helper) {
        component.set("v.isOpen", true);
	},
    /* Responsible for Closing the Modal */
    closeModel : function(component, event, helper) {
        component.set("v.isOpen", false);
    },
    /*
     * This function is called when user selects any address
     * and then set the value to the specified fields.
     */ 
    doHandleSelect : function(component, event, helper) {
        component.set("v.isOpen", false);
        var place_Id = event.getParam('place_Id');
        helper.populateZipCode(component, place_Id, helper);
    },
    doHandleChange : function(component, event, helper){
        
        var street = component.get("v.streetValue");
        var city=component.get("v.cityValue");
        var country=component.get("v.countryValue");
        var province=component.get("v.stateValue");
        var postalCode=component.get("v.zipValue");
        helper.populateAddress(component, street, city, postalCode, country, province, true); 
    },
})