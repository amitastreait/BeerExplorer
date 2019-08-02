({
	createIdea : function(component, event, helper) {
		helper.createIdea(component, event);
	},
    doInit : function(component, event, helper) {
        helper.setCommunity(component);
        helper.setCategory(component);
        helper.setStatus(component);
    },
    handleChange : function(component,event){
        var titleComponent = component.find('titleInput');
        var descriptionComponent = component.find('Description');
        var categoriesComponent = component.find('Categories');
        var zoneComponent = component.find('zone'); 
        
        component.set('v.hasError',false);
        
        titleComponent.set('v.value','');
        titleComponent.set('v.errors',null);
        
        descriptionComponent.set('v.value','');
        descriptionComponent.set('v.errors',null);
        
        /*categoriesComponent.set('v.options','');
        categoriesComponent.set('v.errors',null);
        */
        zoneComponent.set('v.value','');
        zoneComponent.set('v.errors',null);
    },
})