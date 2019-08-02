@isTest
public class TestUtility {
    
    public static Account prepareAccount(){
        Account acc = New Account();
        acc.Name = 'Test Account';
        acc.ShippingStreet = '123 Street';
        acc.ShippingCity ='Test';
        acc.ShippingState = 'UP';
        acc.ShippingPostalCode = '122022';
        acc.ShippingCountry = 'IN';
        return acc;
    }
    
    public static Contact prepareContact(){
        Contact con = new Contact();
        con.FirstName = ' John';
        con.LastName = 'Smith';
        con.Email = 'test@gmail.co.in';
        return con;
    }
}