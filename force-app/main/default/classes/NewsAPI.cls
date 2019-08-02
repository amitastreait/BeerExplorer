public with sharing class NewsAPI {
    public NewsAPI() {

    }

    @AuraEnabled(cacheable=true)
    public static string fetchHeadlines(String Country){
        final String API_KEY = 'f05f7785354b4360bc51da8ca08e3cd2';
        String errorMessage ='';
        String endpoint = 'https://newsapi.org/v2/top-headlines?country='+Country;

        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(endpoint);
        httpReq.setMethod('GET');
        httpReq.setHeader('X-Api-Key', API_KEY);

        HttpResponse httpRes = new HttpResponse();
        
        try{
            httpRes = (new Http()).send(httpReq);
            Integer STATUS_CODE = httpRes.getStatusCode();
            if(STATUS_CODE == 200){
                String response = httpRes.getBody();
                return response;
            }else{
                errorMessage = 'Unexpected Error while communicating with News API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                return null;
            }
        }catch(System.Exception e){
            System.debug(' Exception Occured '+e.getStackTraceString());
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                return null;
            }else{
                errorMessage = 'Unexpected Error while communicating with News API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                return null;
            }
        }
    }

    @AuraEnabled(cacheable=true)
    public static string fetchNews(String queryParam){
        final String API_KEY = 'f05f7785354b4360bc51da8ca08e3cd2';
        String errorMessage ='';
        String endpoint = 'https://newsapi.org/v2/everything?q='+EncodingUtil.urlEncode(queryParam, 'UTF-8');
        
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(endpoint);
        httpReq.setMethod('GET');
        httpReq.setHeader('X-Api-Key', API_KEY);

        HttpResponse httpRes = new HttpResponse();
        
        try{
            httpRes = (new Http()).send(httpReq);
            Integer STATUS_CODE = httpRes.getStatusCode();
            if(STATUS_CODE == 200){
                String response = httpRes.getBody();
                System.debug(response);
                return response;
            }else{
                errorMessage = 'Unexpected Error while communicating with News API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                return null;
            }
        }catch(System.Exception e){
            System.debug(' Exception Occured '+e.getStackTraceString());
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                return null;
            }else{
                errorMessage = 'Unexpected Error while communicating with News API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                return null;
            }
        }
    }
}