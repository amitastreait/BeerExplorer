global class AddressSearchMockErrorTest {
    global HTTPResponse respond(HTTPRequest req) {
        String json=		'{'+
            '   "html_attributions" : [],'+
            '   "result" : {'+
            '      "address_components" : ['+
            '         {'+
            '            "long_name" : "1234",'+
            '            "short_name" : "1234",'+
            '            "types" : [ "street_number" ]'+
            '         },'+
            '         {'+
            '            "long_name" : "South Memorial Drive",'+
            '            "short_name" : "S Memorial Dr",'+
            '            "types" : [ "route" ]'+
            '         },'+
            '         {'+
            '            "long_name" : "Tulsa",'+
            '            "short_name" : "Tulsa",'+
            '            "types" : [ "locality", "political" ]'+
            '         },'+
            '         {'+
            '            "long_name" : "Tulsa County",'+
            '            "short_name" : "Tulsa County",'+
            '            "types" : [ "administrative_area_level_2", "political" ]'+
            '         },'+
            '         {'+
            '            "long_name" : "Oklahoma",'+
            '            "short_name" : "OK",'+
            '            "types" : [ "administrative_area_level_1", "political" ]'+
            '         },'+
            '         {'+
            '            "long_name" : "United States",'+
            '            "short_name" : "US",'+
            '            "types" : [ "country", "political" ]'+
            '         },'+
            '         {'+
            '            "long_name" : "74112",'+
            '            "short_name" : "74112",'+
            '            "types" : [ "postal_code" ]'+
            '         }'+
            '      ],'+
            '      "formatted_address" : "1234 S Memorial Dr, Tulsa, OK 74112, USA"'+
            '   },'+
            '   "status" : "OK"'+
            '}';
        HttpResponse response = new HttpResponse();
        response.setStatus('OK');
        response.setStatusCode(200);
        response.setBody(json);
        return response;
    }
}