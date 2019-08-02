public with sharing class Utility {
    public Utility() {

    }

    @AuraEnabled(cacheable=true)
    public static List<sObject> getRecordList(String sobjectName, List<String> fieldNames, Integer noOfRecords){
        List<sObject> recordsList = new List<sObject>();
        String fieldsToQuery = String.join(fieldNames,',');
        String query = 'Select Id, '+fieldsToQuery+ ' From '+sobjectName+' Limit '+noOfRecords;
        recordsList = Database.query(query);
        return recordsList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccount(String searchParam){
        String Query = 'Select Id, Name, Phone, Industry From Account Where Name =: searchParam';
        return Database.query(query);
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchParam){
        String key = '%' + searchParam + '%';
        String Query = 'Select Id, Name, Phone, Industry From Account Where Name LIKE :key';
        return Database.query(query);
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchParam){
        String key = '%' + searchParam + '%';
        String Query = 'Select Id, Name, Phone, Fax From Contact Where Name LIKE :key';
        return Database.query(query);
    }
}