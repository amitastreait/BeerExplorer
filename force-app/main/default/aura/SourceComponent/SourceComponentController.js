({
	executeEvent : function(component, event, helper) {
		var compEvent = component.getEvent('SourceComponent');
        alert(' I am in Source Component ');
        compEvent.fire();
	}
})