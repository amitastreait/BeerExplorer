@isTest
public class AllAccounts_MapControllerUnitTest {
    public static testMethod void accountQueryTest(){
        Account acc = TestUtility.prepareAccount();
        insert acc;
       	Account acc1 = TestUtility.prepareAccount();
        insert acc1;
        
        Test.startTest();
        List<Account> accList = AllAccounts_MapController.getAccList();
        System.assertEquals(2, accList.size(), 'No of Accounts are not returned as Expected');
        Test.stopTest();
    }
}