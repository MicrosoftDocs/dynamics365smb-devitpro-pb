---
title: "NonDebuggable attribute"
description: "Specifies that the annotated symbol will not be available to the debugger."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# NonDebuggable attribute
> **Version**: _Available or changed with runtime version 2.0._

Specifies that the annotated symbol will not be available to the debugger. E.g. methods can't be stepped through and variables can't be inspected.


## Applies to

- Variable
- Method


## Syntax

```AL
[NonDebuggable]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
Add `[NonDebuggable]` to each method that you want to hide from the debugger.

```AL
codeunit 50142 NoDebuggingOfMethod
{
    [NonDebuggable]
    local procedure MyProcedure()
    var
        myInt: Integer;
    begin
        //Make something happen
    end;
}

```

Add `[NonDebuggable]` to each variable that you want to hide from the debugger.
```AL
codeunit 50143 NoDebuggingOfVar
{
    local procedure MyProcedure()
    var
        [NonDebuggable]
        myInt: Integer;
    begin
        //Make something happen
    end;
}

```

## Remarks

Regardless of the resource exposure policy setting, methods and variables marked with `[NonDebuggable]` remain unavailable to the debugger.

> [!NOTE]  
> Snapshot debugging collects frames for non-debuggable methods but doesn't show their variables at snap points.

Learn more in [Resource Exposure Policy Setting](../devenv-security-settings-and-ip-protection.md).
  
## Related information

[AL method reference](../methods-auto/library.md)  
[Debugging](../devenv-debugging.md)
