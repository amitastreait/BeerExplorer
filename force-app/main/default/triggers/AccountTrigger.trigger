trigger AccountTrigger on Account (before insert, before update, before delete,
                                    after insert, after update, after undelete, after delete) {
                                
    If(Trigger.isBefore){
        If(Trigger.isInsert){
        For(Account acc : Trigger.New){
                acc.Name ='Updated Name Insert';
            }
            System.debug(' Size '+Trigger.New.size());
            System.debug(' I am inside before insert ');
        }else if(Trigger.isUpdate){
            For(Account acc : Trigger.New){
                    acc.Name ='Updated Name Upate';
                }
            System.debug(' I am inside before update ');
        }else if(Trigger.isDelete){
            System.debug(' I am inside before delete ');
        }
        System.debug(' Before Events ');
        System.debug(' Trigger New '+Trigger.New);
        System.debug(' Trigger old'+Trigger.old);
        System.debug(' Trigger oldMap'+Trigger.oldMap);
        System.debug(' Trigger NewMap '+Trigger.newMap);
    }else if(Trigger.isAfter){
        If(Trigger.isInsert){
            System.debug(' I am inside after insert ');
        }else if(Trigger.isUpdate){
            System.debug(' I am inside after update ');
           
        }else if(Trigger.isDelete){
            System.debug(' I am inside after delete ');
        }
        System.debug(' After Events ');
        System.debug(' Trigger New '+Trigger.New);
        System.debug(' Trigger old'+Trigger.old);
        System.debug(' Trigger oldMap'+Trigger.oldMap);
        System.debug(' Trigger NewMap '+Trigger.newMap);
    }
                                    
    
    
    

}