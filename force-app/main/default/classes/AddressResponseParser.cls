public class AddressResponseParser {
    public Predictions[] predictions;
    public String status;	
    class Predictions {
        public String description;	
        public String id;	
        public Matched_substrings[] matched_substrings;
        public String place_id;	
        public String reference;	
        public Structured_formatting structured_formatting;
        public Terms[] terms;
        public Types[] types;
    }
    class Matched_substrings {
        public Integer length;	
        public Integer offset;	
    }
    class Structured_formatting {
        public String main_text;	
        public MainTextMatchedSubstrings[] main_text_matched_substrings;
        public String secondary_text;	
    }
    class MainTextMatchedSubstrings {
        public Integer length;	
        public Integer offset;	
    }
    class Terms {
        public Integer offset;	
        public String value;	
    }
    class Types {

    }
    /*public static AddressResponseParser parse(String json){
        return (AddressResponseParser) System.JSON.deserialize(json, AddressResponseParser.class);
    }*/
    public static String json=		'{'+
		'   "predictions" : ['+
		'      {'+
		'         "description" : "123 Main Street, Vancouver, BC, Canada",'+
		'         "id" : "4ec9b2402ec705db03e88d7ad0a9fa91c75b08b9",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            },'+
		'            {'+
		'               "length" : 11,'+
		'               "offset" : 4'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJxSW9MHFxhlQRwJjJmsF0rCM",'+
		'         "reference" : "ChIJxSW9MHFxhlQRwJjJmsF0rCM",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Main Street",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               },'+
		'               {'+
		'                  "length" : 11,'+
		'                  "offset" : 4'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Vancouver, BC, Canada"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Main Street"'+
		'            },'+
		'            {'+
		'               "offset" : 17,'+
		'               "value" : "Vancouver"'+
		'            },'+
		'            {'+
		'               "offset" : 28,'+
		'               "value" : "BC"'+
		'            },'+
		'            {'+
		'               "offset" : 32,'+
		'               "value" : "Canada"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "123 Main Street, Buffalo, NY, USA",'+
		'         "id" : "1d8e09493f128506d4806f3afb8267ef89c6bb22",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            },'+
		'            {'+
		'               "length" : 11,'+
		'               "offset" : 4'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJkbYDwjYS04kRbyo3qzJ5v1M",'+
		'         "reference" : "ChIJkbYDwjYS04kRbyo3qzJ5v1M",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Main Street",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               },'+
		'               {'+
		'                  "length" : 11,'+
		'                  "offset" : 4'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Buffalo, NY, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Main Street"'+
		'            },'+
		'            {'+
		'               "offset" : 17,'+
		'               "value" : "Buffalo"'+
		'            },'+
		'            {'+
		'               "offset" : 26,'+
		'               "value" : "NY"'+
		'            },'+
		'            {'+
		'               "offset" : 30,'+
		'               "value" : "USA"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "123 Main Street, Flushing, NY, USA",'+
		'         "id" : "dee5a5d1c15799851a427e8d847f6484d929a1bb",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            },'+
		'            {'+
		'               "length" : 11,'+
		'               "offset" : 4'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJWbGLkg9gwokR76ZxzYbdnpM",'+
		'         "reference" : "ChIJWbGLkg9gwokR76ZxzYbdnpM",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Main Street",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               },'+
		'               {'+
		'                  "length" : 11,'+
		'                  "offset" : 4'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Flushing, NY, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Main Street"'+
		'            },'+
		'            {'+
		'               "offset" : 17,'+
		'               "value" : "Flushing"'+
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
		'         "description" : "123 Main Street, Los Angeles, CA, USA",'+
		'         "id" : "27de63b6f07882d17c148be16b183bd21dee14c3",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            },'+
		'            {'+
		'               "length" : 11,'+
		'               "offset" : 4'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJ3-cCKEnGwoARhS1-FUGpdNs",'+
		'         "reference" : "ChIJ3-cCKEnGwoARhS1-FUGpdNs",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Main Street",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               },'+
		'               {'+
		'                  "length" : 11,'+
		'                  "offset" : 4'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Los Angeles, CA, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Main Street"'+
		'            },'+
		'            {'+
		'               "offset" : 17,'+
		'               "value" : "Los Angeles"'+
		'            },'+
		'            {'+
		'               "offset" : 30,'+
		'               "value" : "CA"'+
		'            },'+
		'            {'+
		'               "offset" : 34,'+
		'               "value" : "USA"'+
		'            }'+
		'         ],'+
		'         "types" : [ "street_address", "geocode" ]'+
		'      },'+
		'      {'+
		'         "description" : "123 Main Street, Salt Lake City, UT, USA",'+
		'         "id" : "f725daf6a37b7878507c21521a72c5ec2efd1968",'+
		'         "matched_substrings" : ['+
		'            {'+
		'               "length" : 3,'+
		'               "offset" : 0'+
		'            },'+
		'            {'+
		'               "length" : 11,'+
		'               "offset" : 4'+
		'            }'+
		'         ],'+
		'         "place_id" : "ChIJiw9xPQ_1UocRapRRQsRzF8Y",'+
		'         "reference" : "ChIJiw9xPQ_1UocRapRRQsRzF8Y",'+
		'         "structured_formatting" : {'+
		'            "main_text" : "123 Main Street",'+
		'            "main_text_matched_substrings" : ['+
		'               {'+
		'                  "length" : 3,'+
		'                  "offset" : 0'+
		'               },'+
		'               {'+
		'                  "length" : 11,'+
		'                  "offset" : 4'+
		'               }'+
		'            ],'+
		'            "secondary_text" : "Salt Lake City, UT, USA"'+
		'         },'+
		'         "terms" : ['+
		'            {'+
		'               "offset" : 0,'+
		'               "value" : "123"'+
		'            },'+
		'            {'+
		'               "offset" : 4,'+
		'               "value" : "Main Street"'+
		'            },'+
		'            {'+
		'               "offset" : 17,'+
		'               "value" : "Salt Lake City"'+
		'            },'+
		'            {'+
		'               "offset" : 33,'+
		'               "value" : "UT"'+
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
}