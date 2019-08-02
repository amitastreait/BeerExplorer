public class PlaceDetails {
    public HtmlAttributions[] html_attributions;
    public Result result;
    public String status;	
    class HtmlAttributions {
    }
    public class Result {
        public AddressComponents[] address_components;
        public String formatted_address;	
    }
    public class AddressComponents {
        public String long_name;	
        public String short_name;
        public List<String> types;
    }
    
}