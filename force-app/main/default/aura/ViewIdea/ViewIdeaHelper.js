({
	handleChangeHelper : function(component, event) {
        var userId = $A.get("$SObjectType.CurrentUser.Id");
        
        component.set('v.userId', userId);
        component.set('v.isSending' , true);
        var action = component.get('c.displayIdeaDetails');
        var URL = location.href;
        var paramUrl = URL.substring(URL.indexOf('?ideaId'));
        var selector = '?ideaId=';
        var ideaIdFromURL = paramUrl.substring(paramUrl.indexOf(selector)+selector.length, paramUrl.indexOf('&'));

        action.setParams({
            "ideaId" : component.get('v.ideaId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(response.getReturnValue());
            if(state === 'SUCCESS' && component.isValid()){
                component.set('v.isSending' , false);
                component.set('v.hasError', false);
                component.set('v.ideaWithComments' , response.getReturnValue());
            }else{
                console.log('Error While Fetching SOQL On Idea Object:');
                component.set('v.isSending' , false);
                component.set('v.hasError', true);
            }
        });
        $A.enqueueAction(action);
	},
    createCommentHelper : function(component, event){
        var commentText = component.find('comments');
        if(commentText.get('v.value') === undefined || commentText.get('v.value') === null || commentText.get('v.value') === ''){
            commentText.set('v.errors',[{message:"This field is required!"}]);
            component.set('v.hasError', true);
        }else{
            component.set('v.isSending' , true);
            commentText.set('v.errors',null);
            component.set('v.hasError', false);
            var action = component.get('c.postComment');
            var ideaIdx = component.get('v.ideaId');
            var commentBody = commentText.get('v.value');
            action.setParams({
                "ideaId" : ideaIdx,
                "commentBody" : commentBody
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                if(state === 'SUCCESS' && component.isValid()){
                    component.set('v.isSending' , false);
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        message: 'Comment Posted Successfully',
                        type:'success'
                    });
                    toastEvent.fire();
                    $A.get('e.force:refreshView').fire();
                }else{
                    console.log('Error Occured');
                    component.set('v.hasError', true);
                }
            });
            $A.enqueueAction(action);
        }
    },
    deleteIdea : function(component,Event){
        component.set('v.isSending' , true);
        var action = component.get('c.deleteIdea');
        action.setParams({
            "ideaId" : component.get('v.ideaId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
               
                var evt = $A.get("e.force:navigateToComponent");
                evt.setParams({
                    componentDef : "c:IdeaComponent",
                    componentAttributes: {
          
                    }
        });
        evt.fire();
            }else{
                console.log('Error While deleting the Idea:');
                component.set('v.isSending' , false);
                component.set('v.hasError', true);
            }
        });
        $A.enqueueAction(action);
        
    },
    deleteCommenthelper : function(component,Event){
                 var idx = Event.target.id;
        console.log(idx);
        component.set('v.isSending' , true);
        var action = component.get('c.deletecommentFromIdea');
        action.setParams({
            "commentId" :idx
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('###');
            if(state === 'SUCCESS' && component.isValid()){
                console.log('Sucess');
                component.set('v.isSending' , false);
                 var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        
                        message: 'Comment Deleted Successfully',
                        type:'success'
                    });
                    toastEvent.fire();
                    $A.get('e.force:refreshView').fire();
              
            }else{
                console.log('Error While deleting the Idea:');
                component.set('v.isSending' , false);
                component.set('v.hasError', true);
            }
        });
        $A.enqueueAction(action);
        
    }
    
})