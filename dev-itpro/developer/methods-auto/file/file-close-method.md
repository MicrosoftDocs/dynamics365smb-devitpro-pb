---
title: "File.Close() Method"
description: "Closes a file that has been opened by the OPEN method (File)."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# File.Close() Method
> **Version**: _Available or changed with runtime version 1.0._

Closes a file that has been opened by the OPEN method (File).

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 File.Close()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Parameters
*File*  
&emsp;Type: [File](file-data-type.md)  
An instance of the [File](file-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the file is not open, a run-time error will occur.  
  
## Example

The following example determines whether the specified file exists. If it exists, the [WriteMode Method \(File\)](file-writemode-method.md) allows the file to be open for writing. The [Open Method \(File\)](file-open-method.md) opens the file, the [Write Method \(File\)](file-writemode-method.md) writes the text “Hello World” to the file, and then the Close method closes the file. If the file does not exist, an error message is displayed. This example assumes that you have created the following file C:\\TestFolder\\TestFile2.txt.  

```al
var
    FileName: Text;
    TestFile: File;
begin
    FileName := 'C:\TestFolder\TestFile2.txt';  
    if Exists(FileName) then begin  
      TestFile.WriteMode(true);  
      TestFile.Open(FileName);  
      TestFile.Write('Hello World');  
      TestFile.Close;  
    end else  
    Message('%1 does not exist.', FileName);  
end;
```

## See Also

[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)