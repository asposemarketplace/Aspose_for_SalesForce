public with sharing class AsposeCloudBarcodeController{

    public string appSID {get; set;}
    public string appKey {get; set;}
    public string fileName {get; set;}
    public string apiResponse {get; set;}
    public string text {get; set;}


    public PageReference runSample() {
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing OCR ... ');
        Barcode api = new Barcode();
        String text = api.Execute( fileName );
        
        System.debug('API Response:' + api.apiResponse);
        
        
        //MailMerge api = new MailMerge();
        //String downloadURL = api.ExecuteMailMerege(templatePath, dataPath, outputFormat);
        //System.debug('Done! Download URL is ' + downloadURL);
        this.text = text; 
        this.apiResponse = api.apiResponse;
        
        return null;
    }
}