public with sharing class AsposeCloudMergePptController {

    public string appSID {get; set;}
    public string appKey {get; set;}
    public string mergedPresentation {get; set;}
    public String presentationTwo { get; set; }
    public String presentationOne { get; set; }
    public string apiResponse {get; set;}
    public string downloadURL {get; set;}


    public PageReference runSample() {
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing presentation merge ... ');
        MergePresentations api = new MergePresentations();
        String downloadURL = api.ExecuteMerge(mergedPresentation,presentationOne,presentationTwo);
        
        
        
        //MailMerge api = new MailMerge();
        //String downloadURL = api.ExecuteMailMerege(templatePath, dataPath, outputFormat);
        //System.debug('Done! Download URL is ' + downloadURL);
        this.downloadURL = downloadURL; 
        this.apiResponse = api.apiResponse;
        
        return null;
    }
}