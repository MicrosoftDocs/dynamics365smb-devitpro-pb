---
title: Using streams in Business Central
description: Introducing how to work with streams in Business Central AL code.
author: KennieNP
ms.date: 04/05/2024
ms.reviewer: solsen
ms.topic: conceptual
ms.author: kepontop
---

# Using streams in Business Central

The AL language in [!INCLUDE [prod_short](includes/prod_short.md)] comes with support for streaming of data. In this article, we introduce what streams are and how they can be used in your app. 

## What is a stream?

A stream is an abstraction of a sequence of bytes, such as a file, an input/output device, an inter-process communication pipe, or a TCP/IP socket. The stream data types in AL provide a generic view of these different types of input and output, and isolate the developer from the specific details of the operating system and the underlying devices.

Streams involve three fundamental operations:

- You can read from streams  
    Reading is the transfer of data from a stream into a data structure, such as a Text or Blob.
- You can write to streams  
    Writing is the transfer of data from a data structure such as Text or Blob into a stream.
- Streams can support seeking  
    Seeking refers to querying and modifying the current position within a stream. Seek capability depends on the kind of backing store a stream has. For example, network streams have no unified concept of a current position, and therefore typically don't support seeking.

A stream is an object used for transferring data, so no actual data is stored in the stream. When working with streams in AL, you need three things.

1. A data source such as a file, a Blob, or an HTTP request
2. A stream object connected to the data source. The stream has a direction of reading or writing data to/from the data source.
3. An object in the AL runtime acting as the consumer or the emitter of the data.

## How are streams implemented in AL?

The AL stream object/methods are wrappers over corresponding .NET stream concepts. In C#, you only have one object called Stream. The direction (read/write) is determined by using the Read/Write methods as illustrated in this C# example:

```csharp
// how to write the content of one stream into another stream in C#
static void CopyStream(Stream input, Stream output){
    byte[] buffer = new byte[0x1000];
    int read;
    while ((read = input.Read(buffer, 0, buffer.Length)) > 0) 
        output.Write(buffer, 0, read);
}
```

In AL, the direction of the data flow is instead encoded in the two data types `InStream` and `OutStream` and you need to use an AL object to either consume (read) data from a data source using a stream, or emit (write) data to a data source using a stream. 

:::image type="content" source="media/streams.svg" alt-text="Illustration of how different personas have different analytics needs." lightbox="media/streams.svg":::

The AL runtime also has a built-in method for copying a stream, see 
[System.CopyStream(OutStream: OutStream, InStream: InStream [, BytesToRead: Integer])](methods-auto/system/system-copystream-method.md).

> [!NOTE]
> The CopyStream method stems from the time of the C/AL programming language, which was inspired from the Pascal programming language. In Pascal it's common for procedures to follow the direction of assignments, for example, variable := value (like dest := source). This is the reason why parameters in CopyStream are ordered the way they are.

## Reading data with the InStream data type

The InStream datatype provides a generic stream object with methods that you can use to read from streams. The data type also provides methods to change the position in the stream and a way to get the size of the data source object without the need to read all of the data.

An instance of the InStream datatype must be attached to a data source to work, otherwise you get a runtime error stating that *InStream variable not initialized.*.

```al
trigger OnAction()
var
    vInStr: InStream;
begin
    // this will trigger a runtime error
    Message(Format(vInStr.Length()));
end;
```

The following example illustrates how to read the content from a media field in the database using an InStream object.

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

For more information, see [InStream datatype (reference documentation)](methods-auto/instream/instream-data-type.md).

## Writing data with the OutStream datatype

The OutStream datatype provides a generic stream object with methods that you can use to write to resources using streams. 

An instance of the OutStream datatype must be attached to a data source to work, else you'll get a runtime error stating that *InStream variable not initialized.*.

The following example illustrates how to read the content from an uploaded file using an InStream object and then copy the stream content into a blob field using an OutStream object.

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

For more information, see [OutStream datatype (reference documentation)](methods-auto/outstream/outstream-data-type.md)


## Why use streams?

- Memory efficiency: Streams allow you to work with large amounts of data without loading it all into memory at once. If you can stream data instead of storing it in a variable, then the [!INCLUDE [prod_short](includes/prod_short.md)] server has less large objects to handle when the operating system does garbage collection, and this in turn will improve the general performance of the system.
- Performance efficiency: Streams allow you to work with data as it becomes available, rather than waiting for all of it to arrive.
- When working with [!INCLUDE [prod_short](includes/prod_short.md)] online - you can't use the file system directly. Streams provide a way to work with data without having to store it in a file.


## Examples of stream support

There are many AL data types or objects that you can use to consume data from streams or emit data to streams. In this table, you can some examples on how to do this. The list isn't exhaustive.

| Data source | Consume data with InStream | Emit data with OutStream |
| ----------- | -------------------------- | ------------------------ |
| Web service | Read data from stream: [HttpContent.ReadAs](methods-auto/httpcontent/httpcontent-readas-instream-method.md) <br><br> Send data using stream: [HttpContent.WriteFrom](methods-auto/httpcontent/httpcontent-writefrom-instream-method.md)|  | 
| Local file (only for on-premises) | [File.CreateInStream](methods-auto/file/file-createinstream-method.md) | [File.CreateOutStream](methods-auto/file/file-createoutstream-method.md) |
| File Upload/download | [DownloadFromStream](methods-auto/file/file-downloadfromstream-method.md) | [UploadIntoStream](methods-auto/file/file-uploadintostream-string-string-string-text-instream-method.md) |
| XML document | [XmlDocument.ReadFrom](methods-auto/xmldocument/xmldocument-readfrom-instream-xmlreadoptions-xmldocument-method.md) | [XmlDocument.WriteTo](methods-auto/xmldocument/xmldocument-writeto-outstream-method.md) |
| JSON document | [JsonObject.ReadFrom](methods-auto/jsonobject/jsonobject-readfrom-instream-method.md)| [JsonObject.WriteTo(OutStream)](methods-auto/jsonobject/jsonobject-writeto-outstream-method.md) |
| Media/Mediaset | [Media.ImportStream](methods-auto/media/media-importstream-instream-text-text-method.md) <br><br>[MediaSet.ImportStream](methods-auto/mediaset/mediaset-importstream-method.md)  | [Media.ExportStream](methods-auto/media/media-exportstream-method.md) |
| Excel (in-memory buffer) | [OpenBookStream](/dynamics365/business-central/application/base-application/table/system.io.excel-buffer#openbookstream) | [SaveToStream](/dynamics365/business-central/application/base-application/table/system.io.excel-buffer#savetostream) | 
| CSV (in-memory buffer) | [LoadDataFromStream](/dynamics365/business-central/application/base-application/table/system.io.csv-buffer#loaddatafromstream) | | 
| Blob field in the database| [Temp Blob codeunit](/dynamics365/business-central/application/system-application/codeunit/system.utilities.temp-blob) | [Temp Blob codeunit](/dynamics365/business-central/application/system-application/codeunit/system.utilities.temp-blob) |

> [!TIP]
>
> When streaming binary data, you might need to do a Base64 encoding to make it available as a text stream. The System Application has a module for this, see [Codeunit "Base64 Convert"](/dynamics365/business-central/application/system-application/codeunit/system.text.base64-convert).


## Streaming text data

When streaming text data, you need to be aware of encodings, which typically is controlled by the [TextEncoding Option Type](methods-auto/textencoding/textencoding-option.md). For more information, [Text encoding](./devenv-file-handling-and-text-encoding.md#text-encoding)

Also, you might also want to learn more about the semantics of line endings and zero byte terminators. For more information, see [Write, WriteText, Read, and ReadText method behavior for line endings and zero terminators](devenv-write-read-methods-line-break-behavior.md)


## See also

[InStream datatype (AL reference documentation)](methods-auto/instream/instream-data-type.md)   
[OutStream datatype (AL reference documentation)](methods-auto/outstream/outstream-data-type.md)   
[System.CopyStream method (AL reference documentation)](methods-auto/system/system-copystream-method.md)   
[Codeunit "Base64 Convert" (System Application reference documentation)](/dynamics365/business-central/application/system-application/codeunit/system.text.base64-convert)  
[TextEncoding Option Type](methods-auto/textencoding/textencoding-option.md)   
[Text encoding](devenv-file-handling-and-text-encoding.md#text-encoding)  
[Write, WriteText, Read, and ReadText method behavior for line Endings and Zero Terminators](devenv-write-read-methods-line-break-behavior.md)   