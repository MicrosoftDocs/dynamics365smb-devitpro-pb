---
title: Call external services with the HttpClient data type
description: Learn about how to call external services using the HttpClient datatype.
ms.custom: bap-template
ms.date: 01/08/2024
ms.reviewer: jswymer

ms.topic: conceptual
author: kennienp
ms.author: kepontop
---

# Call external services with the HttpClient data type

You can integrate [!INCLUDE[prod_short](includes/prod_short.md)] apps/extensions with external systems by using the *HttpClient* data type in your AL code.

:::image type="content" source="media/httpclient.svg" alt-text="Shows how AL apps/extensions can call external web services from Business Central" lightbox="media/httpclient.svg":::

The [HttpClient data type](methods-auto/httpclient/httpclient-data-type.md) is simply a wrapper on the .NET class HttpClient.  

In this article, you learn how to make HTTP requests using the *HttpClient* data type and handle responses using the *HttpResponseMessage* data type. 

## Set up an external call

The first thing you need to do is to define the HTTP request, that is, which URI to call, set request and content HTTP headers, and choose which HTTP method to use. You do this using the _HttpRequestMessage_ data type.

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

For more information about content headers, see [HttpContent data type](methods-auto/httpcontent/httpcontent-data-type.md).  

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

### Supported HTTP methods

[!INCLUDE[SupportedHTTPmethods](../includes/include-http-methods.md )]

## Parsing the result

If the HttpClient call succeeds, you get a response back from the service you called. The response is saved in the data type HttpResponseMessage, where you can parse it to use the information in your app. The service call itself might not succeed, so make sure that you check the HTTP status code in your AL code. 

The following example illustrates the error handling you need to setup for handling errors from the service that you called.

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

Starting from 2024 release wave 1, you can use server-side cookies when calling an external service using HttpClient This allows you to efficiently send and receive cookies in HTTP requests, unblocking scenarios where third-party endpoints require cookie customization. With the Cookie datatype and AL methods for handling cookies, you can automatically re-use response cookies, handle cookies manually, or a mix of both. 

<!-- Pending merge to main for 2024w1 content
For more information about server-side cookies, see 
-->


### Using certificates

It's possible to include a certificate when calling an external service using HttpClient. 

[!INCLUDE[httpclient_cert_example](includes/include-http-cert-example.md)]

[!INCLUDE[httpclient_cert_note](includes/include-http-cert-note.md)]

For more information about certificates, see

- [HttpClient.AddCertificate Method](methods-auto/httpclient/httpclient-addcertificate-string-string-method.md)  
- [Supported cipher suites in HTTPS](devenv-supported-cipher-suites.md).

### Which IP addresses or ranges does my environment use?

When you exchange data through external services, you might have to safelist the IP addresses from where the [!INCLUDE[prod_short](includes/prod_short.md)] service is running. 

For more information, see 
- [FAQ: IP addresses or ranges for the Business Central service](../faq.yml#which-ip-addresses-or-ranges-does-my-environment-s-api-use)
- [How-to restrict network access from/to Business Central](../security/security-service-tags.md).

## Monitor and troubleshoot

[!INCLUDE[httpclientTelemetry](../includes/telemetry-outgoing-http.md)]

### Application Insights

You can set up [!INCLUDE[prod_short](includes/prod_short.md)] to send telemetry traces to an Application Insights resource in Azure. Once set up, telemetry data is sent to the resource when web services are called using the HttpClient data type. For more information, see, [Analyzing outgoing web service request telemetry](../administration/telemetry-webservices-outgoing-trace.md).  

### Troubleshoot errors

[!INCLUDE[httpclientErrors](../includes/errors-outgoing-http.md)]

## Performance considerations

[!INCLUDE[httpclientPerformance](../includes/performance-outgoing-http.md)]

## See also

[Supported cipher suites in HTTPS](devenv-supported-cipher-suites.md)  
[How-to restrict network access from/to Business Central](../security/security-service-tags.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[HttpContent data type](methods-auto/httpcontent/httpcontent-data-type.md)  
[Analyzing outgoing web service request telemetry](../administration/telemetry-webservices-outgoing-trace.md)  
[Developing extensions](devenv-dev-overview.md)  
[Get started with AL](devenv-get-started.md)  
