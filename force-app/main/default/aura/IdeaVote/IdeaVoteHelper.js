({
	doUpvoteDownvoteIdea : function(component, event, helper, upvote){
    	var idx = event.target.id;
        
        var action = component.get('c.createIdeaVote');
        action.setParams({
            parentId : idx,
            voteType : upvote
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS' && component.isValid()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type" : "success",
                    "message": "Your Vote has been acknowledge successfully."
                });
                toastEvent.fire();
                $A.get("e.force:refreshView").fire();
            }else if(state === 'ERROR'){
                var error = response.getError();
                console.log(response.getError());
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type" : "error",
                    "mode" : "sticky",
                    "message": "There was an error. "+JSON.stringify(error)
                });
                toastEvent.fire();
            }else{
                console.log('UNKNOWN ERROR');
            }
        });
        $A.enqueueAction(action);
	},
    onInit : function(component, event, helper){
        let userId = component.get('v.userId');
        let votes = component.get('v.Votes');
        for(let i =0; i< votes.length; i++){
            if(votes[i].CreatedById === userId){
                if(votes[i].Type =='Up'){
                    component.set('v.isVoted', true);
                }else{
                    component.set('v.isVoted', false);
                }
                component.set('v.isFound', true);
                break;
            }
        }
    }
})