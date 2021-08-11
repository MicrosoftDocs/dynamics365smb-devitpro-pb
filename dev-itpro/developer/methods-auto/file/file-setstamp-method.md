---
title: "File.SetStamp(String, Date [, Time]) Method"
description: "Sets a timestamp for a file."
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
# File.SetStamp(String, Date [, Time]) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets a timestamp for a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  File.SetStamp(Name: String, Date: Date [, Time: Time])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the file, including its path. When you enter the path, keep in mind these shortcuts:
-   You can omit the drive designation, if the file is located on the current drive.
-   You can omit the full path, if the file is located in the current directory.
-   You can enter only the subdirectory name, if the file is located in a subdirectory of the current directory.
      
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The date that you want stamped on the file.
        
*[Optional] Time*  
&emsp;Type: [Time](../time/time-data-type.md)  
The time that you want stamped on the file.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The following example sets timestamp for that a file that is named varFileName. The date and time are set to the current date and on your computer respectively. The code example assumes that you have created the following file: 'C:\\MyFolder\\MyText.txt'. The following example requires that you create the following global variables and text constant.  

```al
 var
    varFileName: Text;
    varDate: Date;
    varTime: Time;
    Text000: Label 'The timestamp for this file is Date: %1 Time: %2.';
begin
    VarFileName := 'C:\MyFolder\MyText.txt';  
    varDate := Today;  
    varTime := Time;  
    SetStamp(VarFileName, varDate, varTime);  
    Message(Text000, varDate, varTime);  
end;
```  
  
## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)