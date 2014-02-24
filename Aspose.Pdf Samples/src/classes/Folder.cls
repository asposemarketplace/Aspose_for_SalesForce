public with sharing class Folder {
    
    public static boolean SaveStreamToFile(String filePath, String outFilePath) {
        try {
            
            return true;

        } catch (Exception ex) {
            system.debug(ex.getStackTraceString());
            return false;
        }
    }
        
}