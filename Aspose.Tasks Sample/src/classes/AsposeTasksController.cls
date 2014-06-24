public with sharing class AsposeTasksController {

    public string appSID {get; set;}
    public string appKey {get; set;}
    public string fileName {get; set;}
    public string saveFormat {get; set;}
    public string downloadURL {get; set;}


    public PageReference runSample() {
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        AsposeCloudApp.setAppInfo(appKey, appSID);
        
        System.debug('Executing Tasks... ');
        AsposeTasks api = new AsposeTasks ();
        String downloadURL = api.Convert(fileName,saveFormat);
        
        this.downloadURL = downloadURL; 
        
        return null;
    }
}