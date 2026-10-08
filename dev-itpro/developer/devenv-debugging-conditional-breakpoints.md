---
title: Set Conditional Breakpoints in AL
description: Set conditional breakpoints in Visual Studio Code to pause AL code only when variables, fields, or supported expressions meet a condition.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 10/07/2026
ms.topic: concept-article
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Use conditional breakpoints when debugging AL

Add a condition to a [breakpoint](devenv-debugging.md#breakpoints) to pause code execution only when the condition is true. A condition can use variables or fields that are in scope. You can compare them to other variables, fields, or literal values of the following supported types:

## Simple data types supported

- `BigInteger`
- `Boolean`
- `Code`
- `Date`
- `DateTime`
- `Decimal`
- `Enum`
- `Integer`
- `Option`
- `Text`
- `Time`

## Complex data types supported (version 26 and later)

- `Array`
- `List`
- `Dictionary`
- `Record` and `RecordRef` fields
- `Variant` when it wraps one of the supported types

## Operators supported

|Operator|Description| Remarks|
|--------|-----------|--------|
|`=`| Equal to|-|
|`<>`| Not equal to|-|
|`<`| Less than|-|
|`>`| Greater than|-|
|`<=`| Less than or equal to|-|
|`>=`| Greater than or equal to|-|
|`+`| Numeric unary plus |Supported from version 26 and later.|
|`-`| Numeric negation  |Supported from version 26 and later.|
|`NOT`| Logical negation  | Supported from version 26 and later.|
|`AND`, `OR`|Logical|Use parentheses to control precedence.<br><br>Supported from version 26 and later.|

> [!NOTE]
> Parenthesize complex expressions explicitly; AL operator precedence rules apply.

## Set a conditional breakpoint

1. Start a debugging session and find the line where you want to test a condition.
1. Right-click the editor margin, and then select **Add Conditional Breakpoint**. To change an existing breakpoint, right-click it and select **Edit Breakpoint**.
1. In the inline dialog, select **Expression**, and then enter the condition.

> [!NOTE]
> There are other options in the inline dialog, such as **Hit Count** and **Log Message**. These options aren't supported in AL.

> [!NOTE]
> If you clear an existing condition, then that breakpoint is no longer a conditional breakpoint.

## Examples

Suppose an application process loops over invoices and stops responding on sales invoice 103007. To break only for that invoice, set a breakpoint on the first line of the loop and add the following condition:

```al
SalesInvoiceHeader."No." = '103007'
```

When code execution reaches the breakpoint, the debugger evaluates the condition. Execution stops if the condition is true and continues if the condition is false.

Here are some additional examples of conditional breakpoints:

Break when a dictionary entry equals a value:

```al
CustomerAges['ALFRED'] > 30
```

Break when the third element in an array is negative:

```al
MyArray[3] < 0
```

Break on combined criteria (parenthesized):

```al
(SalesHeader.Status = 0) AND (SalesHeader."No." = '103007')
```

In this expression, `0` is the ordinal value of `Sales Document Status::Open`. Conditional-breakpoint expressions don't support enum-member syntax.

Break when a Boolean flag is false:

```al
NOT IsValidated
```

## Related information

[Get started with AL](devenv-get-started.md)  
[Debugging in AL](devenv-debugging.md)  
