---
title: "HttpClient.Get(Text, var HttpResponseMessage) Method"
description: "Sends a GET request to get the resource identified by the request URL."
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
# HttpClient.Get(Text, var HttpResponseMessage) Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a GET request to get the resource identified by the request URL.


## Syntax
```AL
[Ok := ]  HttpClient.Get(Path: Text, var Response: HttpResponseMessage)
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path the request is sent to.  

*Response*  
&emsp;Type: [HttpResponseMessage](../httpresponsemessage/httpresponsemessage-data-type.md)  
The response received from the remote endpoint.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Ways that HttpClient.Get calls can fail
The method HttpClient.Get can fail and return false in the following ways:

[!INCLUDE[httpclientFailureReasonsList](../../includes/include-http-call-failure-reasons.md)]


## Example (HTTP GET)
A GET request shouldn't send a body and is used (as the method name indicates) to retrieve (or get) data from a resource. To make an HTTP GET request, given an HttpClient and a URI, use the HttpClient.Get method:

```AL
    local procedure GetRequest() ResponseText: Text
    var
        Client: HttpClient;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
    begin
        IsSuccessful := Client.Get('https://jsonplaceholder.typicode.com/todos/3', Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

        Response.Content().ReadAs(ResponseText);

        // Expected output:
        //   GET https://jsonplaceholder.typicode.com/todos/3 HTTP/1.1
        //   {
        //     "userId": 1,
        //     "id": 3,
        //     "title": "fugiat veniam minus",
        //     "completed": false
        //   }
    end;
```

The preceding code:
- Makes a GET request to "https://jsonplaceholder.typicode.com/todos/3".
- Ensures that the response is successful.
- Reads the response body as a string.

## Supported HTTP methods

[!INCLUDE[SupportedHTTPmethods](../../../includes/include-http-methods.md )]

## See Also
[Call external services with the HttpClient data type](../../devenv-httpclient.md)  
[HttpClient Data Type](httpclient-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)