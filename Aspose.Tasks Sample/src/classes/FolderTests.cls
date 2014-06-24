@isTest
public class FolderTests{
    public static testMethod void testSaveStreamToFileMethod() {
        
        System.assertEquals(true,Folder.SaveStreamToFile('abc','xyz'));
        
    }
}