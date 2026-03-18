---
title: Call external services with the HttpClient data type
description: Learn about how to call external services using the HttpClient datatype.
ms.custom: bap-template
ms.date: 03/04/2026
ms.reviewer: solsen
ms.topic: how-to
author: kennienp
ms.author: kepontop
---

# Call external services with the HttpClient data type

You can integrate [!INCLUDE[prod_short](includes/prod_short.md)] apps/extensions with external systems by using the *HttpClient* data type in your AL code.

:::image type="content" source="media/httpclient.svg" alt-text="Shows how AL apps/extensions can call external web services from Business Central" lightbox="media/httpclient.svg":::

The [HttpClient data type](methods-auto/httpclient/httpclient-data-type.md) is simply a wrapper on the .NET class HttpClient.  

In this article, you learn how to make HTTP requests using the *HttpClient* data type and handle responses using the *HttpResponseMessage* data type.

## Set up an external call

The first thing you need to do is to define the HTTP request. Specify the URI to call, set request and content HTTP headers, and choose which HTTP method to use. You do this using the `HttpRequestMessage` data type.

The following example illustrates ways to prepare the request.

```AL
    local procedure SendRequest(HttpMethod: Text[6]) ResponseText: Text
    var
        Client: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        RequestHeaders: HttpHeaders;
        RequestURI: Text;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
    begin
        RequestURI := 'https://httpcats.com/418.json';

        // This shows how you can set or change HTTP content headers in your request
        Content.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'multipart/form-data;boundary=boundary');

        // This shows how you can set HTTP request headers in your request
        HttpRequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/json');
        RequestHeaders.Add('Accept-Encoding', 'utf-8');
        RequestHeaders.Add('Connection', 'Keep-alive');

        HttpRequestMessage.SetRequestUri(RequestURI);
        HttpRequestMessage.Method(HttpMethod);

        // from here on, the method must deal with calling out to the external service. 
        // see example code snippets below
    end;
```

Learn more about content headers in [HttpContent data type](methods-auto/httpcontent/httpcontent-data-type.md).  

## Run the call

When you have set up the request, it's time to call out using a supported HTTP method. 

[!INCLUDE[httpCallErrors](../includes/include-http-call-errors-note.md)]

The following example shows how to call an external web service from AL. It also illustrates the error handling you need to setup for handling errors when sending the request.

```AL
    local procedure GetRequest() ResponseText: Text
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        IsSuccessful: Boolean;
        ServiceCallErr: Label 'Web service call failed.';
        ErrorInfoObject: ErrorInfo;
    begin
        // assume you have setup the request here

        IsSuccessful := Client.Get('https://httpcats.com/418.json', Response);

        if not IsSuccessful then begin
            ErrorInfoObject.DetailedMessage := 'Sorry, we could not retrieve the cat info right now.';
            ErrorInfoObject.Message := ServiceCallErr;
            Error(ErrorInfoObject);
        end;
    end;
```

[!INCLUDE[allowhttpclientnote](../includes/include-http-allowhttpclient-note.md)]

### Server-side certificate validation

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

To enhance security of HTTP calls from AL, the AL runtime validates all server certificates used when calling a web service endpoint from the [HttpClient](methods-auto/httpclient/httpclient-data-type.md) datatype. Certificate validation is enabled by default. A server certificate is installed on the endpoint side, it's not the certificate you attach to a request in AL.

If an app or per-tenant extension needs to selectively disable certificate validation, you can use the [HttpClient.UseServerCertificateValidation(Boolean) method](methods-auto/httpclient/httpclient-useservercertificatevalidation-method.md), which allows the AL code to disable server certificate validation for the outgoing web service call.

If you need to debug failing HTTP calls due to server certificates that fail to be validated, telemetry is emitted if there are certificate validation failures. Learn more in [Analyzing server certificate validation errors with telemetry](../administration/telemetry-webservices-outgoing-certificate-validation-errors.md).

With version 27, the server certificate validation is enforced, and the only way to disable it is through the [HttpClient.UseServerCertificateValidation(Boolean) method](methods-auto/httpclient/httpclient-useservercertificatevalidation-method.md). In versions before version 27, the server certificate validation is controlled by the [HttpServerCertificateValidation feature key](devenv-httpcertvalid-feature-key.md), which allows app and per-tenant extension publishers to modify their code.

### Anti-SSRF validation for AL HttpClient

<!--[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]-->

> **Availability:** Anti-SSRF validation is fully available in [!INCLUDE [prod_short](includes/prod_short.md)] online. For on-premises, it's availability depends on the [!INCLUDE [prod_short](includes/prod_short.md)] version and these [!INCLUDE [server](includes/server.md)] settings:
>
>|Setting|Available from update (platform version)|
>|-|-|
>|`NavHttpClientAntiSSRFEnabled`|26.11 (platform 26.0.46773)<br>27.2 (platform 27.0.42799)<br>28.0 (platform 28.0.47117.0)|
>|`NavHttpClientAntiSSRFAllowedAddresses`|26.11 (platform 26.0.46773)<br>27.2 (platform 27.0.42799)<br>28.0 (platform 28.0.47117.0)|

The AL HttpClient is hardened with anti-SSRF (Server-Side Request Forgery) validation. This security measure blocks HTTP requests to internal IP addresses by default, helping protect your environment against server-side request forgery attacks.

This validation is always enabled with [!INCLUDE [prod_short](includes/prod_short.md)] online and can't be disabled. For on-premises deployments that require HTTP calls to internal IP addresses, two server configuration settings are available:

- `NavHttpClientAntiSSRFEnabled` - Controls whether anti-SSRF validation is active. Set to `true` (default) to enable validation, or `false` to disable it entirely.
- `NavHttpClientAntiSSRFAllowedAddresses` - Specifies a list of internal IP addresses that are allowed even when validation is enabled. The value is a JSON array of IP addresses (for example, `["10.0.0.1", "192.168.1.100"]`).

Learn how to configure [!INCLUDE [server](includes/server.md)] in [Configure Business Central Server ](../administration/configure-server-instance.md).

> [!IMPORTANT]
> If your current [!INCLUDE [prod_short](includes/prod_short.md)] version only includes `NavHttpClientAntiSSRFEnabled`, set it to `false` (disable) if your solution needs to  connect to internal endpoints.
>
> Once `NavHttpClientAntiSSRFAllowedAddresses` is available in your version, set it to the specific IP addresses you need to allow and set `NavHttpClientAntiSSRFEnabled` to `true` to enable validation. Disabling validation entirely is discouraged because it removes an important layer of protection against SSRF attacks.

### Supported HTTP methods
 
[!INCLUDE[SupportedHTTPmethods](../includes/include-http-methods.md)]

## Parsing the result

If the `HttpClient` call succeeds, you get a response back from the service you called. The response is saved in the data type `HttpResponseMessage`, where you can parse it to use the information in your app. The service call itself might not succeed, so make sure that you check the HTTP status code in your AL code.

The following example illustrates the error handling you need to set up for handling errors from the service that you called.

```AL
    local procedure GetRequest() ResponseText: Text
    var
        Client: HttpClient;
        IsSuccessful: Boolean;
        ServiceCallErr: Label 'Web service call failed.';
        ErrorInfoObject: ErrorInfo;
    begin
        IsSuccessful := Client.Get('https://httpcats.com/418.json', HttpResponseMessage);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not HttpResponseMessage.IsSuccessStatusCode() then begin
            HttpStatusCode := HttpResponseMessage.HttpStatusCode();
            ErrorInfoObject.DetailedMessage := 'Sorry, we could not retrieve the cat info right now. ';
            ErrorInfoObject.Message := Format(ServiceStatusErr, HttpStatusCode, HttpResponseMessage.ReasonPhrase());
            Error(ErrorInfoObject);
        end;

        HttpResponseMessage.Content().ReadAs(ResponseText);
    end;
```

### HTTP status codes

[!INCLUDE[httpStatusCodes](../includes/include-http-status-codes.md)]

### Common HTTP status error codes

[!INCLUDE[httpStatusErrorCodes](../includes/include-http-status-error-codes.md)]

## Advanced scenarios

### Using cookies

Starting from 2024 release wave 1, you can use server-side cookies when calling an external service using `HttpClient`. This capability allows you to efficiently send and receive cookies in HTTP requests, unblocking scenarios where non-Microsoft endpoints require cookie customization. With the `Cookie` datatype and AL methods for handling cookies, you can automatically reuse response cookies, handle cookies manually, or a mix of both. 

### Using certificates

It's possible to include a certificate when calling an external service using `HttpClient`. 

[!INCLUDE[httpclient_cert_example](includes/include-http-cert-example.md)]

[!INCLUDE[httpclient_cert_note](includes/include-http-cert-note.md)]

Learn more about certificates in:

- [HttpClient.AddCertificate method](methods-auto/httpclient/httpclient-addcertificate-string-string-method.md)  
- [Supported cipher suites in HTTPS](devenv-supported-cipher-suites.md).

### Which IP addresses or ranges does my environment use?

When you exchange data through external services, you might have to safelist the IP addresses from where the [!INCLUDE[prod_short](includes/prod_short.md)] service is running. 

Learn more in:
 
- [FAQ: IP addresses or ranges for the Business Central service](../faq.yml#which-ip-addresses-or-ranges-does-my-environment-s-api-use)  
- [How-to restrict network access from/to Business Central](../security/security-service-tags.md).

## Testing external calls

Testability of AL code that interacts with external web services is enhanced when the responses from these services can be simulated in AL, eliminating the need to configure actual endpoints. Mocking outbound web calls is useful when testing that your code is capable of handling a wide range of possible responses. It allows you to track outbound traffic during the test executions.

Learn more in [Mock outbound HttpClient web service calls during testing](devenv-httpclient-mock-outbound-calls.md).

## Monitor and troubleshoot

[!INCLUDE[httpclientTelemetry](../includes/telemetry-outgoing-http.md)]

### Application Insights

You can set up [!INCLUDE[prod_short](includes/prod_short.md)] to send telemetry traces to an Application Insights resource in Azure. Once set up, telemetry data is sent to the resource when web services are called using the HttpClient data type. Learn more in [Analyzing outgoing web service request telemetry](../administration/telemetry-webservices-outgoing-trace.md).  

### Troubleshoot errors

[!INCLUDE[httpclientErrors](../includes/errors-outgoing-http.md)]

## Performance considerations

[!INCLUDE[httpclientPerformance](../includes/performance-outgoing-http.md)]

## Related information

[Supported cipher suites in HTTPS](devenv-supported-cipher-suites.md)  
[How-to restrict network access from/to Business Central](../security/security-service-tags.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[HttpContent data type](methods-auto/httpcontent/httpcontent-data-type.md)  
[Analyzing outgoing web service request telemetry](../administration/telemetry-webservices-outgoing-trace.md)  
[Developing extensions](devenv-dev-overview.md)  
[Get started with AL](devenv-get-started.md)  
[Mock outbound HttpClient web service calls during testing](devenv-httpclient-mock-outbound-calls.md)  
[HttpServerCertificateValidation feature key](devenv-httpcertvalid-feature-key.md)
