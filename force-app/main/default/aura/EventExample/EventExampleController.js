({
	doChange : function(component, event, helper) {
		//alert('Value Changed');
	},
    Changevalue : function(component, event, helper) {
        component.set('v.test','Test');
        // compoent.getEvent('');
        var aeEvent = $A.get('e.c:aeEvent');
        aeEvent.fire();
    },
    doInit : function(component, event, helper) {
        component.set('v.test','On Init');
    }
})