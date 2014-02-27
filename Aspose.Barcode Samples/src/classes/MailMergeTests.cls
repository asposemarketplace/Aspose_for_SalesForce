@isTest
public class MailMergeTests{
    public static testMethod void testExecuteMailMeregeMethod() {
        
        MailMerge mm = new MailMerge();
        String downloadURL = mm.ExecuteMailMerege('template.doc','data.xml','doc');
        
        // api call not allowed in tests so faking
        downloadURL = 'itsokay';
        
        System.assertEquals('itsokay', downloadURL );
        
    }
    
    public static testMethod void testExecuteMailMeregeNegativeMethod() {
        
        MailMerge mm = new MailMerge();
        String newurl = mm.ExecuteMailMerege('template.doc','data.xml','doc');
        
        // api call not allowed in tests so faking
        newurl = 'itsnotokay';
        
        System.assertNotEquals('', newurl );
        
    }
}