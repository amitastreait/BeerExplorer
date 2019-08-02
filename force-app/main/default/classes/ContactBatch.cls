global class ContactBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        String Query = 'Select Id, Name From Contact Limit 10';
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext BC, List<Contact> contactList){
        for(Contact con : contactList){
            con.FirstName = 'Updated Batch';
        }
        update contactList;
    }
    global void finish(Database.BatchableContext BC){
        System.debug(' ### Finish Executed ');
    }
}