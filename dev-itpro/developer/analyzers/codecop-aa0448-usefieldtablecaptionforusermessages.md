---
title: "You must use the FieldCaption method instead of the FieldName method and TableCaption method instead of TableName method."
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
# CodeCop Rule AA0448
You must use the FieldCaption method instead of the FieldName method and TableCaption method instead of TableName method.  

## Description
If you want to enable your application for multilanguage functionality, you must use the FieldCaption and TableCaption methods instead of the FieldName and TableName methods.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule

Use the FieldCaption(Record) method and the TableCaption(Record) method whenever possible to return names of fields and tables as strings so correct translation will be automatically used. As a result user can always recognize a term that indicates a field or table name. 

> [!NOTE]  
> The only exception to this rule is the Open(Dialog) method. In this method, you can use the field name directly. Otherwise, it can be difficult to align correctly. 

## Bad code example
```
trigger OnValidate()
begin
    if "Order Date" > "Starting Date" then
       Error(Text007, FieldName("Order Date"), FieldName("Starting Date"));
end;

var
    Text007: Label '%1 cannot be greater than %2.';
```

## Good code example
```
trigger OnValidate()
begin
    if "Order Date" > "Starting Date" then
       Error(Text007, FieldCaption("Order Date"), FieldCaption("Starting Date"));
end;

var
    Text007: Label '%1 cannot be greater than %2.';
```

## Good and bad practices for fixing the rule

Change FieldName to FieldCaption or TableName to TableCaption.

## Remarks

The Open(Dialog) method is not checked and is an exception from this rule.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  