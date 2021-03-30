---
title: "Use all lowercase letters for reserved language keywords."
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
# CodeCop Rule AA0241
Use all lowercase letters for reserved language keywords.

## Description
Use all lowercase letters for reserved language keywords. This rule does not apply to built-in methods and types; they must be written using Pascal case.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

We recommend following these best practices when developing extensions in AL to ensure consistency and discoverability on file, object, and method naming, as well as better readability of written code.

Built-in methods and types are not included in this rule because they are written using Pascal case.

## Bad code example

```AL
trigger OnValidate()
BEGIN
    IF "Order Date" > "Starting Date" THEN
       Error(Text007, FieldCaption("Order Date"), FieldCaption("Starting Date"));
END;

VAR
    Text007: Label '%1 cannot be greater than %2.';
```

## Good code example

```AL
trigger OnValidate()
begin
    if "Order Date" > "Starting Date" then
       Error(Text007, FieldCaption("Order Date"), FieldCaption("Starting Date"));
end;

var
    Text007: Label '%1 cannot be greater than %2.';

```

## Good and bad practices for fixing the rule
Change every reserved language keyword to use lowercase letters.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  