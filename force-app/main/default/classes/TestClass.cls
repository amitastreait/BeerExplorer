public class TestClass{
public static void addLoc(Account[] accounts) {

   for (Account a :accounts){
if(a.NumberofLocations__c==null)
a.NumberofLocations__c=0;
else
      a.NumberofLocations__c +=3;

  

}

}
}