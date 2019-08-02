({
	upvoteIdea : function(component, event, helper){
        helper.doUpvoteDownvoteIdea(component, event, helper, 'Up');
    },
    downvoteIdea : function(component, event, helper){
        helper.doUpvoteDownvoteIdea(component, event, helper, 'Down');
    },
    doInit : function(component, event, helper){
        helper.onInit(component, event, helper);
    }
})