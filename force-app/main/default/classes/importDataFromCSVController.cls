public class importDataFromCSVController {
  public String documentName {get;set;}
    public Blob csvFileBody{get;set;}
  public String[] contactDataLines {get;set;}
  public List < Contact > lstContacts {get;set;}
    public boolean readSuccess {get;set;}
    public List<String> lstFieldNames{get;set;}
  Contact conObj;
  String contactDataAsString;
    String fieldValue;
  Integer fieldNumber;
  Map < String, Integer > fieldNumberMap = new Map < String, Integer > ();
  public importDataFromCSVController() {
        documentName = '';
        readSuccess = FALSE;
    contactDataLines = new String[] {};
    lstContacts = new List < Contact > ();
        lstFieldNames = new List<String>();
  }
    public void readFromFile(){
        try{
            contactDataAsString = csvFileBody.toString();
            readCSVFile();
        }
        catch(exception e){
            readSuccess = FALSE;
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.Severity.ERROR,'Error reading CSV file');
            ApexPages.addMessage(errorMessage);
        }
    }    
  public void readCSVFile() {
    lstContacts.clear();
        contactDataLines = contactDataAsString.split('\n');
        string[] csvFieldNames = contactDataLines[0].split(',');
        for (Integer i = 0; i < csvFieldNames.size(); i++) {
            fieldNumberMap.put(csvFieldNames[i], i);
            lstFieldNames.add(csvFieldNames[i].trim());
        }
        for (Integer i = 1; i < contactDataLines.size(); i++) {
            conObj = new Contact();
            string[] csvRecordData = contactDataLines[i].split(',');
            for (String fieldName: csvFieldNames) {
                fieldNumber = fieldNumberMap.get(fieldName);
                fieldValue = csvRecordData[fieldNumber];
                conObj.put(fieldName.trim(), fieldValue.trim());
            }
            lstContacts.add(conObj);                
        }
        if(lstContacts.size() > 0){
            readSuccess = TRUE;
        }            
  }
  public void saveData() {
    try {
      INSERT lstContacts;
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.INFO, 'Contact records inserted successfully');
      ApexPages.addMessage(errorMessage);
    } catch (Exception e) {
      ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR, 'An error has occured while saving data');
      ApexPages.addMessage(errorMessage);
    }
  }
}