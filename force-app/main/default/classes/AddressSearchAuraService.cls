/*
 * @Author : - Amit Singh
 * @Date : - 14th Dec 2018
 * @Description: - Class is responsible for making the API call with 
 * 				Google Place Autocomplete API and then return the
 * 				prediction to the Lightning Component Controller
 * 
 */ 

public class AddressSearchAuraService {
	
    /*
     * @Author : - Amit Singh
     * @Date : - 14th Dec 2018
     * @Name : - findPlaces
     * @param : String endPointURL, String input - the address input by the user
     * @return type - String
     * @Desctiption :- Make the API call with the Google Place Autcomplete and returns the predictions
     */
    @AuraEnabled
    public static String findPlaces(String endPointURL, String input){
        String errorMessage = '';
        String endPoint = 'https://maps.googleapis.com';
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(endPointURL+EncodingUtil.urlEncode(input, 'UTF-8'));
        httpReq.setMethod('GET');
        httpReq.setTimeout(12000);
        HttpResponse httpRes = new HttpResponse();
        ResponseWrapper wrapper = new ResponseWrapper();
        try{
            httpRes = (new Http()).send(httpReq);
            System.debug(' httpRes.getBody() '+httpRes.getBody());
            if(httpRes.getStatusCode() == 200){
                wrapper.isSuccess = true;
                wrapper.errorMessage = null;
                Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                List<Object> predictionList = (List<Object>)responseMap.get('predictions');
                List<String> predict = new List<String>();
                For(Integer i=0; i<predictionList.size(); i++){
                    Object obj = predictionList.get(i);
                    String jsonSting = JSON.serialize(obj);
                    Map<String, Object> response = (Map<String, Object>)JSON.deserializeUntyped(jsonSting);
                    String description = (String)response.get('description');
                    String placeId = (String)response.get('place_id');
                    predict.add(description+'####'+placeId);
                }
                wrapper.prediction = predict;
                return JSON.serialize(wrapper);
            }else{
                errorMessage = 'Unexpected Error while communicating with Google Place API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                wrapper.isSuccess = false;
                wrapper.errorMessage = errorMessage;
                return JSON.serialize(wrapper);
            }
        }catch(System.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                
            }else{
                errorMessage = 'Unexpected Error while communicating with Google Place API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                
            }
            
            wrapper.isSuccess = false;
            wrapper.errorMessage = errorMessage;
            return JSON.serialize(wrapper);
        }
    }
    
    /*
     * @Author : - Amit Singh
     * @Date : - 14th Dec 2018
     * @Name : - fetchZipCode
     * @param : String endPoint
     * @return type - String
     * @Desctiption :- Make the API call with the Google Place Details and returns the complete address with ZipCode
     */
    @AuraEnabled
    public static String fetchZipCode(String endPoint){
        String errorMessage = '';
        String endPointRemote = 'https://maps.googleapis.com';
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(endPoint);
        httpReq.setMethod('GET');
        httpReq.setTimeout(12000);
        HttpResponse httpRes = new HttpResponse();
        
        try{
            httpRes = (new Http()).send(httpReq);
            if(httpRes.getStatusCode() == 200){
                String responseBody = httpRes.getBody();
                PlaceDetails details = (PlaceDetails)System.JSON.deserialize(responseBody, PlaceDetails.class);
                System.debug('#### details '+details);
                return JSON.serialize(details);
            }else{
                errorMessage = 'Unexpected Error while communicating with Google Place API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                return errorMessage;
            }
        }catch(System.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPointRemote +' Endpoint';
                
            }else{
                errorMessage = 'Unexpected Error while communicating with Google Place API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode()+' Error Message '+httpRes.getBody();
                
            }
            return errorMessage;
        }
    }
    
    public class ResponseWrapper{
        @AuraEnabled
        public String errorMessage 		 { get; set; }
        @AuraEnabled
        public Boolean isSuccess   		 { get; set; }
        @AuraEnabled
        public List<String> prediction   { get; set; }
    }
}