---
title: "OPEN Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 963cd8f8-1a8e-4eda-9b8c-5b04f59af615
caps.latest.revision: 19
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OPEN Method (File)
Opens an ASCII or binary file. This method does not create the file if it does not exist.  
  
## Syntax  
  
```  
  
[Ok := ] File.OPEN(Filename[,TextEncoding.value])  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Specifies the file.  
  
 *Filename*  
 Type: Text  
  
 Specifies the name and path of the file to open.  
  
 *TextEncoding*  
 Value: **MsDos**, **UTF8**, **UTF16**, or **Windows**  
  
 Optionally, you can specify the encoding on the file. By specifying the [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md), you ensure that all the language-specific characters are represented correctly in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] when you read data and write data.  
  
 For more information, see [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md).  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies whether the file was opened. If you omit this optional return value and if the file cannot be found, then a run-time error occurs.  
  
 **true** if the file was opened; otherwise, **false**.  
  
## Remarks  
 If you call OPEN on a file variable that refers to an open file, then the method does not automatically close the existing file and open the new file. You must explicitly call the [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) to close the existing file. If you call OPEN on a file that is already open, then a run-time error occurs.  
  
## Example  
 This example shows how to open an .xml file for reading in text mode. To use this example, you must create the simple.xml file at C:\\temp and create the following variable.  
  
|Variable|DataType|  
|--------------|--------------|  
|TestFile|File|  
  
```  
TestFile.TEXTMODE(TRUE);  
TestFile.WRITEMODE(FALSE);  
TestFile.OPEN('C:\temp\simple.xml');  
```  
  
 If you want to be explicit about the encoding of a file, you can set the *TextEncoding* parameter. The following code example replaces the last statement in the previous example.  
  
```  
TestFile.TEXTMODE(TRUE);  
TestFile.WRITEMODE(FALSE);  
TestFile.OPEN('C:\temp\simple.xml', TextEncoding::Windows);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)   
 [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md)