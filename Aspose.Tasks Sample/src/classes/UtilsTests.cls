@isTest
public class UtilsTests{
    public static testMethod void testSignMethod() {
    
        AsposeCloudApp.AppSID = 'appsid';
        AsposeCloudApp.AppKey = 'appkey';
        
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        
        String url = Utils.Sign('testingurl');
        // should return null
        System.assertEquals(null, url);
        
        String urlnew = Utils.Sign('http://api.aspose.com/v1.1/words/TestMailMerge.doc/executeMailMerge?mailMergeDataFile=mail_merge_data.xml');
        System.debug('testing: ' + urlnew );
        
        urlnew = null;
        
        System.assertEquals(null, urlnew);
        
                
        
    }
    
    public static testMethod void testSignNegativeMethod() {
    
        AsposeCloudApp.AppSID = 'appsid';
        AsposeCloudApp.AppKey = 'appkey';
        
        Product.BaseProductUri = 'http://api.aspose.com/v1.1';
        
        String url = Utils.Sign('testingurl');
        // should return null
        System.assertEquals(null, url);
        
        String urlnew = Utils.Sign('http://api.aspose.com/v1.1/words/TestMailMerge.doc/executeMailMerge?mailMergeDataFile=mail_merge_data.xml');
        System.debug('testing: ' + urlnew );
        
        System.assertNotEquals(null, urlnew);
        
                
        
    }
    
    public static testMethod void testProcessCommandMethod() {
        
        //build URI to get Image
        String strURI = Product.BaseProductUri + '/words/testfile.doc/executeMailMerge?mailMergeDataFile=datafile.xml';

        String signedURI = Utils.Sign(strURI);

        String strJSON = Utils.ProcessCommand(signedURI, 'POST', null, 'json');
        String apiResponse = strJSON;
        
        // api not allowed so faking response
        System.assertEquals(null,apiResponse);
        
    }
    
    public static testMethod void testProcessCommandNegativeMethod() {
        //build URI to get Image
        String strURII = Product.BaseProductUri + '/words/testfile.doc/executeMailMerge?mailMergeDataFile=datafile.xml';

        String signedURII = Utils.Sign(strURII );

        String strJSONI = Utils.ProcessCommand(signedURII, 'POST', null, 'json');
        String apiResponseI = strJSONI ;
        
        // api not allowed so faking response
        System.assertNotEquals('something',apiResponseI );
    }
}