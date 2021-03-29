---
title: "The value assigned to a variable must be used."
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# CodeCop Rule AA0206
The value assigned to a variable must be used.

## Description
The value assigned to a variable must be used, otherwise the variable is not necessary.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
Unused variable can be confusing for the reader and can cost performance to the system.

## Bad code example
```AL
procedure AddEntities@1(FilterStr@1000 : Text[250])
var
    Vendor@1001 : Record Vendor;
    Count@1002 : Integer;
begin
    Count := 0;
    Vendor.SETFILTER("No.",FilterStr);
    if Vendor.FINDSET() then
    repeat
        "User ID" := USERID(); 
        "Vendor No." := Vendor."No.";
        If Vendor.Insert() THEN;
    until Vendor.NEXT() = 0; 
end;
```

## Good code example
```AL
procedure AddEntities@1(FilterStr@1000 : Text[250])
var
    Vendor@1001 : Record Vendor;
begin
    Vendor.SETFILTER("No.",FilterStr);
    if Vendor.FINDSET() then
    repeat
        "User ID" := USERID(); 
        "Vendor No." := Vendor."No.";
        if Vendor.INSERT() then;
    until Vendor.NEXT() = 0; 
end;
```

## Good and bad practices for fixing the rule

Remove the variable or make use of it if not using it was a mistake.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  