({
    doInit : function(component, event, helper) {
        helper.onInit(component, event, helper);
    },
	showAllIdeas : function(component, event, helper) {
		helper.displayAllIdeas(component, event, helper);
	},
    showRecentIdeas : function(component, event, helper){
        helper.recentIdeas(component);
    },
    showTopIdeas : function(component, event, helper){
        helper.TopIdeas(component);
    },
    showIdeasComment : function(component, event, helper){
        helper.IdeasComment(component);
    },
    addCommentToIdea : function(component, event, helper){
        
    }, 
    closeModal : function(component, event, helper){  
        helper.closeModal(component, event);
    },
    openModal : function(component, event, helper){  
        helper.openModal(component, event);
    },
    updateIdeaList : function(component, event, helper){ 
        var communityId = component.find('zone').get('v.value');
        helper.updateIdeaList(component, communityId);
    },
    refreshPage : function(component, event, helper){ 
        helper.closeModal(component, event);
        $A.get('e.force:refreshView').fire();
    },
    previous : function(component, event, helper){ 
        helper.previous(component, event);
    },
    next : function(component, event, helper){ 
        helper.next(component, event);
    },
    viewIdea : function(component, event, helper){ 
        helper.displayIdea(component, event);
    },
    
})