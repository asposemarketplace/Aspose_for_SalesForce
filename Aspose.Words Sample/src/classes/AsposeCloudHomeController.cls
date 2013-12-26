public with sharing class AsposeCloudHomeController {
    public string appSID {get; set;}
    public string appKey {get; set;}
    public string templatePath {get; set;}
    public string dataPath {get; set;}
    public string outputFormat {get; set;}
    public string envelopeId {get; set;}
    public string templateId {get; set;}
    public string apiResponse {get; set;}
    public string downloadURL {get; set;}
    
    
    public AsposeCloudHomeController (){
    }
    
    public PageReference runSample(){
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing mail merge ... ');
        MailMerge api = new MailMerge();
        String downloadURL = api.ExecuteMailMerege(templatePath, dataPath, outputFormat);
        System.debug('Done! Download URL is ' + downloadURL);
        this.downloadURL = downloadURL; 
        this.apiResponse = api.apiResponse;
        
        return null;
    }
    
    public PageReference getLoginInformation(){
        return null;
    }
}