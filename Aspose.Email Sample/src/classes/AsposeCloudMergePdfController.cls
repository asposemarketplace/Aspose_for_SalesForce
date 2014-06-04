public with sharing class AsposeCloudMergePdfController {

    public string appSID {get; set;}
    public string appKey {get; set;}
    public string mergedPdf {get; set;}
    public String pdfTwo { get; set; }
    public String pdfOne { get; set; }
    public string apiResponse {get; set;}
    public string downloadURL {get; set;}


    public PageReference runSample() {
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing presentation merge ... ');
        MergePdf api = new MergePdf();
        String downloadURL = api.ExecuteMerge(mergedPdf ,pdfOne,pdfTwo );
        
        
        
        //MailMerge api = new MailMerge();
        //String downloadURL = api.ExecuteMailMerege(templatePath, dataPath, outputFormat);
        //System.debug('Done! Download URL is ' + downloadURL);
        this.downloadURL = downloadURL; 
        this.apiResponse = api.apiResponse;
        
        return null;
    }
}