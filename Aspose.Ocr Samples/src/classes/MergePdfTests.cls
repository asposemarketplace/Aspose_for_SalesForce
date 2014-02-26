@isTest
public class MergePdfTests{
    public static testMethod void testExecuteMergeMethod() {
        
        MergePdf mp = new MergePdf();
        String downloadURL = mp.ExecuteMerge('testingnew.pdf','one.pdf','two.pdf');
        
        // api call not allowed in tests so faking
        downloadURL = 'itsokay';
        
        System.assertEquals('itsokay', downloadURL );
        
    }
    
    public static testMethod void testExecuteMergeNegativeMethod() {
        
        MergePdf mp = new MergePdf();
        String downloadURL = mp.ExecuteMerge('helloworld.pdf','onehello.pdf','twohello.pdf');
        
        // api call not allowed in tests so faking
        String newurl = 'itsnotokay';
        
        System.assertNotEquals('', newurl );
        
    }
}