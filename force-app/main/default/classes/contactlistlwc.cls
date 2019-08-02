public with sharing class contactlistlwc {
    public contactlistlwc() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> contactRecords(){
        return [Select Id, Name, Email, Phone From Contact LIMIT 10];
    }
}