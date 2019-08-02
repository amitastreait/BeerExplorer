({
    handleShowModal: function(component, evt, helper) {
        var modalBody;
        var modalfOOTER;
        $A.createComponents(
            [
                ["c:LightningLayout",{}],
                ["c:DataTable",{}]
            ],
            function(content, status, statusMessage) {
                if (status === "SUCCESS") {
                    modalBody = content[0];
                    modalfOOTER = content[1];
                    component.find('overlayLib').showCustomModal({
                        header: "Custom Modal Heder",
                        body: modalBody, 
                        showCloseButton: true,
                        footer : modalfOOTER,
                        cssClass: "mymodal",
                        closeCallback: function() {
                            alert('You closed the alert!');
                        }
                    })
                }                               
            });
    },
    handleShowPopover : function(component, event, helper) {
        component.find('overlayLib').showCustomPopover({
            body: "Popovers are positioned relative to a reference element",
            referenceSelector: ".mypopover"
        });
    }
})