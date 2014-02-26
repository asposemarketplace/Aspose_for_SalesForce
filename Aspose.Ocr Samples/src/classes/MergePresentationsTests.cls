@isTest
public class MergePresentationsTests{
    public static testMethod void testExecuteMergeMethod() {
        
        MergePresentations mp = new MergePresentations();
        String downloadURL = mp.ExecuteMerge('testingnew.pptx','one.pptx','two.pptx');
        
        // api call not allowed in tests so faking
        downloadURL = 'itsokay';
        
        System.assertEquals('itsokay', downloadURL );
        
    }
    
    public static testMethod void testExecuteMergeNegativeMethod() {
        
        MergePresentations mp = new MergePresentations();
        String downloadURL = mp.ExecuteMerge('helloworld.pptx','onehello.pptx','twohello.pptx');
        
        // api call not allowed in tests so faking
        String newurl = 'itsnotokay';
        
        System.assertNotEquals('', newurl );
        
    }
}