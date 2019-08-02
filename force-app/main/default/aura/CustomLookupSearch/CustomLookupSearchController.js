({
	handleKeyUp : function(component, event, helper) {
		var searchText = component.find('enter-search').get('v.value');
        var searchEvent = component.getEvent('LookupEvent');
        searchEvent.setParams({
            searchText : searchText
        });
        searchEvent.fire();
	}
})