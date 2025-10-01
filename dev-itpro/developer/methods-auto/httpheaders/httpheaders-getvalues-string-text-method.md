---
title: "HttpHeaders.GetValues(Text, Array of [Text]) Method"
description: "Gets the values for the specified key."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpHeaders.GetValues(Text, Array of [Text]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the values for the specified key.


## Syntax
```AL
[Ok := ]  HttpHeaders.GetValues(Key: Text, Values: Array of [Text])
```
## Parameters
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-data-type.md)  
An instance of the [HttpHeaders](httpheaders-data-type.md) data type.  

*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
The specified header.  

*Values*  
&emsp;Type: [Text](../text/text-data-type.md)  
The specified header values.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the specified header name and values are stored in the collection; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

This example demonstrates:

- Adding multiple values to the same header name (Accept header with different MIME types)
- Retrieving header values using the GetValues() method
- Checking the return value to ensure the header exists
- Iterating through the array to process each value
- Practical use case with response headers like Set-Cookie that often have multiple values

```al
procedure ExampleGetValues()
var
    HttpClient: HttpClient;
    HttpRequestMessage: HttpRequestMessage;
    HttpResponseMessage: HttpResponseMessage;
    HttpHeaders: HttpHeaders;
    HeaderValues: array[10] of Text;
    HeaderKey: Text;
    i: Integer;
    Success: Boolean;
begin
    // Initialize HTTP request
    HttpRequestMessage.Method := 'GET';
    HttpRequestMessage.SetRequestUri('https://api.example.com/data');
    
    // Add multiple values for the same header (for example, Accept header)
    HttpHeaders := HttpRequestMessage.GetHeaders();
    HttpHeaders.Add('Accept', 'application/json');
    HttpHeaders.Add('Accept', 'application/xml');
    HttpHeaders.Add('Accept', 'text/plain');
    
    // Get the values for the Accept header
    HeaderKey := 'Accept';
    Success := HttpHeaders.GetValues(HeaderKey, HeaderValues);
    
    if Success then begin
        Message('Found %1 values for header %2:', ArrayLen(HeaderValues), HeaderKey);
        
        // Display each value
        for i := 1 to ArrayLen(HeaderValues) do begin
            if HeaderValues[i] <> '' then
                Message('Value %1: %2', i, HeaderValues[i]);
        end;
    end else begin
        Message('Header %1 not found or has no values', HeaderKey);
    end;
    
    // Send the request
    if HttpClient.Send(HttpRequestMessage, HttpResponseMessage) then begin
        // Process response headers
        HttpHeaders := HttpResponseMessage.GetHeaders();
        
        // Check for Set-Cookie headers (servers often send multiple)
        HeaderKey := 'Set-Cookie';
        Clear(HeaderValues);
        
        if HttpHeaders.GetValues(HeaderKey, HeaderValues) then begin
            Message('Response contains cookies:');
            for i := 1 to ArrayLen(HeaderValues) do begin
                if HeaderValues[i] <> '' then
                    Message('Cookie %1: %2', i, HeaderValues[i]);
            end;
        end;
    end;
end;
```

## Related information

[HttpHeaders Data Type](httpheaders-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  