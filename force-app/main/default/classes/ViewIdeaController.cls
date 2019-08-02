public class ViewIdeaController {
    @AuraEnabled
    public static ViewIdeaWrapper displayIdeaDetails(String ideaId){
        ViewIdeaWrapper responseWrapper;
        Idea idea=new Idea();
        if(Schema.SObjectType.Idea.isQueryable() && 
           Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteTotal.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatedDate.isAccessible())
            idea = [Select Id, Title, Body, Categories, CreatorName, NumComments, VoteTotal
                    From Idea Where Id=:ideaId];
        List<IdeaComment> commentList=new List<IdeaComment>();
        if(Schema.sObjectType.IdeaComment.fields.Id.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CommentBody.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.UpVotes.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CreatedDate.isAccessible())
            commentList = [Select Id, CommentBody, UpVotes, CreatorName, CreatedDate From IdeaComment Where IdeaId =: ideaId];
        List<Vote> voteList = new List<Vote>();
        if(Schema.sObjectType.Vote.fields.Id.isAccessible() &&
           Schema.sObjectType.Vote.fields.CreatedById.isAccessible() &&
          	Schema.sObjectType.Vote.fields.Type.isAccessible() ){
            voteList = [Select Id, Type, CreatedbyId From Vote Where ParentId =: ideaId];
        }
        responseWrapper = new ViewIdeaWrapper(idea, commentList,voteList);
        return responseWrapper;
    }
    
    @AuraEnabled
    public Static String postComment(String ideaId, String commentBody){
        IdeaComment comment = new IdeaComment();
        comment.IdeaId = ideaId;
        comment.CommentBody = commentBody;
        if(Schema.sObjectType.IdeaComment.fields.IdeaId.isCreateable() && 
           Schema.sObjectType.IdeaComment.fields.CommentBody.isCreateable())
            insert comment;
        return null;
    }
    @AuraEnabled
    public static void deleteIdea(String ideaId){
        Idea idea =new Idea();
        if(Schema.SObjectType.Idea.isQueryable() && 
           Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatedDate.isAccessible())
            idea= [Select Id, Title, Body, Categories, CreatorName, NumComments From Idea Where Id=:ideaId];
        IF(Schema.sObjectType.Idea.isDeletable())
            delete idea;
        
    }
    @AuraEnabled
    public static String deletecommentFromIdea(String commentId){
        IdeaComment comment=NEW IdeaComment ();
        if(Schema.SObjectType.IdeaComment.isQueryable()&& 
           Schema.sObjectType.IdeaComment.fields.Id.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CommentBody.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.UpVotes.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.IdeaComment.fields.IdeaId.isAccessible())
            comment = [Select Id, CommentBody, UpVotes, CreatorName, CreatedDate From IdeaComment Where id =: commentId];
        IF(Schema.sObjectType.IdeaComment.isDeletable())
            delete comment;
        return 'Success';
    }
}