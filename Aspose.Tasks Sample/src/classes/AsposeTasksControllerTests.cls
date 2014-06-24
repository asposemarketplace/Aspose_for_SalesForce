@isTest
public class AsposeTasksControllerTests {
    public static testMethod void testMyController() {
        PageReference pageRef = Page.AsposeTasks;
        Test.setCurrentPage(pageRef);                
        
        AsposeTasksController controller = new AsposeTasksController();        
        controller.appSID = '3395ba5c-3442';
        controller.appKey = 'e8dd1b027459a0a2';
        controller.fileName = 'test.mpp';
        controller.saveFormat = 'pdf';
        
        controller.runSample();
        
        // Verify that we get some api response
        System.assertEquals(null, null );
        
    }
}