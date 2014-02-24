public with sharing class AsposeCloudApp {

    public static String AppSID { get; set; }
    public static String AppKey { get; set; }

    public static void setAppInfo(String key, String sid) {
        AppSID=sid;
        AppKey=key;
    }
}