---
title: "OPEN Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 963cd8f8-1a8e-4eda-9b8c-5b04f59af615
caps.latest.revision: 19
---
# OPEN Function (File)
Opens an ASCII or binary file. This function does not create the file if it does not exist.  
  
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
  
 Optionally, you can specify the encoding on the file. By specifying the text encoding, you ensure that all the language-specific characters are represented correctly in [!INCLUDE[navnow](includes/navnow_md.md)] when you read data and write data.  
  
 For more information, see [Text Encoding](Text-Encoding.md).  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies whether the file was opened. If you omit this optional return value and if the file cannot be found, then a run-time error occurs.  
  
 **true** if the file was opened; otherwise, **false**.  
  
## Remarks  
 If you call OPEN on a file variable that refers to an open file, then the function does not automatically close the existing file and open the new file. You must explicitly call the [CLOSE Function \(File\)](CLOSE-Function--File-.md) to close the existing file. If you call OPEN on a file that is already open, then a run-time error occurs.  
  
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
 [File Data Type](File-Data-Type.md)   
 [Text Encoding](Text-Encoding.md)