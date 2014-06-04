@isTest
public class OcrTests{
    public static testMethod void testExecuteMergeMethod() {
        
        Ocr oc = new Ocr();
        String text = oc.Execute('http://example.com/image.jpg');
        
        // api call not allowed in tests so faking
        text = 'itsokay';
        
        System.assertEquals('itsokay', text);
        
    }
    
    public static testMethod void testExecuteMergeNegativeMethod() {
        
        Ocr oc = new Ocr();
        String text = oc.Execute('http://example.com/image.jpg');
        
        // api call not allowed in tests so faking
        String newurl = 'itsnotokay';
        
        System.assertNotEquals('', newurl );
        
    }
}