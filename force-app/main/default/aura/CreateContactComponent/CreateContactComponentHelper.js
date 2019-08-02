({
	validateFields : function(component, event, helper) {
        var isValid = component.find('newContact').reduce(function(validFields, inputComp){
            inputComp.showHelpMessageIfInvalid();
            inputComp.set('v.validity', {valid:false, badInput :true});
            return validFields && inputComp.get('v.validity').valid;
        }, true);
        return isValid;
	}
})