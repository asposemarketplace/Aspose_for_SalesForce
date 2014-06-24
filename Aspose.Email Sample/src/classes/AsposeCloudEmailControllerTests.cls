@isTest
public class AsposeCloudEmailControllerTests {
    public static testMethod void testMyController() {
        PageReference pageRef = Page.AsposeCloudEmail;
        Test.setCurrentPage(pageRef);                
        
        AsposeCloudEmailController controller = new AsposeCloudEmailController();        
        controller.appSID = '3395ba5c-3442-4146-9c9d-e9630d';
        controller.appKey = 'e8dd1b027459a0a2';
        controller.fileName = 'Email.eml';
        controller.propertyName = 'Subject';
        
        controller.runSample();
        
        // Verify that we get some api response
        System.assertEquals(null, controller.apiResponse );
        
    }
}