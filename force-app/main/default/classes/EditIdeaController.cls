public with sharing class EditIdeaController {
    
    @AuraEnabled
    public static Idea fetchIdeaDetails(String ideaId){
        Idea idea =new Idea();
        if(Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible())
            idea = [Select Id, Title, Body, Categories,Status, CreatorName, NumComments, CommunityId, Community.Name From Idea Where Id=:ideaId];
        return idea;
    }
    @AuraEnabled
    public static IdeaComment fetchIdeaCommentDetails(String ideacomment){
        //system.debug(ideacomment+'$$$$');
        IdeaComment commentIdea =new IdeaComment ();
        if(Schema.sObjectType.IdeaComment.fields.Id.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CommentBody.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.UpVotes.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CreatedDate.isAccessible())
            commentIdea = [Select Id, CommentBody, UpVotes, CreatorName, CreatedDate From IdeaComment Where id =: ideacomment];
        return commentIdea;
    }
    @AuraEnabled
    public static List<String> categoryPickList(){
        List<String> allCategories = new List<String>();
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get('Idea');
        Map<String, Schema.SObjectField> fieldResult_Map = new Map<String, Schema.SObjectField>();
        fieldResult_Map = sObj.getDescribe().fields.getMap();
        List<Schema.Picklistentry> pickListValueList =fieldResult_Map.get('Categories').getDescribe().getpicklistValues();
        for(Schema.Picklistentry sch : pickListValueList){
            allCategories.add(sch.getLabel()+'####'+sch.getValue());
        }
        return allCategories;
    }
    @AuraEnabled
    public static List<String> statusPickList(){
        List<String> statusValues = new List<String>();
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get('Idea');
        Map<String, Schema.SObjectField> fieldResult_Map = new Map<String, Schema.SObjectField>();
        fieldResult_Map = sObj.getDescribe().fields.getMap();
        List<Schema.Picklistentry> pickListValueList =fieldResult_Map.get('Status').getDescribe().getpicklistValues();
        for(Schema.Picklistentry sch : pickListValueList){
            statusValues.add(sch.getLabel()+'####'+sch.getValue());
        }
        return statusValues;
    }
    @AuraEnabled
    public static void updateIdeaRecord(Idea Idearecord){
        if(Schema.sObjectType.Idea.fields.Title.isUpdateable() && 
           Schema.sObjectType.Idea.fields.Body.isUpdateable() &&
           Schema.sObjectType.Idea.fields.Categories.isUpdateable()){
               update Idearecord; 
           }
        
    }
    @AuraEnabled
    public static void updateIdeaCommentRecord(IdeaComment Ideacommentrecords){
        if(Schema.sObjectType.IdeaComment.fields.CommentBody.isUpdateable())     
            update Ideacommentrecords;  
    }
}