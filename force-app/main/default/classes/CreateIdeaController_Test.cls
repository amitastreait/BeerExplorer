@isTest
public with sharing class CreateIdeaController_Test {
    public static testMethod void insertNewIdea_UnitTest(){
        List<Community> communityList = [Select Id, Name From Community WHERE IsActive=true 
                                         Order By CreatedDate ASC LIMIT 1];
        Test.startTest();
        	CreateIdeaController.categoryPickList();
        	CreateIdeaController.CommunityForIdeas();
        	CreateIdeaController.statusPickList();
        	CreateIdeaController.postIdeaLightning('Test idea', 'Description', '', communityList[0].Id, '');
        Test.stopTest();
    }
}