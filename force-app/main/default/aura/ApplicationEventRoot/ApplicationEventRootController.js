({
	handleEvent : function(component, event, helper) {
		alert('I am in Application Root');
        event.stopPropagation();
	}
})