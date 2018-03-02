---
title: "READ Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 7e3a92ab-6042-484b-8243-055c2c76d984
caps.latest.revision: 12
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# READ Method (File)
Reads from an MS-DOS encoded file or binary file.  
  
## Syntax  
  
```  
  
[Read :=] File.READ(Variable)  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer to the file.  
  
 *Variable*  
 Type: any  
  
 The destination variable. You must define the length of the *Variable* parameter to be greater than or equal to the length of the text in the file that is read, and less than 1024.  
  
 If the length of the *Variable* parameter is less than the length of the text in the file, or greater than 1024, then you get the following runtime error:  
  
 **Invalid data encountered in stream, unable to read text.**  
  
 In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], the *Variable* parameter did not have to be as long as the text in the file. The **READ** method could read partial data. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], it is not supported to read fewer than the bytes in the file.  
  
 If you do not define the length of the *Variable* parameter, then you get the following runtime error:  
  
 **READ is not supported for Text without a maximum length.**  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of bytes read.  
  
 This return value is optional.  
  
## Remarks  
 To read from a file that is larger than 1024 bytes, use streams instead of the **File.READ** method.  
 <!-- For more information, see [How to: Use Streams to Read from Text Files](How-to-Use-Streams-to-Read-from-Text-Files.md).  
 --> 
  
 MS-DOS encoding, which is also referred to as OEM encoding, is an older format than UTF-8 and UTF-16, but it is still widely supported. MS-DOS encoding was the only format that was supported by earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].  
  
 MS-DOS encoding requires a different character set for each language. MS-DOS text is encoded to the internal Unicode data type by using the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. If you read a file that uses MS-DOS encoding, then you must set the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to match the language of the data in the file that is being read. For example, if the file contains text in Danish, then you must set the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to Danish before you call the **READ** method \(FILE\) or [WRITE Method \(File\)](devenv-WRITE-Method-File.md).  
  
 We recommend that you use the File data type for files that were created in earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].  
  
 To read or write files in Unicode or in other formats, we recommend that you use .NET Framework interoperability and use the [System.IO Namespace](http://go.microsoft.com/fwlink/?LinkId=262250).  
  
## Example  
 The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The READ method read the contents of the file and stores it in the String variable. The method returns the size of the text that was read, stores it in the varSize variable, and displays it in a message box. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt that contains less than 500 bytes. This example requires that you create the following global variables.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|TestFile|File|Not applicable|  
|String|Text|500|  
|varSize|Integer|Not applicable|  
  
```  
TestFile.OPEN('C:\TestFolder\TestFile.txt');  
varSize := TestFile.READ(String);  
MESSAGE('The text "%1" is %2 bytes.', String, varSize);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)