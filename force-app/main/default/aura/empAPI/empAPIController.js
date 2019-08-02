({
    onInit : function(component, event, helper) {
        const empApi = component.find('empApi');
        empApi.setDebugFlag(true);
        empApi.onError($A.getCallback(error => {
            console.error('EMP API error: ', JSON.stringify(error));
        }));
    },
    subscribe : function(component, event, helper) {
        const empApi = component.find('empApi');
        const channel = component.find('channel').get('v.value');
        const replayId = -1;
        console.log('sub');
        empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
            console.log('Received event ', JSON.stringify(eventReceived));
        })).then(subscription => {
            console.log('Subscribed to channel ', subscription.channel);
            component.set('v.subscription', subscription);
        });
    },
    unsubscribe : function(component, event, helper) {
        const empApi = component.find('empApi');
        const subscription = component.get('v.subscription');
        empApi.unsubscribe(subscription, $A.getCallback(unsubscribed => {
          console.log('Unsubscribed from channel '+ unsubscribed.subscription);
          component.set('v.subscription', null);
        }));
    }
})