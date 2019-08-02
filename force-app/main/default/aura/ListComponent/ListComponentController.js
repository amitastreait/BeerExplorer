({
	doSelect : function(component, event, helper) {
        var index = event.currentTarget.id;
        var selectedRecord = component.get('v.recordList')[index];
        //console.log(' selectedRecord ', selectedRecord);
        var selectEvent = component.getEvent('selectEvent');
        var selRecordList = component.get('v.selectedRecordList');
        if(selRecordList){
            var i = selRecordList.indexOf(selectedRecord);
            if(i === -1){
               selRecordList.push(selectedRecord);
            }
        }else{
            selRecordList = [];
            selRecordList.push(selectedRecord);
        }
        for(let i=0; i<selRecordList.length; i++){
            //selRecordList[i].Name = selRecordList[i][component.get('v.fieldName')]
        }
        console.log(selRecordList);
        component.set('v.selectedRecordList', selRecordList);
        selectEvent.setParams({
            record : selRecordList
        });
        selectEvent.fire();
	},
    handleRemove : function(component, event, helper) {
        var eventSource = event.getSource();
        var index = eventSource.get('v.name');
        var selRecordList = component.get('v.selectedRecordList');
        selRecordList.splice(index, 1);
        component.set('v.selectedRecordList', selRecordList);
        var selectEvent = component.getEvent('selectEvent');
        selectEvent.setParams({
            record : selRecordList
        });
        selectEvent.fire();
    }
})