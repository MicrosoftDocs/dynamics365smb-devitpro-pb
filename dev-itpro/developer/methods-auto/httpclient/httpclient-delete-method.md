---
title: "HttpClient.Delete(Text, var HttpResponseMessage) Method"
description: "Sends a DELETE request to delete the resource identified by the request URL."
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
# HttpClient.Delete(Text, var HttpResponseMessage) Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a DELETE request to delete the resource identified by the request URL.


## Syntax
```AL
[Ok := ]  HttpClient.Delete(Path: Text, var Response: HttpResponseMessage)
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

## Example
A DELETE request deletes an existing resource. A DELETE request is idempotent but not safe, meaning multiple DELETE requests to the same resources yield the same result, but the request affects the state of the resource. To make an HTTP DELETE request, given an HttpClient and a URI, use the HttpClient.Delete method:

```AL
    local procedure DeleteRequest() ResponseText: Text
    var
        Client: HttpClient;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
    begin
        IsSuccessful := Client.Delete('https://jsonplaceholder.typicode.com/todos/1', Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

        Response.Content().ReadAs(ResponseText);

        // Expected output
        //   DELETE https://jsonplaceholder.typicode.com/todos/1 HTTP/1.1
        //   {}
    end;
```

The preceding code:
- Makes a DELETE request to "https://jsonplaceholder.typicode.com/todos/1".
- Ensures that the response is successful.
- Reads the response body as a string.

## Supported HTTP methods
[!INCLUDE[SupportedHTTPmethods](../../../includes/include-http-methods.md )]

## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)