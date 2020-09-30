---
title: "System.GetLastErrorCode Method"
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
# System.GetLastErrorCode Method
Gets the classification of the last error that occurred.


## Syntax
```
String :=   System.GetLastErrorCode()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You use the GETLASTERRORCODE method to identify the type of the last error that occurred. You use the [GETLASTERRORTEXT Method](../../methods-auto/system/system-getlasterrortext-method.md) to get the details of the last error.  
  
 The result of the GETLASTERRORCODE method is not translated into the local language. The result of the [GETLASTERRORTEXT Method](../../methods-auto/system/system-getlasterrortext-method.md) is translated into the local language.  
  
## Example  
 This example opens a file and then causes an error to occur by trying to open the file again. If the code for the error that occurred is not the expected error code, then an error message is displayed.  
  

```  
var
    ErrorCode: Text[1024];  
    ExpectedErrorCode: Text[1024];  
    FileObj1: File;
    FileObj2: File;
    Text0001: Label 'The error code is not valid. Expected: %1. Actual: %2. Error message: %3';
begin
    ExpectedErrorCode := 'StreamIO';  
    FileObj1.CREATETEMPFILE;  
    ASSERTERROR FileObj2.CREATE(FileObj1.NAME);  
    ErrorCode := GETLASTERRORCODE;  
    if ErrorCode <> ExpectedErrorCode then  
      ERROR(Text001, ExpectedErrorCode, ErrorCode, GETLASTERRORTEXT);  
end;
  
```  
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)