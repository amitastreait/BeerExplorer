public without sharing class IdeaComponentController {
    @AuraEnabled
    public static List<Idea> AllIdeas(String CommunityId){
        List<Idea> ideasList = new List<Idea>();
        
        IF(CommunityId=='None' || CommunityId=='undefined' || CommunityId==null){
            List<Community> idealst = new List<Community>();
            if(Schema.sObjectType.Community.fields.ID.isAccessible()&&
               Schema.sObjectType.Community.fields.IsActive.isAccessible()&&
               Schema.sObjectType.Community.fields.Name.isAccessible())
                	idealst =[Select Id, Name From Community WHERE IsActive=true Order By CreatedDate ASC LIMIT 1];
            if(idealst!=null && idealst.size()>0) CommunityId = idealst[0].id;
            
        }
        //System.debug('CommunityId '+CommunityId);
        if(Schema.SObjectType.Idea.isQueryable() && 
           Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorSmallPhotoUrl.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteScore.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteTotal.isAccessible() &&
           Schema.sObjectType.Idea.fields.Status.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatedDate.isAccessible()){
               ideasList = [Select Id, Title,IsHtml,Body,CommunityId,CreatorName, 
                            CreatorSmallPhotoUrl, VoteScore, VoteTotal,
                            Status,NumComments, CreatedDate,
                            (Select Id, Type, CreatedbyId From Votes)
                            From Idea Where CommunityId=:CommunityId LIMIT 50000];
           }
        return ideasList;
    }
    
    @AuraEnabled
    public static List<Idea> AllIdeasByCommunityId(String CommunityId){
        List<Idea> ideasList = new List<Idea>();
        if(Schema.SObjectType.Idea.isQueryable() && 
           Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorSmallPhotoUrl.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteScore.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteTotal.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatedDate.isAccessible()){
               ideasList = [Select Id, Title,IsHtml,Body,CommunityId,CreatorName, 
                            NumComments,CreatorSmallPhotoUrl, VoteScore, VoteTotal,
                            (Select Id, Type, CreatedbyId From Votes),
                            CreatedDate From Idea Where CommunityId=:CommunityId LIMIT 50000];
           }
        return ideasList;
    }
    
    @AuraEnabled
    public static List<Idea> AllTopIdeas(String CommunityId){
        List<Idea> ideasList = new List<Idea>();
        IF(CommunityId=='None' || CommunityId=='undefined' || CommunityId==null){
            List<Community> idealst = new List<Community>();
            IF(Schema.sObjectType.Community.fields.ID.isAccessible()&&
               Schema.sObjectType.Community.fields.IsActive.isAccessible()&&
               Schema.sObjectType.Community.fields.Name.isAccessible())
                idealst =[Select Id, Name From Community WHERE IsActive=true Order By CreatedDate ASC LIMIT 1];
            if(idealst!=null && idealst.size()>0) CommunityId = idealst[0].id;
        }
        
        if(Schema.SObjectType.Idea.isQueryable() && 
           Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorSmallPhotoUrl.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteScore.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteTotal.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatedDate.isAccessible()){
               ideasList = [Select Id, Title,IsHtml,Body,CommunityId,CreatorName, 
                            NumComments,CreatorSmallPhotoUrl, VoteScore, VoteTotal,
							(Select Id, Type, CreatedbyId From Votes),
                            CreatedDate From Idea Where VoteTotal>=150 AND 
                            CommunityId=:CommunityId LIMIT 50000];
           }
        
        return ideasList;
    }
    
    @AuraEnabled
    public static List<String> CommunityForIdea(){
        List<String> allComminuties = new List<String>();
        List<Community> idealst = new List<Community>();
        IF(Schema.sObjectType.Community.fields.ID.isAccessible()&&
           Schema.sObjectType.Community.fields.IsActive.isAccessible()&&
           Schema.sObjectType.Community.fields.Name.isAccessible())
            idealst =[Select Id, Name,IsActive From Community WHERE IsActive=true ];  
        For(Community s : idealst){
            allComminuties.add(s.Id+'####'+s.Name);
        }
        return allComminuties;
    }
    
    @AuraEnabled
    public static List<Idea> AllRecentIdeas(String CommunityId){
        List<Idea> ideasList = new List<Idea>();
        system.debug('CommunityId '+CommunityId);
        IF(CommunityId=='None' || CommunityId=='undefined' || CommunityId==null){
            List<Community> idealst = new List<Community>();
            IF(Schema.sObjectType.Community.fields.ID.isAccessible()&&
               Schema.sObjectType.Community.fields.IsActive.isAccessible()&&
               Schema.sObjectType.Community.fields.Name.isAccessible())
                idealst = [Select Id, Name From Community WHERE IsActive=true Order By CreatedDate ASC LIMIT 1];
            if(idealst!=null && idealst.size()>0) CommunityId = idealst[0].id;
        }
        
        if(Schema.SObjectType.Idea.isQueryable() && 
           Schema.sObjectType.Idea.fields.ID.isAccessible() &&
           Schema.sObjectType.Idea.fields.Title.isAccessible() &&
           Schema.sObjectType.Idea.fields.Body.isAccessible()&&
           Schema.sObjectType.Idea.fields.Categories.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorName.isAccessible() &&
           Schema.sObjectType.Idea.fields.NumComments.isAccessible() &&
           Schema.sObjectType.Idea.fields.CommunityId.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatorSmallPhotoUrl.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteScore.isAccessible() &&
           Schema.sObjectType.Idea.fields.VoteTotal.isAccessible() &&
           Schema.sObjectType.Idea.fields.CreatedDate.isAccessible()){
               ideasList = [Select Id, Title,IsHtml,Body,CommunityId,CreatorName, LastViewedDate, 
                            NumComments,CreatorSmallPhotoUrl, VoteScore, VoteTotal,
                            (Select Id, Type, CreatedbyId From Votes),CreatedDate 
                            From Idea Where LastViewedDate=THIS_WEEK AND CommunityId=:CommunityId LIMIT 50000];
           } 
        
        return ideasList;
    }
    
    @AuraEnabled
    public static List<IdeaComment> AllIdeaComments(String CommunityId){
        List<IdeaComment> ideaCommentList = new List<IdeaComment>();
        Set<Id> ideasIdsSet = new Set<Id>();
        System.debug('CommunityId '+CommunityId);
        IF(CommunityId!='None' && CommunityId!='undefined' && CommunityId!=null){
            if(Schema.SObjectType.IdeaComment.isQueryable()&& 
               Schema.sObjectType.IdeaComment.fields.Id.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.CommentBody.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.UpVotes.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.CreatorName.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.IdeaId.isAccessible()){
                   ideaCommentList = [Select Id, CommentBody,CreatorName,CreatedDate, IdeaId,Idea.NumComments, Idea.Title From IdeaComment Where CommunityId=:CommunityId LIMIT 50000];
               }
        }else{
            List<Community> idealst = new List<Community>();
            IF(Schema.sObjectType.Community.fields.ID.isAccessible()&&
               Schema.sObjectType.Community.fields.IsActive.isAccessible()&&
               Schema.sObjectType.Community.fields.Name.isAccessible())
                idealst =[Select Id, Name,IsActive From Community WHERE IsActive=true ];  
            For(Community s : idealst ){
                ideasIdsSet.add(s.Id);
            }
            if(Schema.SObjectType.IdeaComment.isQueryable()&& 
               Schema.sObjectType.IdeaComment.fields.Id.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.CommentBody.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.UpVotes.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.CreatorName.isAccessible() &&
               Schema.sObjectType.IdeaComment.fields.IdeaId.isAccessible()){
                   ideaCommentList = [Select Id, CommentBody,CreatorName,CreatedDate, IdeaId,Idea.NumComments, Idea.Title From IdeaComment Where CommunityId=:ideasIdsSet LIMIT 50000];
               }
        }
        return ideaCommentList;
    }
    
    @AuraEnabled
    public static void createIdeaVote(String parentId, String voteType){
        Vote ideaVote = new Vote(
            	ParentId = parentId,
            	Type = voteType
        );
        if(Schema.sObjectType.Vote.fields.ParentId.isCreateable()
          && Schema.sObjectType.Vote.fields.Type.isCreateable()){
            insert new List<Vote>{ideaVote};
        }
    }
}