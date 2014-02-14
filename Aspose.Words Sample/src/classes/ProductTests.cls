@isTest
public class ProductTests{
    public static testMethod void testBaseProductURI() {
        
        Product.BaseProductUri = 'http://www.aspose.com';
        
        System.assertEquals('http://www.aspose.com', Product.BaseProductUri);
        
    }
}