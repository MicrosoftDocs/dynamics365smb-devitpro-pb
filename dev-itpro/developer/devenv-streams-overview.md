---
title: Using streams in Business Central
description: Introducing how to work with streams in Business Central AL code.
author: KennieNP
ms.date: 09/14/2026
ms.reviewer: jswymer
ms.topic: how-to
ms.author: kepontop
---

# Using streams in Business Central

The AL language in [!INCLUDE [prod_short](includes/prod_short.md)] supports streaming data. This article introduces streams and explains how to use them in your app. 

## What is a stream?

A stream is an abstraction of a sequence of bytes, such as a file, an input/output device, an inter-process communication pipe, or a TCP/IP socket. The stream data types in AL provide a generic view of these different types of input and output. They isolate the developer from the specific details of the operating system and the underlying devices.

Streams involve three fundamental operations:

- You can read from streams  
    Reading is the transfer of data from a stream into a data structure, such as a Text or Blob.
- You can write to streams  
    Writing is the transfer of data from a data structure such as Text or Blob into a stream.
- Streams can support seeking  
    Seeking refers to querying and modifying the current position within a stream. Seek capability depends on the kind of backing store a stream has. For example, network streams have no unified concept of a current position, and therefore typically don't support seeking.

A stream is an object used for transferring data, so the stream doesn't store any actual data. When you work with streams in AL, you need three things.

1. A data source such as a file, a Blob, or an HTTP request
2. A stream object connected to the data source. The stream has a direction of reading or writing data to or from the data source.
3. An object in the AL runtime acting as the consumer or the emitter of the data.

## How are streams implemented in AL?

The AL stream object and methods wrap corresponding .NET stream concepts. In C#, you use a single object called Stream. The direction (read or write) is clear when you use the Read and Write methods, as shown in this C# example:

```csharp
// how to write the content of one stream into another stream in C#
static void CopyStream(Stream input, Stream output){
    byte[] buffer = new byte[0x1000];
    int read;
    while ((read = input.Read(buffer, 0, buffer.Length)) > 0) 
        output.Write(buffer, 0, read);
}
```

In AL, the direction of the data flow is clear in the two data types `InStream` and `OutStream`. Use an AL object to either consume (read) data from a data source through a stream or emit (write) data to a data source through a stream. 

:::image type="content" source="media/streams.svg" alt-text="Illustration of how different personas have different analytics needs." lightbox="media/streams.svg":::

The AL runtime includes a method for copying a stream. Learn more in [System.CopyStream(OutStream: OutStream, InStream: InStream [, BytesToRead: Integer])](methods-auto/system/system-copystream-method.md).

> [!NOTE]
> The CopyStream method comes from the time of the C/AL programming language, which was inspired by the Pascal programming language. In Pascal, procedures typically follow the direction of assignments. For example, variable := value (like dest := source). This behavior explains the order of parameters in CopyStream.

## Reading data with the InStream data type

The InStream data type provides a generic stream object with methods that you can use to read from streams. The data type also provides methods to change the position in the stream and a way to get the size of the data source object without reading all of the data.

An instance of the InStream data type must be attached to a data source to work. Otherwise, you get a runtime error stating that *InStream variable not initialized.*.

```al
trigger OnAction()
var
    vInStr: InStream;
begin
    // this will trigger a runtime error
    Message(Format(vInStr.Length()));
end;
```

The following example shows how to read the content from a media field in the database by using an InStream object.

```al
procedure ReadTextFromMediaResource(MediaResourcesCode: Code[50]) MediaText: Text
var
    MediaResources: Record "Media Resources";
    TextInStream: InStream;
begin
    if not MediaResources.Get(MediaResourcesCode) then
        exit;
    MediaResources.CalcFields(Blob);

    // After this call, the TextInStream is ready to stream data from the blob field
    MediaResources.Blob.CreateInStream(TextInStream, TextEncoding::UTF8);

    TextInStream.Read(MediaText);
end;
```

Learn more in [InStream datatype (reference documentation)](methods-auto/instream/instream-data-type.md).

## Writing data with the OutStream datatype

The OutStream datatype provides a generic stream object with methods that you can use to write to resources using streams. 

An instance of the OutStream datatype must be attached to a data source to work. Otherwise, you get a runtime error stating that *InStream variable not initialized.*.

The following example illustrates how to read the content from an uploaded file by using an InStream object and then copy the stream content into a blob field by using an OutStream object.

``` AL
procedure InsertBLOBFromFileUpload()
var
    FromFilter: Text;
    File: File;
    FileInStream: InStream;
    BLOBOutStream: OutStream;
    MyTable : Record "Some table";
begin
    FromFilter := 'All Files (*.*)|*.*';
    UploadIntoStream(FromFilter, FileInStream);

    MyTable.Init();
    MyTable.Blob.CreateOutStream(BLOBOutStream);
    CopyStream(BLOBOutStream, FileInStream);

    MyTable.Insert(true);
end;
```

Learn more in [OutStream datatype (reference documentation)](methods-auto/outstream/outstream-data-type.md)


## Why use streams?

- Memory efficiency: Streams allow you to work with large amounts of data without loading it all into memory at once. If you can stream data instead of storing it in a variable, the [!INCLUDE [prod_short](includes/prod_short.md)] server handles fewer large objects when the operating system does garbage collection. This improvement enhances the general performance of the system.
- Performance efficiency: Streams allow you to work with data as it becomes available, rather than waiting for all of it to arrive.
- When working with [!INCLUDE [prod_short](includes/prod_short.md)] online, you can't use the file system directly. Streams provide a way to work with data without having to store it in a file.


## Examples of stream support

Many AL data types and objects can consume data from streams or emit data to streams. The following table provides some examples. The list isn't exhaustive.

| Data source | Consume data with InStream | Emit data with OutStream |
| ----------- | -------------------------- | ------------------------ |
| Web service | Read data from stream: [HttpContent.ReadAs](methods-auto/httpcontent/httpcontent-readas-instream-method.md) <br><br> Send data using stream: [HttpContent.WriteFrom](methods-auto/httpcontent/httpcontent-writefrom-instream-method.md)|  | 
| Local file (only for on-premises) | [File.CreateInStream](methods-auto/file/file-createinstream-method.md) | [File.CreateOutStream](methods-auto/file/file-createoutstream-method.md) |
| File upload/download | [DownloadFromStream](methods-auto/file/file-downloadfromstream-method.md) | [UploadIntoStream](methods-auto/file/file-uploadintostream-string-string-string-text-instream-method.md) |
| XML document | [XmlDocument.ReadFrom](methods-auto/xmldocument/xmldocument-readfrom-instream-xmlreadoptions-xmldocument-method.md) | [XmlDocument.WriteTo](methods-auto/xmldocument/xmldocument-writeto-outstream-method.md) |
| JSON document | [JsonObject.ReadFrom](methods-auto/jsonobject/jsonobject-readfrom-instream-method.md)| [JsonObject.WriteTo(OutStream)](methods-auto/jsonobject/jsonobject-writeto-outstream-method.md) |
| Media/MediaSet | [Media.ImportStream](methods-auto/media/media-importstream-instream-text-text-method.md) <br><br>[MediaSet.ImportStream](methods-auto/mediaset/mediaset-importstream-method.md)  | [Media.ExportStream](methods-auto/media/media-exportstream-method.md) |
| Excel (in-memory buffer) | [OpenBookStream](/dynamics365/business-central/application/base-application/table/system.io.excel-buffer#openbookstream) | [SaveToStream](/dynamics365/business-central/application/base-application/table/system.io.excel-buffer#savetostream) | 
| CSV (in-memory buffer) | [LoadDataFromStream](/dynamics365/business-central/application/base-application/table/system.io.csv-buffer#loaddatafromstream) | | 
| Blob field in the database| [Temp Blob codeunit](/dynamics365/business-central/application/system-application/codeunit/system.utilities.temp-blob) | [Temp Blob codeunit](/dynamics365/business-central/application/system-application/codeunit/system.utilities.temp-blob) |

> [!TIP]
>
> When streaming binary data, you might need to do a Base64 encoding to make it available as a text stream. The System Application has a module for this. Learn more in [Codeunit "Base64 Convert"](/dynamics365/business-central/application/system-application/codeunit/system.text.base64-convert).

## Streaming text data

When streaming text data, you need to be aware of encodings, which the [TextEncoding Option Type](methods-auto/textencoding/textencoding-option.md) typically controls. Learn more in [Text encoding](./devenv-file-handling-and-text-encoding.md#text-encoding).

You might also want to learn more about the semantics of line endings and zero byte terminators. Learn more in [Write, WriteText, Read, and ReadText method behavior for line endings and zero terminators](devenv-write-read-methods-line-break-behavior.md).

## Preview files in the Business Central client

In addition to reading and writing data, you can use streams to display files directly in the Business Central client.

Use the [File.ViewFromStream method](methods-auto/file/file-viewfromstream-method.md) in Business Central online environments to open supported files in the built-in previewer. For on-premises environments, use the [File.View method](methods-auto/file/file-view-method.md). These methods follow the same general pattern as `File.DownloadFromStream` and `File.Download`, but preview supported files in the client instead of downloading them first.

Unlike `File.DownloadFromStream`, which downloads content to the user's device, these methods display the file in the client. Users can preview supported PDF and image files and then download a copy from the previewer if they need one.

Supported image formats include JPEG, JPG, PNG, BMP, SVG, WEBP, ICO, GIF, and AVIF. GIF and AVIF formats include support for animated files. On Safari, TIFF and TIF images are also supported.

Example:

```al
TempBlob.CreateInStream(InStream);
File.ViewFromStream(InStream, 'Sample.png', true);
```

## Related information

[InStream datatype (AL reference documentation)](methods-auto/instream/instream-data-type.md)   
[OutStream datatype (AL reference documentation)](methods-auto/outstream/outstream-data-type.md)   
[System.CopyStream method (AL reference documentation)](methods-auto/system/system-copystream-method.md)   
[Codeunit "Base64 Convert" (System Application reference documentation)](/dynamics365/business-central/application/system-application/codeunit/system.text.base64-convert)  
[TextEncoding Option Type](methods-auto/textencoding/textencoding-option.md)   
[Text encoding](devenv-file-handling-and-text-encoding.md#text-encoding)  
[Write, WriteText, Read, and ReadText method behavior for line Endings and Zero Terminators](devenv-write-read-methods-line-break-behavior.md)   
