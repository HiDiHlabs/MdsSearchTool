package de.dkfz.mdsearch

import org.apache.http.HttpHost

class HttpProxyUtils{


    public static void getSomething(){

    }

    public static HttpHost getHttpHost(){

        def proxyPort = getProxyPort()
        def proxyProtocol = getProxyProtocol()
        def proxyServer = getProxyServer()

        return new HttpHost(proxyServer, proxyPort, proxyProtocol)

    }

    private static String getProxyServer(){

        def httpProxy = getHttpProxy()
        if (httpProxy != null){

            int index = httpProxy.contains("https") ? "https://".length() : httpProxy.contains("http") ? "http://".length() : 0;
            httpProxy = httpProxy.substring(index, httpProxy.length())
            index = httpProxy.contains(":") ? httpProxy.indexOf(":") : httpProxy.length()

            httpProxy = httpProxy.substring(0, index)

        }

        return httpProxy

    }

    private static String getProxyProtocol(){

        String proxy = getHttpProxy()
        String protocol = null
        if (proxy != null){
            protocol = proxy.toLowerCase().contains("https") ? "https" : proxy.toLowerCase().contains("http") ? "http" : null
        }
        return protocol


    }

    private static String getHttpProxy(){

        String httpProxy = System.getenv("HTTP_PROXY")
        if (httpProxy == null){
            httpProxy = System.getenv("http_proxy")
        }

        return httpProxy
    }

    private static Integer getProxyPort() {

        String httpProxy = getHttpProxy()

        if (httpProxy != null) {

            if (httpProxy.contains(":")) {
                int index = httpProxy.lastIndexOf(":")
                String port = httpProxy.substring(index+1, httpProxy.length())
                return convert(port)
            }

        }
        return  null

    }

    private static Integer convert (String number){
        try{
            return new Integer(number)
        }catch(Exception e){
            return null;
        }
    }
/*
    private static String[] getHost (String httpProxy){
        if (httpProxy != null && !httpProxy.empty){
            def index = httpProxy.indexOf("//")
            def split = httpProxy.substring(index + "//".length()).split(":")

            return split
        }

        return null
    }
*/
}