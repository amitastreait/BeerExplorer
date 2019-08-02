({
	doClick : function(component, event, helper) {
		
		/* alert(component.isValid());//true
        alert(component.getName()); 
        alert(component.get('v.Whom'));*/
        component.set('v.Whom' , "Test Value");
        var ageComp = component.find('testInput');
        //alert(ageComp.get('v.value'));
        ageComp.set('v.value',67);
        // 2 parameters
        // key - Attribute
        // Value - That we wanted to be set in the attribute
	}
})