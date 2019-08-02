({
	doSerach : function(component, event, helper) {
		var componentEvent = component.getEvent('BeerEvent');
        var searchParam = component.find('searchInput').get('v.value');
        componentEvent.setParams({
            searchText : searchParam
        });
        componentEvent.fire();
	}    
})