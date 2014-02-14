public with sharing class MailMerge {

    public string apiResponse {get; set;}
    
    public String ExecuteMailMerege(String FileName, String dataFile, SaveFormat outFormat) {
        return ExecuteMailMerege(FileName, dataFile, String.valueOf(outFormat));
    }

    public String ExecuteMailMerege(String FileName, String dataFile, String outFormat) {
        try {
            //build URI to get Image
            String strURI = Product.BaseProductUri + '/words/' + FileName + '/executeMailMerge?mailMergeDataFile=' + dataFile;

            String signedURI = Utils.Sign(strURI);
            system.debug('Signed URI = ' + signedURI);
            String strJSON = Utils.ProcessCommand(signedURI, 'POST', null, 'json');
            this.apiResponse = strJSON;
            
            system.debug(strJSON);

            //prepare signed download link
            String downloadURL = null;
            Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(strJSON);
            if(params.containsKey('Document')){
                Map<String, Object> doc = (Map<String, Object>) params.get('Document');
                String DocName = (String) doc.get('FileName');
                strURI = Product.BaseProductUri + '/words/' + DocName + '?format=' + outFormat;
                downloadURL = Utils.Sign(strURI);
            }
            
            return downloadURL;
        }
        catch (Exception ex) {
            system.debug(ex);
            return null;
        }
    }
    
}