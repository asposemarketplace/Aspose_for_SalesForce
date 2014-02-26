@isTest
public class AsposeCloudAppTests{
    public static testMethod void testMyAsposeApp() {
        
        AsposeCloudApp.setAppInfo('mykey', 'mysid');
        
        System.assertEquals('mykey', AsposeCloudApp.AppKey);
        System.assertEquals('mysid', AsposeCloudApp.AppSID);
        
    }
}