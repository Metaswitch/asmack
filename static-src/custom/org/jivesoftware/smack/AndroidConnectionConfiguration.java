package org.jivesoftware.smack;

import java.io.File;

import android.os.Build;

import org.jivesoftware.smack.util.DNSUtil;
import org.jivesoftware.smack.util.dns.DNSJavaResolver;

/**
 * This class wraps DNS SRV lookups for a new ConnectionConfiguration.
 * Originally it did this in a new thread, since Android API >= 11 (Honeycomb)
 * does not allow network activity in the main thread. 
 * However, since the interface to ConnectionConfiguration was changed to do
 * the DNS work in the constructor, we can't easily use another thread - and
 * anyway we only call this on the non-main thread.
 * 
 * @author Florian Schmaus fschmaus@gmail.com
 *
 */
public class AndroidConnectionConfiguration extends ConnectionConfiguration {
    private static final int DEFAULT_TIMEOUT = 1000;

    static
    {
      DNSUtil.setDNSResolver(DNSJavaResolver.getInstance());
    }
    
    /**
     * Creates a new ConnectionConfiguration for the specified service name.
     * A DNS SRV lookup will be performed to find out the actual host address
     * and port to use for the connection.
     *
     * @param serviceName the name of the service provided by an XMPP server.
     */
    public AndroidConnectionConfiguration(String serviceName) throws XMPPException {
        this(serviceName, DEFAULT_TIMEOUT);
    }
    
    /**
     * 
     * @param serviceName
     * @param timeout - Now ignored
     * @throws XMPPException
     */
    public AndroidConnectionConfiguration(String serviceName, int timeout) throws XMPPException {
        super(serviceName);
        AndroidInit();
    }

    public AndroidConnectionConfiguration(String host, int port, String name) {
        super(host, port, name);
        AndroidInit();
    }

    private void AndroidInit() {
        // API 14 is Ice Cream Sandwich
        if (Build.VERSION.SDK_INT >= 14) {
            setTruststoreType("AndroidCAStore");
            setTruststorePassword(null);
            setTruststorePath(null);
        } else {
            setTruststoreType("BKS");
            String path = System.getProperty("javax.net.ssl.trustStore");
            if (path == null)
                path = System.getProperty("java.home") + File.separator + "etc"
                    + File.separator + "security" + File.separator
                    + "cacerts.bks";
            setTruststorePath(path);
        }
    }
}
