<!-- markdownlint-disable MD041 -->

The certificate must be Base64 encoded. Use a certificate that's intended for client authentication.

With the **AddCertificate** method you set the certificates that you want to be associated to the request of the HTTP client connection. These certificates are used only to authenticate the client. They don't configure or validate the server certificate that the external endpoint presents.

The system caches SSL sessions as they are created and attempts to reuse a cached session for a new request, if possible. When attempting to reuse an SSL session, it uses the first certificate that was added or tries to reuse an anonymous session if no certificates have been specified.

> [!IMPORTANT]
> The certificate must use one of the supported cipher suites; otherwise, outgoing web service calls will fail with a security exception. For more information, see [Supported cipher suites](../devenv-supported-cipher-suites.md).
>
> In [!INCLUDE[prod_short](prod_short.md)] online, certificates used with `HttpClient`, including client certificates added with the **AddCertificate** method, must be issued by a trusted public certification authority (CA). Self-signed certificates and certificates issued by private or internal CAs aren't trusted by default and can cause HTTP calls to fail. To help ensure successful and secure communication, use certificates that are part of a standard trust chain anchored in a well-known public CA.
