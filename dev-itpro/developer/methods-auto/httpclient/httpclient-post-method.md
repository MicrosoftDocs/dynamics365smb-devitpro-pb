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

## Ways that HttpClient.Post calls can fail
The method HttpClient.Post can fail and return false in the following ways:

[!INCLUDE[httpclientFailureReasonsList](../../includes/include-http-call-failure-reasons.md)]

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
- Prepares an HttpContent instance with the JSON body of the request (MIME type of "application/json" and using the character encoding UTF8).
- Makes a POST request to "https://jsonplaceholder.typicode.com/todos".
- Ensures that the response is successful.
- Reads the response body as a string.


## Example (How to upload a file using multipart/form-data)
The Content-Type _multipart/form-data_ allows you to post multiple types of data in the same HTTP request and is commonly used for streaming data to an endpoint.

To use multipart/form-data with Httpclient, you need to do the following:
1. Create a _content payload_, including defining the boundary between data elements
2. Add the file content and file name to the content payload
3. Set up the HTTP content header multipart/form-data

After these steps, your AL code should follows usual practices for Httpclient POST requests.

The methods for adding file content to the content payload differs depending if the file is a text file such as JSON or XML, or if it's a binary file. So we provided two different code examples below, one for each scenario:

### Example (How to upload a text file using multipart/form-data)

```AL
    procedure UploadJson(json: Text; Url: Text)
    var
        Client: HttpClient;
        Content: HttpContent;
        Headers: HttpHeaders;
        Response: HttpResponseMessage;
        MultiPartBody: TextBuilder;
        Boundary: Text;
        ResponseMessage: Text;
    begin
        Boundary := CreateGuid();
        MultiPartBody.AppendLine('--' + Format(Boundary));
        MultiPartBody.AppendLine('Content-Disposition: form-data; name="<add your formname here>"');
        MultiPartBody.AppendLine();
        MultiPartBody.AppendLine('--' + Format(Boundary));
        MultiPartBody.AppendLine('Content-Disposition: form-data; name="file"; filename="<add filename here>"');
        MultiPartBody.AppendLine('Content-Type: application/octet-stream');
        MultiPartBody.AppendLine();
        MultiPartBody.AppendLine(json);
        MultiPartBody.AppendLine('--' + Format(Boundary) + '--');

        Content.WriteFrom(MultiPartBody.ToText());

        Content.GetHeaders(Headers);
        if Headers.Contains('Content-Type') then
            Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'multipart/form-data; boundary="' + Format(Boundary) + '"');

        IsSuccessful := Client.Post(Url, Content, Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

    end;
```


### Example (How to upload a binary file using multipart/form-data)
The main reason for the code example being different when dealing with binary data is that we need to preserve the encoding of the data. A conversion to text might change the encoding.

```AL
    procedure UploadBinaryFile(ContentToBeUploaded: InStream; Url: Text)
    var
        Client: HttpClient;
        Content: HttpContent;
        Headers: HttpHeaders;
        Response: HttpResponseMessage;
        MultiPartBody: TextBuilder;
        MultiPartBodyOutStream: : OutStream;
        MultiPartBodyInStream: InStream;
        TempBlob: Record TempBlob temporary;
        Boundary: Text;
        ResponseMessage: Text;
    begin
        TempBlob.Blob.CreateOutStream(MultiPartBodyOutStream);

        Boundary := CreateGuid();
        MultiPartBody.AppendLine('--' + Format(Boundary));
        MultiPartBody.AppendLine('Content-Disposition: form-data; name="<add your formname here>"');
        MultiPartBody.AppendLine();
        MultiPartBody.AppendLine('--' + Format(Boundary));
        MultiPartBody.AppendLine('Content-Disposition: form-data; name="file"; filename="<add filename here>"');
        //add file Content-Type eg. image/jpeg, image/png. If not known, use application/octet-stream.
        MultiPartBody.AppendLine('Content-Type: <add file Content-Type here>');
        MultiPartBody.AppendLine();
        MultiPartBodyOutStream.WriteText(MultiPartBody.ToText());

        CopyStream(MultiPartBodyOutStream, ContentToBeUploaded);

        MultiPartBody.Clear();
        MultiPartBody.AppendLine('--' + Format(Boundary) + '--');
        MultiPartBodyOutStream.WriteText(MultiPartBody.ToText());

        TempBlob.Blob.CreateInStream(MultiPartBodyInStream);
        Content.WriteFrom(MultiPartBodyInStream);

        Content.GetHeaders(Headers);
        if Headers.Contains('Content-Type') then
            Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'multipart/form-data; boundary="' + Format(Boundary) + '"');

        IsSuccessful := Client.Post(Url, Content, Response);

        if not IsSuccessful then begin
            // handle the error
        end;

        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;

    end;
```

### Example (How to upload large files using multipart/form-data)
Some endpoints have restrictions on the size of files that can be uploaded and hence you might need to split and upload the file in chunks. The system application SharePoint module has an implementation for how to achieve this. For more information, see [Share Point module](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/SharePoint).


## Content headers

[!INCLUDE[ContentHeaders](../../../includes/include-http-contentheaders.md )]


## Supported HTTP methods

[!INCLUDE[SupportedHTTPmethods](../../../includes/include-http-methods.md )]

## Contributors

*This article is maintained by Microsoft. Parts of the examples were originally written by the following contributors.*

* [Michael Megel](https://www.linkedin.com/in/michaelmegel/) | Microsoft MVP
* [Nikolay Arhangelov](https://www.linkedin.com/in/nikolay-arhangelov/) | Technical Manager


## See Also
[Call external services with the HttpClient data type](../../devenv-httpclient.md)
[HttpClient Data Type](httpclient-data-type.md)
[Get Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)
