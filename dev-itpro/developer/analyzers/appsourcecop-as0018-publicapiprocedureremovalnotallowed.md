---
title: "AppSourceCop Rule AS0018"
ms.author: solsen
ms.custom: na
ms.date: 06/08/2021
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
# AppSourceCop Rule AS0018
A procedure belonging to the public API cannot be removed

## Description
A procedure that belongs to the public API cannot be removed, because it will break dependent extensions calling this procedure.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks
Removing or renaming a procedure that belongs to the public API is not allowed, because it will break dependent extensions which are referencing it. It is allowed to remove or rename local or internal procedures.

> [!NOTE]
> Internal procedures are also available for the modules specified in the `internalsVisibleTo` property in your [app.json](../devenv-json-files.md) file.

## How to fix this diagnostic?

Reverting the change will fix this diagnostic. If removing or renaming the procedure is required, the recommended approach is to mark the procedure with the [Obsolete](../attributes/devenv-obsolete-attribute.md) attribute. In a future version, once all dependent extensions have updated their code to not reference the obsolete procedure, you can remove it or rename it.

## Code examples triggering the rule

### Example 1 - Removing a public procedure

Version 1.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
    end;
}

Version 2.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
}
```

In version 2.0, the public procedure `MyProcedure` has been removed. If a dependent extension referenced this procedure, this will lead to a compilation error similar to `The name 'MyProcedure' does not exist in the current context (AL0118)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:

```AL
codeunit 50120 AnotherCodeunit
{
    procedure AnotherMethod()
    var
        c: Codeunit MyCodeunit;
    begin
        c.MyProcedure();
    end;
}
```

### Example 2 - Renaming a public procedure

Version 1.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
        // Business logic
    end;
}

Version 2.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
    procedure MyRenamedProcedure()
    begin
        // Business logic
    end;
}
```

In version 2.0, the public procedure `MyProcedure` has been renamed to `MyRenamedProcedure`. If a dependent extension referenced this procedure, this will lead to a compilation error similar to `The name 'MyProcedure' does not exist in the current context (AL0118)`.

## Code examples not triggering the rule

### Example 1 - Removing a local procedure

Version 1.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
    local procedure MyProcedure()
    begin
    end;
}
```

Version 2.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
}
```

In version 2.0, the local procedure `MyProcedure` has been removed. This is not a breaking change because this procedure couldn't be referenced by other extensions.

### Example 2 - Renaming an internal procedure

Version 1.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
    internal procedure MyProcedure()
    begin
    end;
}
```

Version 2.0 of the extension:

```AL
codeunit 50100 MyCodeunit
{
    internal procedure MyRenamedProcedure()
    begin
    end;
}
```

In version 2.0, the public procedure `MyProcedure` has been renamed to `MyRenamedProcedure`. This is not a breaking change because this procedure couldn't be referenced by other extensions.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
