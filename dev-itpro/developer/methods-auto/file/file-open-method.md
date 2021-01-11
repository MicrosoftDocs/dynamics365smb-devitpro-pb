---
title: "File.Open Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.Open Method
> **Version**: _Available from runtime version 1.0._

Opens an ASCII or binary file. This method does not create the file if it does not exist.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  File.Open(Name: String [, Encoding: TextEncoding])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*File*
&emsp;Type: [File](file-data-type.md)
An instance of the [File](file-data-type.md) data type.

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
  
*Encoding*  
&emsp;Type: [TextEncoding](../textencoding/textencoding-option.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you call Open on a file variable that refers to an open file, then the method does not automatically close the existing file and open the new file. You must explicitly call the [Close Method \(File\)](../../methods-auto/file/file-close-method.md) to close the existing file. If you call Open on a file that is already open, then a run-time error occurs.  
  
## Example

This example shows how to open an .xml file for reading in text mode. To use this example, you must create the simple.xml file at C:\\temp and create the following variable.  

```al
 var
    TestFile: File;
```
  
```al
TestFile.TextMode(True);  
TestFile.WriteMode(False);  
TestFile.Open('C:\temp\simple.xml');  
```  
  
If you want to be explicit about the encoding of a file, you can set the *TextEncoding* parameter. The following code example replaces the last statement in the previous example.  
  
```al
TestFile.TextMode(True);  
TestFile.WriteMode(False);  
TestFile.Open('C:\temp\simple.xml', TextEncoding::Windows);  
```  
  

## See Also

[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)