---
title: "File.Read Method"
description: "Reads from an MS-DOS encoded file or binary file."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# File.Read Method
> **Version**: _Available or changed with runtime version 1.0._

Reads from an MS-DOS encoded file or binary file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Read := ]  File.Read(var Read: Any)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*File*  
&emsp;Type: [File](file-data-type.md)  
An instance of the [File](file-data-type.md) data type.

*Read*  
&emsp;Type: [Any](../any/any-data-type.md)  
Streams a BigText object that is stored as a BLOB in a table to a BigText variable.  


## Return Value
*Read*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
 If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To read from a file that is larger than 1024 bytes, use streams instead of the **File.Read** method.  
<!-- For more information, see [How to: Use Streams to Read from Text Files](How-to-Use-Streams-to-Read-from-Text-Files.md).  
 --> 
  
MS-DOS encoding, which is also referred to as OEM encoding, is an older format than UTF-8 and UTF-16, but it is still widely supported. MS-DOS encoding was the only format that was supported by earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)].  
  
MS-DOS encoding requires a different character set for each language. MS-DOS text is encoded to the internal Unicode data type by using the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. If you read a file that uses MS-DOS encoding, then you must set the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to match the language of the data in the file that is being read. For example, if the file contains text in Danish, then you must set the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to Danish before you call the **Read** method \(File\) or [Write Method \(File\)](file-writemode-method.md).  
  
We recommend that you use the File data type for files that were created in earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)].  
  
To read or write files in Unicode or in other formats, we recommend that you use .NET Framework interoperability and use the [System.IO Namespace](/dotnet/api/system.io).  
  
## Example  

The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The READ method read the contents of the file and stores it in the String variable. The method returns the size of the text that was read, stores it in the varSize variable, and displays it in a message box. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt that contains less than 500 bytes. 

```al
 var
    Testfile: File;
    String: Text[500];
    varSize: Integer;
begin
    TestFile.Open('C:\TestFolder\TestFile.txt');  
    varSize := TestFile.Read(String);  
    Message('The text "%1" is %2 bytes.', String, varSize);  
end;
```  
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)