({
	createComponent : function(component, event, helper) {
		$A.createComponent(
            "lightning:input",
            {
                "aura:id" : "testInput",
                "label" : "Dynamic Input",
                "onchange" : component.getReference('c.dynamicAction')
            },
            function(inputComp, status, statusMessage){
                var body = component.get('v.body');
                console.log(status);
                console.log(statusMessage);
                body.push(inputComp);
                component.set('v.body',body);
            }
        );
	},
    dynamicAction : function(component, event, helper){
        alert('Test Action ');
    },
    createComponentMultiple : function(component, event, helper) {
        var componentsList = [];
        componentsList.push(
        	[
                "lightning:input",
                {
                    "aura:id" : "testInput22",
                    "label" : "Dynamic Input22",
                    "onchange" : component.getReference('c.dynamicAction')
                }
            ],
            [
                "lightning:button",
                {
                    "aura:id" : "tstButton",
                    "label" : "Dynamic Button",
                    "variant" : "brand",
                    "onclick" : component.getReference('c.dynamicAction')
                }
            ]
        );
        $A.createComponents(
        	componentsList,
            function(inputComp, status, statusMessage){
                var body = component.get('v.body');
                console.log(status);
                console.log(inputComp);
                body.push(inputComp[0]);
                body.push(inputComp[1]);
                component.set('v.body',body);
            }
        );
    }
})