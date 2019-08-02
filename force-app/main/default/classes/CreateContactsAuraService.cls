public class CreateContactsAuraService {
	@AuraEnabled
    public static void createContact(List<Contact> contactList, String accountId){
        for(Contact c : contactList)
            c.AccountId = accountId;
        insert contactList;
    }
}