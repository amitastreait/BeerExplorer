public with sharing class CreateIdeaController {
    @AuraEnabled
    public static ideaResponseWrapper postIdeaLightning(String Title, String Description, String Category, 
                                                        String ZoneId, String status){
        String baseURL = System.URL.getSalesforceBaseUrl().toExternalForm();
        ideaResponseWrapper response;
        //System.debug('#### Category '+Category);
        Idea idea = new Idea();
        idea.Title = Title;
        idea.Body = Description;
        idea.CommunityId = ZoneId;
        idea.Categories = Category;
        idea.status = status;
        try{
            //System.debug('#### idea = '+idea);
            if(Schema.sObjectType.Idea.fields.Title.isCreateable() && 
            Schema.sObjectType.Idea.fields.Body.isCreateable() &&
            Schema.sObjectType.Idea.fields.CommunityId.isCreateable() &&
            Schema.sObjectType.Idea.fields.Categories.isCreateable())
            insert idea;
            response = new ideaResponseWrapper(true, baseURL+'####'+idea.Id,'');
        }catch(System.Exception e){
            System.debug('Exception Executed'+e.getStackTraceString());
            response = new ideaResponseWrapper(false, '',e.getStackTraceString());
        }
        return response;
    }
    
    @AuraEnabled
    public static List<String> CommunityForIdeas(){
        List<String> allComminuties = new List<String>();
        allComminuties.add('####None');
        List<Community> communityList=new List<Community>();
        if(Schema.sObjectType.Community.fields.ID.isAccessible()&&
        Schema.sObjectType.Community.fields.IsActive.isAccessible()&&
        Schema.sObjectType.Community.fields.Name.isAccessible())
        communityList=[SELECT Id,IsActive,Name FROM Community Where IsActive=true];
        For(Community s : communityList){
            allComminuties.add(s.Id+'####'+s.Name);
        }
        return allComminuties;
    }
    
    @AuraEnabled
    public static List<String> categoryPickList(){
        List<String> allCategories = new List<String>();
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get('Idea');
        Map<String, Schema.SObjectField> fieldResult_Map = new Map<String, Schema.SObjectField>();
        fieldResult_Map = sObj.getDescribe().fields.getMap();
        List<Schema.Picklistentry> pickListValueList =fieldResult_Map.get('Categories').getDescribe().getpicklistValues();
        for(Schema.Picklistentry sch : pickListValueList){
            allCategories.add(sch.getLabel()+'####'+sch.getValue());
        }
        return allCategories;
    }
    
    @AuraEnabled
    public static List<String> statusPickList(){
        List<String> allCategories = new List<String>();
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get('Idea');
        Map<String, Schema.SObjectField> fieldResult_Map = new Map<String, Schema.SObjectField>();
        fieldResult_Map = sObj.getDescribe().fields.getMap();
        List<Schema.Picklistentry> pickListValueList =fieldResult_Map.get('Status').getDescribe().getpicklistValues();
        for(Schema.Picklistentry sch : pickListValueList){
            allCategories.add(sch.getLabel()+'####'+sch.getValue());
        }
        return allCategories;
    }
     
    public with sharing class ideaResponseWrapper{
        
        @AuraEnabled
        public  Boolean isSuccess { get; set; }
        @AuraEnabled
        public  String resultMessage { get; set; }
        @AuraEnabled
        public  String errorMessage { get; set; }
        
        public ideaResponseWrapper(Boolean isSuccess, String resultMessage, String errorMessage){
            this.isSuccess = isSuccess;
            this.resultMessage = resultMessage;
            this.errorMessage = errorMessage;
        }
    }
}