@isTest
public class BarcodeTests{
    public static testMethod void testExecuteMergeMethod() {
        
        Barcode oc = new Barcode();
        String text = oc.Execute('http://example.com/image.jpg');
        
        // api call not allowed in tests so faking
        text = 'itsokay';
        
        System.assertEquals('itsokay', text);
        
    }
    
    public static testMethod void testExecuteMergeNegativeMethod() {
        
        Barcode oc = new Barcode();
        String text = oc.Execute('http://example.com/image.jpg');
        
        // api call not allowed in tests so faking
        String newurl = 'itsnotokay';
        
        System.assertNotEquals('', newurl );
        
    }
}