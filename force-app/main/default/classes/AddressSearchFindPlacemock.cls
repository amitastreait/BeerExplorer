@isTest
global class AddressSearchFindPlacemock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        String json=		'{'+
		'   "predictions" : ['+
		'      {'+
		'         "description" : "Avenida Rivadavia 1238, Buenos Aires, Argentina",'+
		'         "id" : "394ab55dd67f250e687661a91e85fa1964b4586e",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 18'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJW0vysNrKvJURtL7LfUNlCrc",'+
		'         "reference" : "ChIJW0vysNrKvJURtL7LfUNlCrc",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "Avenida Rivadavia 1238",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 18'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Buenos Aires, Argentina"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "Avenida Rivadavia"'+
		'            },'+
		'            {'+
		'               "offset" : 18,'+
		'               "value" : "1238"'+
		'            },'+
		'            {'+
		'               "offset" : 24,'+
		'               "value" : "Buenos Aires"'+
		'            },'+
		'            {'+
		'               "offset" : 38,'+
		'               "value" : "Argentina"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "123 Chestnut Street, Philadelphia, PA, USA",'+
		'         "id" : "071bf6f9feee8aa4b0934f24e252500141bb7619",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJM4v3cYXIxokR-u5sPCd1pao",'+
		'         "reference" : "ChIJM4v3cYXIxokR-u5sPCd1pao",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Chestnut Street",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Philadelphia, PA, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Chestnut Street"'+
		'            },'+
		'            {'+
		'               "offset" : 21,'+
		'               "value" : "Philadelphia"'+
		'            },'+
		'            {'+
		'               "offset" : 35,'+
		'               "value" : "PA"'+
		'            },'+
		'            {'+
		'               "offset" : 39,'+
		'               "value" : "USA"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "123 Broadway, New York, NY, USA",'+
		'         "id" : "4fcf771188720f198b3e458760e37ddf1ab57999",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJd7QKQhdawokRiXy4laLKVI4",'+
		'         "reference" : "ChIJd7QKQhdawokRiXy4laLKVI4",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Broadway",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "New York, NY, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Broadway"'+
		'            },'+
		'            {'+
		'               "offset" : 14,'+
		'               "value" : "New York"'+
		'            },'+
		'            {'+
		'               "offset" : 24,'+
		'               "value" : "NY"'+
		'            },'+
		'            {'+
		'               "offset" : 28,'+
		'               "value" : "USA"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "1232 3rd Avenue, New York, NY, USA",'+
		'         "id" : "131953c23fd9072d2a517d5ef3b1e77c45ea67e1",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJT4zx9epYwokRNC-eFY3dOpA",'+
		'         "reference" : "ChIJT4zx9epYwokRNC-eFY3dOpA",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "1232 3rd Avenue",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "New York, NY, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "1232"'+
		'            },'+
		'            {'+
		'               "offset" : 5,'+
		'               "value" : "3rd Avenue"'+
		'            },'+
		'            {'+
		'               "offset" : 17,'+
		'               "value" : "New York"'+
		'            },'+
		'            {'+
		'               "offset" : 27,'+
		'               "value" : "NY"'+
		'            },'+
		'            {'+
		'               "offset" : 31,'+
		'               "value" : "USA"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "1235 Lexington Avenue, New York, NY, USA",'+
		'         "id" : "bb79109ced1302be6ac6d51be6ee6290ce3b128e",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJS0aMUrxYwokRIx-4ujk7yL8",'+
		'         "reference" : "ChIJS0aMUrxYwokRIx-4ujk7yL8",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "1235 Lexington Avenue",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "New York, NY, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "1235"'+
		'            },'+
		'            {'+
		'               "offset" : 5,'+
		'               "value" : "Lexington Avenue"'+
		'            },'+
		'            {'+
		'               "offset" : 23,'+
		'               "value" : "New York"'+
		'            },'+
		'            {'+
		'               "offset" : 33,'+
		'               "value" : "NY"'+
		'            },'+
		'            {'+
		'               "offset" : 37,'+
		'               "value" : "USA"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      }'+
		'   ],'+
		'   "status" : "OK"'+
		'}';
        HttpResponse response = new HttpResponse();
        response.setStatus('OK');
        response.setStatusCode(200);
        response.setBody(json);
        return response;
    }
}