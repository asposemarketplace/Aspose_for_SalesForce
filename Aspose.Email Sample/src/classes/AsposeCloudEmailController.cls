public with sharing class AsposeCloudEmailController {

    public string appSID {get; set;}
    public string appKey {get; set;}
    public string fileName {get; set;}
    public string propertyName {get; set;}
    public string apiResponse {get; set;}
    public string downloadURL {get; set;}


    public PageReference runSample() {
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing Email... ');
        AsposeEmail api = new AsposeEmail ();
        String downloadURL = api.getProperty(fileName,propertyName);
        
        this.downloadURL = downloadURL; 
        this.apiResponse = api.apiResponse;
        
        return null;
    }
}