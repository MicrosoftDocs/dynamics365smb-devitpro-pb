- The `requestUri` isn't an absolute URI.
- The request fails because of an underlying issue, like network connectivity, DNS failure, server certificate validation, or timeout.
- The request times out.
- The response exceeds the allowed limit in MiB. For Business Central online, the limit is 150 MiB. For Business Central on-premises, the server setting `NavHttpClientMaxResponseContentSize` specifies the limit, which is 150 MiB by default.

[!INCLUDE[allowhttpclientnote](../../includes/include-http-allowhttpclient-note.md)]
