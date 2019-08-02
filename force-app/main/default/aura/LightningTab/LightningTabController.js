({
	handleActive : function(component, event, helper) {
		var tab = event.getSource();
        var tabId = tab.get('v.id');
        //alert(tabId);
        switch (tabId) {
            case 'Account' :
                component.set('v.accInfo','Account Information goes here');
                break;
            case 'case' :
                break;
            case 'contact':
                break;
            case 'opp':
                break;
        }
	}
})