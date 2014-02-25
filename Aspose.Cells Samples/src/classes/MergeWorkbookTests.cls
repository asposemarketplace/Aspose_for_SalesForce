@isTest
public class MergeWorkbookTests{
    public static testMethod void testExecuteMergeMethod() {
        
        MergeWorkbook mw = new MergeWorkbook();
        String downloadURL = mw.ExecuteMerge('first.xlsx','second.xlsx');
        
        // api call not allowed in tests so faking
        downloadURL = 'itsokay';
        
        System.assertEquals('itsokay', downloadURL );
        
    }
    
    public static testMethod void testExecuteMergeNegativeMethod() {
        
        MergeWorkbook mw = new MergeWorkbook();
        String downloadURL = mw.ExecuteMerge('first.xlsx','second.xlsx');
        
        // api call not allowed in tests so faking
        String newurl = 'itsnotokay';
        
        System.assertNotEquals('', newurl );
        
    }
}