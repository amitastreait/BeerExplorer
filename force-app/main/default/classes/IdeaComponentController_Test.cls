@isTest
public with sharing class IdeaComponentController_Test {
    static testMethod void IdeaComponent_UnitTest() {
        List<Community> communityList = [Select Id, Name From Community WHERE IsActive=true 
                                         Order By CreatedDate ASC LIMIT 1];
        try{
            Idea ideaToCreate = new Idea();
            ideaToCreate.Title = 'TestIdea';
            ideaToCreate.CommunityId = communityList[0].Id;
            insert ideaToCreate;
            Test.startTest();
                IdeaComponentController.AllIdeaComments(communityList[0].Id);
                IdeaComponentController.AllIdeas(communityList[0].Id);
                IdeaComponentController.AllIdeas(null);
                IdeaComponentController.AllIdeasByCommunityId(communityList[0].Id);
                IdeaComponentController.AllTopIdeas(communityList[0].Id);
                IdeaComponentController.CommunityForIdea();
                IdeaComponentController.AllRecentIdeas(communityList[0].Id);
                IdeaComponentController.AllRecentIdeas(null);
                IdeaComponentController.AllIdeaComments(null);
                IdeaComponentController.createIdeaVote(ideaToCreate.Id,'Up');
            Test.stopTest();
        }catch(Exception e){
            
        }
        
    }
}