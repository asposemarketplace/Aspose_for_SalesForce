public with sharing class AsposeTasks {
    public string apiResponse {get; set;}
    
    public String Convert(String Filename, String saveFormat) {
    
        try{
            
            //build URI
            String strURI = Product.BaseProductUri + '/tasks/' + Filename + '?format=' + saveFormat;
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