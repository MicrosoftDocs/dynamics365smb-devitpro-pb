---
title: "File.GetStamp Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# File.GetStamp Method
Gets the exact time that a file was last written to.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  File.GetStamp(Name: String, var Date: Date [, var Time: Time])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the file, including the path. When you enter the path, consider these shortcuts:
-   You can omit the drive designation if the file is located on the current drive.
-   You can omit the full path if the file is located in the current directory.
-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.
          
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The date that the file was last written to.
        
*Time*  
&emsp;Type: [Time](../time/time-data-type.md)  
The time that the file was last written to. Optional.
        


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example gets the date and time that a file was written to and displays the data in a message box. The code example assumes that you have created the file 'C:\\MyFolder\\MyText.txt'. This example requires that you create the following global variables and text constant.  

```
 var
    varDate: Date;
    varTime: Time;
    varFileName: Text;
    Text000: Label 'This document was last written to on %1 at %2.';
begin
    varFileName := 'C:\MyFolder\MyText.txt';  
    GETSTAMP(VarFileName, varDate, varTime);  
    MESSAGE(Text000, varDate, varTime);  
end;
```  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)