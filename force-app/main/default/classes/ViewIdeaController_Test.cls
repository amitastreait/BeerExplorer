@isTest
public with sharing class ViewIdeaController_Test {
    public static testMethod void viewIdea_UnitTest(){
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
            	ViewIdeaController.displayIdeaDetails(ideaToCreate.Id);
            	ViewIdeaController.postComment(ideaToCreate.Id, 'commentBody');
            	ViewIdeaController.deletecommentFromIdea(comment.id);
            	ViewIdeaController.deleteIdea(ideaToCreate.Id);
            Test.stopTest();
        }catch(Exception e){
            
        }
    }
}