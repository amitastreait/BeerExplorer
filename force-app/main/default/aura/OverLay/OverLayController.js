({
    createModal : function(component, event, helper) {
        component.find('overLayLib').showCustomModal({
            header: "Application Confirmation",
            body: 'THis is test', 
            footer:'Footer ',
            showCloseButton: true,
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
    navigateURL : function(component, event, helper) {
        var pageReference = component.find("navigation");
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__BeerExplorer"    
            },    
            "state": {
                "myAttr": "attrValue"    
            }
        };
        pageReference.navigate(pageReferenceNav);
    },
    handleLoad : function(component, event, helper) {
        
    },
    handleSubmit : function(component, event, helper) {
        alert('Submit handled');
    },
    handleSuccess : function(component, event, helper) {
        
    },
    createButton : function(component, event, helper) {
         $A.createComponent(
            "lightning:button",
            {
                "aura:id": "findableAuraId",
                "label": "Press Me",
                "onclick": component.getReference("c.handleSubmit")
            },
            function(newButton, status, errorMessage){
                if (status === "SUCCESS") {
                    alert(status);
                    var body = component.get("v.body");
                    body.push(newButton);
                    component.set("v.body", body);
                }else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                } else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
    },
})