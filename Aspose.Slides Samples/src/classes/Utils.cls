public with sharing class Utils {
    
    public static String Sign(String data) {
        String HMAC_SHA1 = 'HmacSHA1';
        try {
            data = data.replace(' ', '%20');
            
            URL url = new URL(data);
            String path = url.getPath();
            path = path.replace(' ', '%20');

            // Remove final slash here as it can be added automatically.
            path = path.removeEnd('/');
            
            String filePart = url.getPath() + (url.getQuery() == null ? '?' : '?' + url.getQuery()) + '&appSID=' + AsposeCloudApp.AppSID;
            url = new URL(url.getProtocol(), url.getHost(), url.getPort(), filePart);

            // compute the hmac on input data bytes
            Blob mac = Crypto.generateMac(HMAC_SHA1, Blob.valueOf(url.toExternalForm()), Blob.valueOf(AsposeCloudApp.AppKey));
            String base64 = EncodingUtil.base64Encode(mac);
            system.debug('base64: ' + base64);
            // Remove invalid symbols.
            String result = base64.substring(0, base64.length() - 1);
            
            result = EncodingUtil.urlEncode(result, 'UTF-8');
            system.debug('signature: ' + result);

            String encodedUrl = url.toExternalForm() + '&signature=' + result;
            system.debug('full URL: ' + encodedUrl);
            
            return encodedUrl;
        } catch (Exception ex) {
            system.debug(ex.getStackTraceString());
            return null;
        }
    }
    
    public static String ProcessCommand(String strURI, String strHttpCommand, String strContent, String ContentType) {
        try {
            HttpRequest request = new HttpRequest();
            Integer len = 0;
            if (strContent != null) {
                request.setBody(strContent);
                len = strContent.length();
            }
            
            request.setEndpoint(strURI);
            request.setMethod(strHttpCommand);
            
            if (ContentType.toLowerCase() == 'xml')
                request.setHeader('Content-Type', 'application/xml');
            else
                request.setHeader('Content-Type', 'application/json');
            request.setHeader('Content-Length', String.valueOf(len));
            request.setHeader('Accept', 'application/json');
            //request.setTimeout(Timeout);

            Http http = new Http();
            HttpResponse res = http.send(request);
            return res.getBody();
        } catch (Exception ex) {
            system.debug('HTTP ERROR' + ex.getMessage());
            system.debug(ex.getStackTraceString());
            return null;
        }
    }
        
}