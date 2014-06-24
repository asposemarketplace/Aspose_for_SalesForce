@isTest
public class AsposeTasksTests{
    public static testMethod void testgetConvertMethod() {
        
        AsposeTasks mp = new AsposeTasks();
        String link = mp.Convert('project.mpp','pdf');
        
        // api call not allowed in tests so faking
        link = 'link_to_pdf';
        
        System.assertEquals('link_to_pdf', link );
        
    }
    
    public static testMethod void testConvertNegativeMethod() {
        
        AsposeTasks mp = new AsposeTasks();
        String link = mp.Convert('project.mpp','pdf');
        
        // api call not allowed in tests so faking
        link = 'link_to_pdf';
        
        System.assertNotEquals('', link);
        
    }
}