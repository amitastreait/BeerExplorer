public class ContactListController {

    @AuraEnabled
    public static List<Contact> getContactList(String accountId){
        List<Contact> contactList = new List<Contact>([Select Id, FirstName, LastName, Name, Email, Phone 
                                                       From Contact Where Email != null AND AccountId =: accountId]);
        return contactList;
    }
    
    @AuraEnabled
    public static Contact createContact(Contact con, Id AccountId){
        con.AccountId = AccountId;
        insert con;
        return con;
    }
}