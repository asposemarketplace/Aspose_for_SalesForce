public with sharing class Ocr {
    public string apiResponse {get; set;}
    
    public String Execute(String fileName) {
    
        try{
        
            //String strURII = Product.BaseProductUri + '/pdf/' + Filename;
            //String signedURII = Utils.Sign(strURII);
            //String strJSONN = Utils.ProcessCommand(signedURII, 'PUT', '' , 'json');
            
            //build URI
            String strURI = Product.BaseProductUri + '/ocr/recognize?url=' + fileName;
            String signedURI = Utils.Sign(strURI);
            
            system.debug('signedURI: ' + signedURI);
            
            String strJSON = Utils.ProcessCommand(signedURI, 'POST', '' , 'json');
            System.debug('Inline Response: ' + strJSON);
            this.apiResponse = strJSON;
            
            //prepare signed download link
            String returnText = null;
            Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(strJSON);
            if(params.containsKey('Text')){
                //Map<String, Object> doc = (Map<String, Object>) params.get('Document');
                returnText = (String) params.get('Text');
                
            }
            
            return returnText ;
            
            
        } catch (Exception ex) {
            system.debug(ex);
            return null;
        }
    
    }
    
}