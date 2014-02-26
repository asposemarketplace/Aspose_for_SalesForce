public with sharing class AsposeMergeWorkbookController {

    public string appSID {get; set;}
    public string appKey {get; set;}
    public string firstWb {get; set;}
    public String secondWb { get; set; }
    public string apiResponse {get; set;}
    public string downloadURL {get; set;}


    public PageReference runSample() {
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing presentation merge ... ');
        MergeWorkbook api = new MergeWorkbook();
        String downloadURL = api.ExecuteMerge(firstWb , secondWb );
        
        
        
        //MailMerge api = new MailMerge();
        //String downloadURL = api.ExecuteMailMerege(templatePath, dataPath, outputFormat);
        //System.debug('Done! Download URL is ' + downloadURL);
        this.downloadURL = downloadURL; 
        this.apiResponse = api.apiResponse;
        
        return null;
    }
}