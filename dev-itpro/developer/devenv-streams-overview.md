---
title: Using streams in Business Central
description: Introducing how to use streams in Business Central AL code.
author: KennieNP
ms.custom: na
ms.date: 04/02/2024
ms.reviewer: solsen
ms.topic: conceptual
ms.author: kepontop
---

# Using streams in Business Central

The AL language in [!INCLUDE [prod_short](includes/prod_short.md)] comes with support for streaming of data. In this article, we introduce what streams are and how they can be used in your app. 

## What is a stream?

A stream is an abstraction of a sequence of bytes, such as a file, an input/output device, an inter-process communication pipe, or a TCP/IP socket. The stream datatypes in AL provide a generic view of these different types of input and output, and isolate the programmer from the specific details of the operating system and the underlying devices.

Streams involve three fundamental operations:
- You can read from streams. Reading is the transfer of data from a stream into a data structure, such as a Text or Blob.
- You can write to streams. Writing is the transfer of data from a data structure such as Text or Blob into a stream.
- Streams can support seeking. Seeking refers to querying and modifying the current position within a stream. Seek capability depends on the kind of backing store a stream has. For example, network streams have no unified concept of a current position, and therefore typically do not support seeking.

A stream is an object used for transfering data, so no actual data is not stored in the stream. When working with streams in AL, you need three things
1. a data source such as a file, a Blob, or a HTTP request
2. a stream object connected to the data source. The stream has a direction of reading or writing data to/from the data source.
3. an object in the AL runtime acting as the consumer or the emitter of the data.

## How are streams implemented in AL?

The AL stream object/methods are wrappers over corresponding .NET stream concepts. In C#, you only have one object called Stream. The direction (read/write) is determined by using the Read/Write methods as illustrated in this C# example:

// how to write the content of one stream into another stream in C#
static void CopyStream(Stream input, Stream output){
    byte[] buffer = new byte[0x1000];
    int read;
    while ((read = input.Read(buffer, 0, buffer.Length)) > 0) 
        output.Write(buffer, 0, read);
}

In AL, the direction of the data flow is encoded in the two datatypes InStream and OutStream. 

:::image type="content" source="media/streams.svg" alt-text="Illustration of how different personas have different analytics needs." lightbox="media/streams.svg":::


The AL runtime also has a built-in method for copying a stream, see 
System.CopyStream(OutStream: OutStream, InStream: InStream [, BytesToRead: Integer]).


## Why use streams?

- memory
- performance
- for BC online - there are no local files


## Examples of stream support

There are many examples of AL datatypes or objects that support stream, such as 

- HttpClient
- File (only for on-premises)
- Blob fields in the database
- Excel buffer (OpenBookStream)
- CSV buffer (LoadDataFromStream / WriteToStream? )
- Upload/download (UploadIntoStream/DownloadFromStream)


How to read/write data from/to an HTTP stream with Business Central?
How to read/write data from/to an BLOB with Business Central?
How to read/write data from/to an local file with Business Central?
How to read/write data from/to JSON with Business Central?
Upload/download a file using streams    
    UploadIntoStream
    Could we provide overload that skips first three parameters (only used in C/CIDE)?
    DownloadFromStream
    Could we provide overload that skips the three parameters that are only used in C/CIDE?


> [!TIP]
>
> When streaming binary data, you might need to do a Base64 encoding to make it available as a text stream. The System Application has a module for this, see [Codeunit "Base64 Convert"](/business-central/application/system-application/codeunit/system.text.base64-convert).



## See also

