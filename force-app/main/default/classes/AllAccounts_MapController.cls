public class AllAccounts_MapController {
    @AuraEnabled
    public static List<Account> getAccList(){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name, ShippingStreet, ShippingCity, ShippingState,
                   ShippingPostalCode, ShippingCountry From Account 
                  Where ShippingStreet!=null AND ShippingCity!= null AND ShippingState != null
                  AND ShippingPostalCode!= null AND ShippingCountry!=null];
        return accList;
    }
}