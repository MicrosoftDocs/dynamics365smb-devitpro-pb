---
title: "HttpClient.Send(HttpRequestMessage, var HttpResponseMessage) Method"
description: "Sends an HTTP request as an asynchronous operation."
ms.author: solsen
ms.custom: na
ms.date: 03/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpClient.Send(HttpRequestMessage, var HttpResponseMessage) Method
> **Version**: _Available or changed with runtime version 1.0._

Sends an HTTP request as an asynchronous operation.


## Syntax
```AL
[Ok := ]  HttpClient.Send(Request: HttpRequestMessage, var Response: HttpResponseMessage)
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*Request*  
&emsp;Type: [HttpRequestMessage](../httprequestmessage/httprequestmessage-data-type.md)  
The HTTP request message to send.  

*Response*  
&emsp;Type: [HttpResponseMessage](../httpresponsemessage/httpresponsemessage-data-type.md)  
The response received from the remote endpoint.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Ways that HttpClient.Send calls can fail
The method HttpClient.Send can fail and return false in the following ways:

- The requestUri is not an absolute URI.
- The chosen HTTP method is not supported.
- The request failed due to an underlying issue such as network connectivity, DNS failure, server certificate validation or timeout.
- The request failed due to timeout.

[!INCLUDE[allowhttpclientnote](../../../includes/include-http-allowhttpclient-note.md)]


## Example (HTTP PATCH)
As an example of how to use the HttpClient.Send, we illustrate how to do a HTTP PATCH request. Examples of the other supported HTTP methods (DELETE, GET, POST, or PUT), see the respective articles for their methods (HttpClient.Delete, HttpClient.Get, HttpClient.Post, or HttpClient.Put).

The PATCH request is a partial update to an existing resource. It doesn't create a new resource, and it's not intended to replace an existing resource. Instead, it updates a resource only partially. To make an HTTP PATCH request, given an HttpClient and a URI, use the HttpClient.Send method:

```AL
    local procedure PatchRequest(json: Text;) ResponseText: Text
    var
        Client: HttpClient;
        RequestMessage: HttpRequestMessage;        
        Content: HttpContent
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
    begin
        Content.GetHeaders(ContentHeaders);

        if ContentHeaders.Contains('Content-Type') then headers.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        if ContentHeaders.Contains('Content-Encoding') then headers.Remove('Content-Encoding');
        ContentHeaders.Add('Content-Encoding', 'UTF8');
        
        // assume that the json parameter contains the following data
        //
        // {
        //    title = "updated title",
        //    completed = true
        // }
        Content.WriteFrom(json);

        RequestMessage.SetRequestUri('https://jsonplaceholder.typicode.com/todos/1');
        RequestMessage.Method('PATCH');
        RequestMessage.Content(Content);

        IsSuccessful := Client.Send(RequestMessage, Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

        Response.Content().ReadAs(ResponseText);

        // Expected output
        //   PATCH https://jsonplaceholder.typicode.com/todos/1 HTTP/1.1
        //   {
        //     "userId": 1,
        //     "id": 1,
        //     "title": "updated title",
        //     "completed": true
        //   }
    end;
```

The preceding code:
- Prepares a HttpContent instance with the JSON body of the request (MIME type of "application/json" and using the character encoding UTF8).
- Makes a PATCH request to "https://jsonplaceholder.typicode.com/todos/1".
- Ensures that the response is successful.
- Reads the response body as a string.


## Content headers

[!INCLUDE[ContentHeaders](../../../includes/include-http-contentheaders.md )]

## Supported HTTP methods

[!INCLUDE[SupportedHTTPmethods](../../../includes/include-http-methods.md )]

## See Also
[Call external services with the HttpClient data type](../../devenv-httpclient.md)  
[HttpClient Data Type](httpclient-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)