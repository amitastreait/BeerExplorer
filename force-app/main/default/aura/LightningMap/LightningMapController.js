({
	doInit : function(component, event, helper) {
        var mapMarkers = [{
            location : {
                Street: "525 S. Lexington Ave",
                City: "Burlington",
                State : "NC",
                PostalCode : "27215",
                Country : "USA"
            },
            title:"The white house",
            description: "Test description",
            icon : 'standard:account'
        }];
        
        helper.onInit(component, event, helper);
	}
})