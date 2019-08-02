@isTest
public class AddressSearchAuraService_UnitTest {
    public static testMethod void findPlaces_UnitTest(){
        Test.startTest();
        	Test.setMock(HttpCalloutMock.class, new AddressSearchFindPlacemock());
        	String endPoint = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyBWc2DZ9uyJIxk2Fp-ww&sessiontoken=0.6394527585671168&radius=500&language=en&input=';
        	AddressSearchAuraService.findPlaces(endPoint, '41 St. Germain');
        Test.stopTest();
    }
    public static testMethod void fetchZipCode_UnitTest(){
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new AddressSearchMockTest());
        	String endPoint = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyBWc2DZ9uyJIxk2Fp-ww&sessiontoken=0.6394527585671168&radius=500&language=en&input=';
            AddressSearchAuraService.fetchZipCode(endPoint);
        Test.stopTest();
    }
}