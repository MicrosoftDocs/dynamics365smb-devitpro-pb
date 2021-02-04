---
title: "File Data Type"
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
# File Data Type
> **Version**: _Available from runtime version 1.0._

Represents a file.


The following methods are available on the File data type.


|Method name|Description|
|-----------|-----------|
|[Copy(String, String)](file-copy-method.md)|Copies a file.|
|[Download(String, String, String, String, var Text)](file-download-method.md)|Sends a file from a server computer to the client computer. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.|
|[DownloadFromStream(InStream, String, String, String, var Text)](file-downloadfromstream-method.md)|Sends a file from server computer to the client computer. The client computer is the computer that is running the Windows client or the computer that is running the browser that accesses the web client.|
|[Erase(String)](file-erase-method.md)|Deletes a file.|
|[Exists(String)](file-exists-method.md)|Determines whether a file exists.|
|[GetStamp(String, var Date [, var Time])](file-getstamp-method.md)|Gets the exact time that a file was last written to.|
|[IsPathTemporary(String)](file-ispathtemporary-method.md)|Validates whether the given path is located in the current users temporary folder within the current service.|
|[Rename(String, String)](file-rename-method.md)|Renames an ASCII or binary file.|
|[SetStamp(String, Date [, Time])](file-setstamp-method.md)|Sets a timestamp for a file.|
|[Upload(String, String, String, String, var Text)](file-upload-method.md)|Sends a file from the client computer to the server computer. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.|
|[UploadIntoStream(String, String, String, var Text, var InStream)](file-uploadintostream-method.md)|Sends a file from the client computer to the corresponding server. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.|

The following methods are available on instances of the File data type.

|Method name|Description|
|-----------|-----------|
|[Close()](file-close-method.md)|Closes a file that has been opened by the Open method (File).|
|[Create(String [, TextEncoding])](file-create-method.md)|Creates an Automation object.|
|[CreateInStream(InStream)](file-createinstream-method.md)|Creates an InStream object for a file. This enables you to import or read data from the file.|
|[CreateOutStream(OutStream)](file-createoutstream-method.md)|Creates an OutStream object for a file. This enables you to export or write data to the file.|
|[CreateTempFile([TextEncoding])](file-createtempfile-method.md)|Creates a temporary file. This enables you to save data of any format to a temporary file. This file has a unique name and will be stored in a temporary file folder.|
|[Len()](file-len-method.md)|Gets the length of an ASCII or binary file.|
|[Name()](file-name-method.md)|Gets the name of an ASCII or binary file.|
|[Open(String [, TextEncoding])](file-open-method.md)|Opens an ASCII or binary file. This method does not create the file if it does not exist.|
|[Pos()](file-pos-method.md)|Gets the current position of the file pointer in an ASCII or binary file.|
|[Read(var Any)](file-read-method.md)|Reads from an MS-DOS encoded file or binary file.|
|[Seek(Integer)](file-seek-method.md)|Sets a file pointer to a new position in an ASCII or binary file.|
|[TextMode([Boolean])](file-textmode-method.md)|Sets whether a file should be opened as an ASCII file or a binary file. Gets the current setting of this option for a file.|
|[Trunc()](file-trunc-method.md)|Truncate an ASCII or binary file to the current position of the file pointer.|
|[Write(Boolean)](file-write-boolean-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Byte)](file-write-byte-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Char)](file-write-char-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Integer)](file-write-integer-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(BigInteger)](file-write-biginteger-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Decimal)](file-write-decimal-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Guid)](file-write-guid-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Text)](file-write-text-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Code)](file-write-code-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Label)](file-write-label-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(BigText)](file-write-bigtext-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Date)](file-write-date-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Time)](file-write-time-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(DateTime)](file-write-datetime-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(DateFormula)](file-write-dateformula-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Duration)](file-write-duration-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Option)](file-write-option-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Record)](file-write-table-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(RecordId)](file-write-recordid-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(String)](file-write-string-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[Write(Any)](file-write-joker-method.md)|Writes to an MS-DOS encoded file or binary file.|
|[WriteMode([Boolean])](file-writemode-method.md)|Use this method before you use Open method (File)] to set or test whether you can write to a file in later calls.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  