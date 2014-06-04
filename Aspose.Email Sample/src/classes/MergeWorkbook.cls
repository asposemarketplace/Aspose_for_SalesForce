public with sharing class MergeWorkbook {
    public string apiResponse {get; set;}
    
    public String ExecuteMerge(String firstWb, String secondWb) {
    
        try{
        
            //String strURII = Product.BaseProductUri + '/pdf/' + Filename;
            //String signedURII = Utils.Sign(strURII);
            //String strJSONN = Utils.ProcessCommand(signedURII, 'PUT', '' , 'json');
            
            //build URI
            String strURI = Product.BaseProductUri + '/cells/' + firstWb + '/merge?mergeWith=' + secondWb;
            String signedURI = Utils.Sign(strURI);
            
            String strJSON = Utils.ProcessCommand(signedURI, 'POST', '' , 'json');
            this.apiResponse = strJSON;
            
            //prepare signed download link
            String downloadURL = null;
            Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(strJSON);
            if(params.containsKey('Workbook')){
                //Map<String, Object> doc = (Map<String, Object>) params.get('Document');
                //String DocName = (String) doc.get('SelfUri');
                strURI = Product.BaseProductUri + '/cells/' + firstWb;
                downloadURL = Utils.Sign(strURI);
            }
            
            return downloadURL;
            
            
        } catch (Exception ex) {
            system.debug(ex);
            return null;
        }
    
    }
    
}