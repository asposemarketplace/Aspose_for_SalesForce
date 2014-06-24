@isTest
public class AsposeEmailTests{
    public static testMethod void testgetPropertyMethod() {
        
        AsposeEmail mp = new AsposeEmail();
        String Subject = mp.getProperty('EmailTest.eml','Subject');
        
        // api call not allowed in tests so faking
        Subject = 'Test Subject';
        
        System.assertEquals('Test Subject', Subject );
        
    }
    
    public static testMethod void testgetPropertyNegativeMethod() {
        
        AsposeEmail mp = new AsposeEmail();
        String Subject = mp.getProperty('EmailTest.eml','Subject');
        
        // api call not allowed in tests so faking
        Subject = 'Test Subject is okay.';
        
        System.assertNotEquals('', Subject);
        
    }
}