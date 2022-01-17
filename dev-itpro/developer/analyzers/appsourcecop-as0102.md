---
title: "AppSourceCop Warning AS0102"
description: "It is not allowed to add a return value to a publicly exposed procedure, because it might break dependent extensions at runtime."
ms.author: solsen
ms.custom: na
ms.date: 01/17/2022
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
# AppSourceCop Warning AS0102
Cannot add a return value to a procedure

## Description
It is not allowed to add a return value to a publicly exposed procedure, because it might break dependent extensions at runtime.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rules validates that a return value has not been added to a publicly exposed procedures. Other changes on the return types of procedures are validated by [AS0023](appsourcecop-as0023.md).

> [!NOTE]  
> This rule also covers the cases related to the [TryFunction](../methods/devenv-tryfunction-attribute.md) attribute which implicitly defines a Boolean return type. 

## How to fix this diagnostic?

Reverting the change will fix this diagnostic. If changing the return type is required, the recommended approach is to mark the procedure with the [Obsolete](../attributes/devenv-obsolete-attribute.md) attribute and introduce a new one with the desired return type. In a future version, once all dependent extensions have updated their code to not reference the obsolete procedure, you can remove it.

## Code examples triggering the rule

In the following examples, the version 1.0 of the extension defines a procedure which does not have a return type.

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
    end;
}
```

### Example 1 - Adding a return type to a procedure

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(): Boolean
    begin
        exit(true);
    end;
}
```

In version 2.0, the procedure `MyProcedure` is now returning a boolean. It does not break the compilation of dependent extensions because they were not consuming the return type of the procedure. However, this change will break the runtime behavior of dependent extensions that referencing this procedure and that have not been recompiled.

### Example 2 - Adding a TryFunction attribute to a procedure

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [TryFunction]
    procedure MyProcedure()
    begin
        exit(true);
    end;
}
```

In version 2.0, the procedure `MyProcedure` is now implictly returning a boolean. It does not break the compilation of dependent extensions because they were not consuming the return type of the procedure. However, this change will break the runtime behavior of dependent extensions that referencing this procedure and that have not been recompiled.

## Code examples not triggering the rule

### Example 1 - Adding a TryFunction attribute to a method returning a boolean

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure() : Boolean
    begin
        exit(true);
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [TryFunction]
    procedure MyProcedure()
    begin
        exit(true);
    end;
}
```

In version 2.0, the procedure is now implicitly returning a Boolean. The return type has not changed.

### Example 2 - Removing a TryFunction attribute and adding a boolean return type

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [TryFunction]
    procedure MyProcedure()
    begin
        exit(true);
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure() : Boolean
    begin
        exit(true);
    end;
}
```

In version 2.0, the procedure is now explicitly returning a Boolean. The return type has not changed.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  