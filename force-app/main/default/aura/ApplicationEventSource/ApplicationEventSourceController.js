({
	executeEvent : function(component, event, helper) {
        alert('Application Source Component');
        var applicationEvent = $A.get('e.c:ApplicationEvent');
        applicationEvent.fire();
	}
})