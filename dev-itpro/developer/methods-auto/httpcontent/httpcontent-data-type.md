---
title: "HttpContent Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpContent Data Type
> **Version**: _Available from runtime version 1.0._

Represents an HTTP entity body and content headers.



The following methods are available on instances of the HttpContent data type.

|Method name|Description|
|-----------|-----------|
|[Clear()](httpcontent-clear-method.md)|Sets the HttpContent object to a default value. The content contains an empty string and empty headers.|
|[GetHeaders(var HttpHeaders)](httpcontent-getheaders-method.md)|Gets the HTTP content headers as defined in RFC 2616.|
|[ReadAs(var Text)](httpcontent-readas-text-method.md)|Reads the content into the provided text.|
|[ReadAs(var InStream)](httpcontent-readas-instream-method.md)|Reads the content into the provided text.|
|[WriteFrom(Text)](httpcontent-writefrom-text-method.md)|Sets HttpContent content to the provided text or stream.|
|[WriteFrom(InStream)](httpcontent-writefrom-instream-method.md)|Sets HttpContent content to the provided text or stream.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

An instance of HttpContent encapsulates the body and the associated headers of an HTTP request that will be sent to a remote endpoint or that is being received from a remote endpoint.
The HttpContent data type is a value type. This means that when assigning an instance of HttpContent to a variable, a copy will be created. 

## Example
The following example illustrates how to use the HttpContent type to send a simple POST request containing JSON data.

```al
codeunit 50110 MyCodeunit
{
    procedure MakeRequest(uri: Text; payload: Text) responseText: Text;
    var
        client: HttpClient;
        request: HttpRequestMessage;
        response: HttpResponseMessage;
        contentHeaders: HttpHeaders;
        content: HttpContent;
    begin
        // Add the payload to the content
        content.WriteFrom(payload);

        // Retrieve the contentHeaders associated with the content
        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');

        // Assigning content to request.Content will actually create a copy of the content and assign it.
        // After this line, modifying the content variable or its associated headers will not reflect in 
        // the content associated with the request message
        request.Content := content;

        request.SetRequestUri(uri);
        request.Method := 'POST';

        client.Send(request, response);

        // Read the response content as json.
        response.Content().ReadAs(responseText);
    end;
}

```

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  