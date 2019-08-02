public with sharing class OpportunityController {
    public OpportunityController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> opportunityList(){
        List<Opportunity> opportunityL = [Select Id, Name, StageName, Amount From Opportunity Limit 10];
        return opportunityL;
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> searchOpportunitybyName(String Name){
        List<Opportunity> opportunityL = [Select Id, Name, StageName, Amount From Opportunity Limit 10];
        return opportunityL;
    }
}