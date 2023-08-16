---
title: "HttpClient.Put(Text, HttpContent, var HttpResponseMessage) Method"
description: "Sends a PUT request to the specified URI as an asynchronous operation."
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
# HttpClient.Put(Text, HttpContent, var HttpResponseMessage) Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a PUT request to the specified URI as an asynchronous operation.


## Syntax
```AL
[Ok := ]  HttpClient.Put(Path: Text, Content: HttpContent, var Response: HttpResponseMessage)
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

## Example
The PUT request method either replaces an existing resource or creates a new one using request body payload. To make an HTTP PUT request, given an HttpClient and a URI, use the HttpClient.Put method:

```AL
    local procedure PutRequest(json: Text;) ResponseText: Text
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
        //    userId = 1,
        //    id = 1,
        //    title = "foo bar",
        //    completed = false
        // }
        Content.WriteFrom(json);
        
        IsSuccessful := Client.Put('https://jsonplaceholder.typicode.com/todos/1', Content, Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

        Response.Content().ReadAs(ResponseText);

        // Expected output:
        //   PUT https://jsonplaceholder.typicode.com/todos/1 HTTP/1.1
        //   {
        //     "userId": 1,
        //     "id": 1,
        //     "title": "foo bar",
        //     "completed": false
        //   }
    end;
```

The preceding code:
- Prepares a HttpContent instance with the JSON body of the request (MIME type of "application/json" and using the character encoding UTF8).
- Makes a PUT request to "https://jsonplaceholder.typicode.com/todos/3".
- Ensures that the response is successful.
- Reads the response body as a string.

## Content headers

[!INCLUDE[ContentHeaders](../../../includes/include-http-contentheaders.md )]

## Supported HTTP methods

[!INCLUDE[SupportedHTTPmethods](../../../includes/include-http-methods.md )]



## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)