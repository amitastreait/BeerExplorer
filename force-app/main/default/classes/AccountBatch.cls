global with sharing class AccountBatch implements Database.Batchable<sObject>{
    public String Query { get; set; }
    global AccountBatch(String objectName){
        // Dynamic Query Start ..
        String theQuery = 'SELECT ';
        SObjectType accountType = Schema.getGlobalDescribe().get(objectName);
        Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
        
        For(String theName : mfields.keySet()){
            If(mfields.get(theName).getDescribe().isUpdateable() &&
               mfields.get(theName).getDescribe().isAccessible() &&
               mfields.get(theName).getDescribe().isCreateable()){
                   theQuery += theName + ',' ;
               }
        }
         System.debug('#### theQuery '+theQuery);
        // Trim last comma
        theQuery = theQuery.subString(0, theQuery.length() - 1);
        System.debug('#### theQuery '+theQuery);
        // Finalize query string
        theQuery = ' From '+objectName+' Limit 1';
        //theQuery += ' FROM Account WHERE Id = \'00128000016cBci\'';
        Query = theQuery;
    }
    
    // Start MEthod
    global Database.queryLocator start(Database.BatchableContext BC){
        System.debug('#### theQuery = '+Query);
        return Database.getQueryLocator('Select Id, Name From Account LIMIT 1');
    }
    
    // execute method
    
    global void execute(Database.BatchableContext BC, List<Account> scope){
        
        List<Account> accountList = scope;
        List<Account> accList = new List<Account>();
        Account a = accountList[0];
        For(Integer i=1;i<1000; i++){
            Account a1 = a.clone();
            a1.Name=a.Name+i;
            //a1.EID__c = a.EID__c+i;
            accList.add(a1);
        }
        //insert accList;
    }
    
    //finish method
    global void finish(Database.BatchableContext BC){
         //futureTest.getName('Finish Future Called..');
         System.enqueueJob(new AsyncExecutionExample());
    }
}