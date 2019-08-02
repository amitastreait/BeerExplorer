public class LightningMapAuraServices {
	@AuraEnabled
    public static List<Account> fetchAccounts(){
         List<Account> accList = new List<Account>();
        accList = [Select Id, Name, ShippingStreet, ShippingCity, ShippingState,
                   ShippingPostalCode, ShippingCountry,Description From Account 
                  Where ShippingStreet!=null AND ShippingCity!= null AND ShippingState != null
                  AND ShippingPostalCode!= null AND ShippingCountry!=null];
        return accList;
    }
}