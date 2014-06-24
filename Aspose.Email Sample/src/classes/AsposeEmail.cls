public with sharing class AsposeEmail {
    public string apiResponse {get; set;}
    
    public String getProperty(String Filename, String property) {
    
        try{
            
            //build URI
            String strURI = Product.BaseProductUri + '/email/' + Filename + '/properties/' + property;
            String signedURI = Utils.Sign(strURI);
            
            String strJSON = Utils.ProcessCommand(signedURI, 'GET',null,'json');
            system.debug('apiResponse:'+strJSON);
            this.apiResponse = strJSON;
            return signedURI;
            
        } catch (Exception ex) {
            system.debug(ex);
            return null;
        }
    
    }
    
}