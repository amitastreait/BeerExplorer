@isTest
public with sharing class EditIdeaController_Test {
    public static testMethod void editIdea_UnitTest(){
        List<Community> communityList = [Select Id, Name From Community WHERE IsActive=true 
                                         Order By CreatedDate ASC LIMIT 1];
        Try{
            Idea ideaToCreate = new Idea();
            ideaToCreate.Title = 'TestIdea';
            ideaToCreate.CommunityId = communityList[0].Id;
            insert ideaToCreate;
            IdeaComment comment = new IdeaComment();
            comment.IdeaId = ideaToCreate.Id;
            comment.CommentBody = 'commentBody';
            insert comment;
            Test.startTest();
                EditIdeaController.categoryPickList();
                EditIdeaController.statusPickList();
            	EditIdeaController.fetchIdeaDetails(ideaToCreate.Id);
            	EditIdeaController.updateIdeaRecord(ideaToCreate);
            	EditIdeaController.fetchIdeaCommentDetails(comment.Id);
            	EditIdeaController.updateIdeaCommentRecord(comment);
            Test.stopTest();
        }catch(Exception e){
            
        }
        
    }
}