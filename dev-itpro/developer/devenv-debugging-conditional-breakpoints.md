---
title: Setting conditional breakpoints
description: Overview of setting conditional breakpoints in AL.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 02/27/2024
ms.reviewer: 
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
---

# Setting conditional breakpoints

As part of debugging code, you can set breakpoints and for a certain breakpoint, you can define a condition. If the condition evaluates as true, then code execution breaks at the breakpoint. If the condition is false, then code execution continues. The condition can include any variables or fields that are currently in scope. You can compare a variable or a field to another variable or field, or you can compare a variable or field to a literal value. If you compare to a literal value, then the variable or field that you use in the breakpoint condition must be of one of the following data types:

- BigInteger
- Boolean
- Code
- Decimal
- Integer
- Option
- Text

The following operators are supported in breakpoint conditions:
|Operator|
|--------|
|`=`|  
|`<>`|  
|`<`|  
|`<=`|  
|`=`|  

## To set a conditional breakpoint

When you've enabled debugging mode, and found a place in the code where you want to test a condition, you choose **Run** in the menu bar, select **New Breakpoint**, and then **Conditional Breakpoint**. In the inline dialog, enter a condition that you want to test. There are 4 options for setting a conditional breakpoint:

|Option|Description|
|------|-----------|
|**Expression**|Break when expression evaluates to `true`.|
|**Hit count**|Break when hit count is met.|
|**Log message**|Message to log when breakpoint is hit. |
|**Wait for Breakpoint**|None.|
<!-- check-->


> [!NOTE]  
> If you clear an existing condition, then that breakpoint is no longer a conditional breakpoint.


## Example

In this example, you want to set a breakpoint to debug an application. This application processes invoices in a loop, but it stops responding on a particular invoice. You set a breakpoint on the first line of code in the loop, and then you set the following condition on the breakpoint.

```al
SalesInvoiceHeader."No." = '103007'  
```

When the code execution reaches the breakpoint, the condition is evaluated. If the condition is true, then the code execution breaks at the breakpoint. If the condition is false, then the code execution continues.

## See also

[Debugging in AL](devenv-debugging.md)  