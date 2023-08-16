---
title: "HttpClient.Post(Text, HttpContent, var HttpResponseMessage) Method"
description: "Sends a POST request to the specified URI as an asynchronous operation."
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
# HttpClient.Post(Text, HttpContent, var HttpResponseMessage) Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a POST request to the specified URI as an asynchronous operation.


## Syntax
```AL
[Ok := ]  HttpClient.Post(Path: Text, Content: HttpContent, var Response: HttpResponseMessage)
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path the request is sent to.  

*Content*  
&emsp;Type: [HttpContent](../httpcontent/httpcontent-data-type.md)  
The HTTP request content sent to the server.  

*Response*  
&emsp;Type: [HttpResponseMessage](../httpresponsemessage/httpresponsemessage-data-type.md)  
The response received from the remote endpoint.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example (HTTP POST)
A POST request sends data to the server for processing. The Content-Type header of the request signifies what MIME type the body is sending. To make an HTTP POST request, given an HttpClient and a Uri, use the HttpClient.Post method:

```AL
    local procedure PostRequest(json: Text;) ResponseText: Text
    var
        Client: HttpClient;
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
        //    userId = 77,
        //    id = 1,
        //    title = "write code sample",
        //    completed = false
        // }
        Content.WriteFrom(json);

        IsSuccessful := Client.Post('https://jsonplaceholder.typicode.com/todos', Content, Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

        Response.Content().ReadAs(ResponseText);

        // Expected output:
        //   POST https://jsonplaceholder.typicode.com/todos HTTP/1.1
        //   {
        //     "userId": 77,
        //     "id": 201,
        //     "title": "write code sample",
        //     "completed": false
        //   }
    end;
```

The preceding code:
- Prepares a HttpContent instance with the JSON body of the request (MIME type of "application/json" and using the character encoding UTF8).
- Makes a POST request to "https://jsonplaceholder.typicode.com/todos".
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