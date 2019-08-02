({
    doInit : function(component, event, helper) {
        
        var action = component.get('c.fetchIdeaCommentDetails');
        var IDEAcommentId = component.get('v.CommentId');
        
        action.setParams({
            "ideacomment" : IDEAcommentId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                var responseValue = response.getReturnValue();
                component.set('v.IdeaCommentRecord', responseValue);
            }
            else{
				comsole.log('Error');                
            }
        });
        $A.enqueueAction(action);
        
    },
    updateIdeacomment : function(component, event, helper) {
          var isValid = true;
        var commentBodyComponent = component.find('commentBody');      
        if(commentBodyComponent.get('v.value')==undefined || commentBodyComponent.get('v.value')==''){
            isValid = false;
            component.set('v.hasError',true);
            commentBodyComponent.set('v.errors',[{message:"Comment Body Can not be empty"}]);
        }else{
            commentBodyComponent.set('v.errors',null);
            component.set('v.hasError',false);
        }
		if(isValid){
        
        var action = component.get('c.updateIdeaCommentRecord');
        var IDEAcommentRecord = component.get('v.IdeaCommentRecord');
        IDEAcommentRecord.sobjectType='IdeaComment';
        action.setParams({
            "Ideacommentrecords" : IDEAcommentRecord
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                var cmpTarget = component.find('Modalbox1');
                var cmpBack = component.find('Modalbackdrop1');
                $A.util.removeClass(cmpBack, 'slds-backdrop--open');
                $A.util.removeClass(cmpTarget, 'slds-fade-in-open'); 
                $A.get('e.force:refreshView').fire(); 
            }
            else{
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
                
            }
        });
        $A.enqueueAction(action);
    }
    }
    
})