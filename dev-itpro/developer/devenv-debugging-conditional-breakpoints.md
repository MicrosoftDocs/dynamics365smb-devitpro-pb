---
title: Setting conditional breakpoints
description: Overview of setting conditional breakpoints in AL.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 03/04/2024
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Setting conditional breakpoints

As part of debugging code, you can set [breakpoints](devenv-debugging.md#breakpoints) and for a certain breakpoint, you can define a condition. If the condition evaluates as true, then code execution breaks at the breakpoint. If the condition is false, then code execution continues. The condition can include any variables or fields that are currently in scope. You can compare a variable or a field to another variable or field, or you can compare a variable or field to a literal value. If you compare to a literal value, then the variable or field that you use in the breakpoint condition must be of one of the following data types:

- BigInteger
- Boolean
- Code
- Decimal
- Integer
- Option
- Text

The following operators are supported in breakpoint conditions:

|Operator|Description|
|--------|-----------|
|`=`| Equal to|
|`<>`| Not equal to|
|`<`| Less than|
|`>`| Greater than|
|`<=`| Less than or equal to|
|`=>`| Greater than or equal to| 

## To set a conditional breakpoint

When you've enabled debugging mode, and found a place in the code where you want to test a condition, you can right-click the margin of the code editor, and then choose **Add Conditional Breakpoint**. Or, you can right-click on an existing breakpoint and choose **Edit Breakpoint**. In the inline dialog, choose **Expression** and then enter a condition that you want to test.

> [!NOTE]  
> There are other options in the inline dialog, such as **Hit Count** and **Log Message**. These options aren't supported in AL.

> [!NOTE]  
> If you clear an existing condition, then that breakpoint is no longer a conditional breakpoint.

## Example

In this example, you want to set a breakpoint to debug an application process that loops over a collection of invoices, and stops responding on a particular invoice, for example, on sales invoice no. 103007. To just break for that invoice, you can set a breakpoint on the first line of code in the loop, and set the following condition on the breakpoint.

```al
SalesInvoiceHeader."No." = '103007';  
```

When the code execution reaches the breakpoint, the condition is evaluated. If the condition is true, then the code execution breaks at the breakpoint. If the condition is false, then the code execution continues.

## See also

[Get started with AL](devenv-get-started.md)  
[Debugging in AL](devenv-debugging.md)  
