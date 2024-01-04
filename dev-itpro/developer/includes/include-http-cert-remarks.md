The certificate must be in base 64 format.

With the **AddCertificate** method you set the certificates that you want to be associated to the request of the http client connection. These have the only purpose of authenticating the client.

The system caches SSL sessions as they are created and attempts to reuse a cached session for a new request, if possible. When attempting to reuse an SSL session, it uses the first certificate that was added or tries to reuse an anonymous session if no certificates have been specified.

> [!IMPORTANT]
> The certificate must be use one of the supported cipher suites; otherwise, outgoing web service calls will fail with security exception. For more information, see [Supported Cipher Suites](../devenv-supported-cipher-suites.md).
