---
title: "NonDebuggable Attribute"
description: "The NonDebuggable attribute in AL for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# NonDebuggable Attribute

Specifies that a method or a variable is hidden from debugging in the sense that you cannot set breakpoints in the code or inspect any variables.

## Syntax  

```AL  
[NonDebuggable]
```
  
## Example
Setting the attribute on a method. Each method must be marked with `[NonDebuggable]`.

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

Setting the attribute on variables. Each variable must be marked as `[NonDebuggable]`.
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
  
## See Also  

[AL Method Reference](../methods-auto/library.md)  
[Debugging](../devenv-debugging.md)