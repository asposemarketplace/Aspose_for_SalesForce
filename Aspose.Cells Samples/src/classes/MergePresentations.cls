public with sharing class MergePresentations {
    public string apiResponse {get; set;}
    
    public String ExecuteMerge(String Filename, String PresentationOne, String PresentationTwo) {
    
        try{
        
            String strURII = Product.BaseProductUri + '/slides/' + Filename;
            String signedURII = Utils.Sign(strURII);
            String strJSONN = Utils.ProcessCommand(signedURII, 'PUT', '' , 'json');
            
            //build URI
            String strURI = Product.BaseProductUri + '/slides/' + Filename + '/merge';
            String signedURI = Utils.Sign(strURI);
            
            String jsonData = '{\'PresentationPaths\':[\'' + PresentationOne + '\',\'' + PresentationTwo + '\']}';
            
            String strJSON = Utils.ProcessCommand(signedURI, 'POST', jsonData , 'json');
            this.apiResponse = strJSON;
            
            //prepare signed download link
            String downloadURL = null;
            Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(strJSON);
            if(params.containsKey('Document')){
                //Map<String, Object> doc = (Map<String, Object>) params.get('Document');
                //String DocName = (String) doc.get('SelfUri');
                strURI = Product.BaseProductUri + '/slides/' + Filename;
                downloadURL = Utils.Sign(strURI);
            }
            
            return downloadURL;
            
            
        } catch (Exception ex) {
            system.debug(ex);
            return null;
        }
    
    }
    
}