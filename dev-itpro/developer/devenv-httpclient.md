---
title: Call external services with the HttpClient data type
description: Learn about how to call external services using the HttpClient datatype.
ms.custom: bap-template
ms.date: 07/26/2023
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
author: kennienp
ms.author: kepontop
---

# Call external services with the HttpClient data type

The [HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  is simply a wrapper on the .NET class HttpClient.  

In this article, you learn how to make HTTP requests using the _HttpClient_ data type and handle responses using the _HttpResponseMessage_ data type. 

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
        if ContentHeaders.Contains('Content-Type') then headers.Remove('Content-Type');
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

For more information about content headers, see [HttpContent data type](methods-auto/httpcontent/httpcontent-data-type.md)  

## Run the call

When you have setup the request, it's time to call out using a supported HTTP method. The call might fail in the [!INCLUDE[prod_short](../includes/prod_short.md)] platform before actually reaching the external web service. It's therefore important that you check for possible errors in your AL code. One common error occurs if you have added duplicate request or content HTTP headers.

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


## Advanced scenarios

### Using certificates

It's possible to include a certificate when calling an external service. 

The following example shows how to add a certificate to the HttpClient data type.

```AL
// This code shows how to use certificates with HttpClient
procedure AddCertificateToHttpClient(var HttpClient: HttpClient; CertificateCode: Text[6])
var
    IsolatedCertificate: Record "Isolated Certificate";
    CertificateManagement: Codeunit "Certificate Management";
begin
    if not IsolatedCertificate.Get(CertificateCode) then
        exit;
    HttpClient.AddCertificate(
        CertificateManagement.GetCertAsBase64String(IsolatedCertificate),
        CertificateManagement.GetPassword(IsolatedCertificate));
end;
```

For more information about certificates, see [HttpClient.Send(HttpRequestMessage, var HttpResponseMessage) Method](methods-auto/httpclient/httpclient-addcertificate-method.md)

## Monitor and troubleshoot

[!INCLUDE[httpclientTelemetry](../includes/telemetry-outgoing-http.md)]

### Application Insights

You can set up [!INCLUDE[prod_short](includes/prod_short.md)] to send telemetry traces to an Application Insights resource in Azure. Once set up, telemetry data is sent to the resource when web services are called using the HttpClient data type. For more information, see, [Analyzing outgoing web service request telemetry](../administration/telemetry-webservices-outgoing-trace.md).  

### Troubleshoot errors

[!INCLUDE[httpclientErrors](../includes/errors-outgoing-http.md)]

## Performance considerations

[!INCLUDE[httpclientPerformance](../includes/performance-outgoing-http.md)]

## See also

[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[HttpContent data type](methods-auto/httpcontent/httpcontent-data-type.md)  
[Analyzing outgoing web service request telemetry](../administration/telemetry-webservices-outgoing-trace.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Get Started with AL](devenv-get-started.md)  