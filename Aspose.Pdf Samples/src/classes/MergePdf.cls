public with sharing class MergePdf {
    public string apiResponse {get; set;}
    
    public String ExecuteMerge(String Filename, String PdfOne, String PdfTwo) {
    
        try{
        
            //String strURII = Product.BaseProductUri + '/pdf/' + Filename;
            //String signedURII = Utils.Sign(strURII);
            //String strJSONN = Utils.ProcessCommand(signedURII, 'PUT', '' , 'json');
            
            //build URI
            String strURI = Product.BaseProductUri + '/pdf/' + Filename + '/merge';
            String signedURI = Utils.Sign(strURI);
            
            String jsonData = '{\'List\':[\'' + PdfOne + '\',\'' + PdfTwo + '\']}';
            
            String strJSON = Utils.ProcessCommand(signedURI, 'PUT', jsonData , 'json');
            this.apiResponse = strJSON;
            
            //prepare signed download link
            String downloadURL = null;
            Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(strJSON);
            if(params.containsKey('Document')){
                //Map<String, Object> doc = (Map<String, Object>) params.get('Document');
                //String DocName = (String) doc.get('SelfUri');
                strURI = Product.BaseProductUri + '/pdf/' + Filename;
                downloadURL = Utils.Sign(strURI);
            }
            
            return downloadURL;
            
            
        } catch (Exception ex) {
            system.debug(ex);
            return null;
        }
    
    }
    
}