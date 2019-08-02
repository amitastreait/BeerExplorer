@isTest
public class ContactListControllerUnitTest {
    public static testMethod void getContactListTest(){
        Account acc = TestUtility.prepareAccount();
        insert acc;
        
        Contact con = TestUtility.prepareContact();
        con.AccountId = acc.Id;
        insert con;
        
        test.startTest();
        	ContactListController.getContactList(acc.Id);
        Test.stopTest();
    }
    
    public static testMethod void createContactTest(){
        Account acc = TestUtility.prepareAccount();
        insert acc;
        
        Contact con = TestUtility.prepareContact();
        
        Test.startTest();
        	ContactListController.createContact(con, acc.Id);
        Test.stopTest();
        
        
    }
}