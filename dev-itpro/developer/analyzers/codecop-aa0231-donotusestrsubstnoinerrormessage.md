---
title: "StrSubstNo or string concatenation must not be used as a parameter in the Error method."
ms.author: solsen
ms.custom: na
ms.date: 07/16/2020
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
# CodeCop Rule AA0231
StrSubstNo or string concatenation must not be used as a parameter in the Error method.  

## Description
The data classification context will be lost when using the StrSubstNo method or string concatenation as a parameter in the Error method. Instead use the ability of the Error method to insert values into the string with placeholders.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
All error messages are logged into telemetry and we do not allow adding customer data into telemetry. So, all errors that have a `textconst` as the first argument actually log the `textconst` in telemetry, this greatly increases the ability to resolve errors found in telemetry. If `StrSubstNo` or string concatenation is used as first argument the data classification context is lost and no message text is logged in telemetry.
 
## Bad code example

```
var 
   ErrorMsg: Label 'Customer %1 has incorrect email', Comment = '%1 = Customer No.';

local procedure MyProcedure()
begin
    Error(StrSubstNo(ErrorMsg, Customer."No.");
end;
```

```
var
   Text000Err: Label 'There are no planning lines to make orders for. ';
   Text007Err: Label 'This template and worksheet are currently active. ';
local procedure MyProcedure()
begin
    Error(Text000Err + Text007Err);
end;
```

## Good code example

```
var 
    ErrorMsg: Label 'Customer %1 has incorrect email', Comment = '%1 = Customer No.';
local procedure MyProcedure()
begin
    Error(ErrorMsg, Customer."No.");

end;
```

```
var
   ErrorMsg: Label 'There are no planning lines to make orders for. This template and worksheet are currently active. ';
local procedure MyProcedure()
begin
    Error(ErrorMsg);
end;
```

## Good and bad practices for fixing the rule
Use the ability of the [Error](../methods-auto/dialog/dialog-error-method.md) method to insert values (expressions) into the string that has a placeholder.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
