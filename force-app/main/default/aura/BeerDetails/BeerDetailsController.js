({
	doOrder : function(component, event, helper) {
        var pageReference = component.find("navigation");
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__CreateBeerOrder"    
            },    
            "state": {
                "beerId": component.get('v.beerId') ,
                "beerName" : component.get('v.beerName')
            }
        };
        pageReference.navigate(pageReferenceNav);
	}
})