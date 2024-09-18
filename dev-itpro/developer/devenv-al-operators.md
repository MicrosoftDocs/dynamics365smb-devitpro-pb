---
title: AL operators
description: Describes the operators you can use in AL for Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 07/23/2024
ms.custom: evergreen
ms.collection: get-started
---

# AL operators

Operators can be used in expressions to combine, investigate, and adjust values and data elements. This article describes the operators that are supported in AL.

## AL operators and meaning

The following table shows the valid operators in AL.

These operators are used to perform various operations such as arithmetic, comparison, and logical operations.

### General operators

|AL general operator | Meaning |
|:---|:---|
|`.`|Fields in records, controls on pages, and reports|
|`:=`|Assigns a value to a variable. Assigns the value on the right side of the operator to the variable on the left side.|
|`()`|Parentheses|
|`[ ]`|Indexing|
|`::`|Scope. Returns the IF of an object. Examples: `Report::myReport` or `Query::"My Query"`.|
|`..`|Range|
|`@`|Case-insensitive|

### Arithmetic operators

Arithmetic operators are used to perform arithmetic operations on numeric operands. The result of an arithmetic operation is a numeric value.

|AL arithmetic operator | Meaning |
|:---|:---|
|`+`|Addition|
|`-`|Subtraction or negation|
|`*`|Multiplication|
|`/`|Division|
|`div`|Integer division|
|`mod`|Modulus|

### Comparison operators

Comparison operators are used to compare two values. The result of a comparison is a Boolean value, that is, `true` or `false`.

|AL comparison operator | Meaning |
|:---|:---|
|`>`|Greater than|
|`>=`|Greater than or equal to|
|`<`|Less than|
|`<=`|Less than or equal to|
|`=`|Equal to|
|`<>`|Not equal to|

### Logical operators

The logical operators are used on Boolean expressions

|AL logical operator | Meaning |
|:---|:---|
|`and`|Logical conjunction|
|`or`|Logical disjunction|
|`not`|Logical negation|
|`xor`|Exclusive logical disjunction|

### Conditional operators

Conditional operators can be used to test if a condition is met.

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

|AL conditional operator | Meaning |
|:---|:---|
|`? :`| Assign one of two values to a variable, depending on the condition of an expression.|

### Compound operators

Compound assignment operators perform an arithmetic operation and assign the result to the same variable.

|AL compound assignment operator| Meaning|
|:---|:---|
|`+=`|Addition|
|`-=`|Subtraction|
|`*=`|Multiplication|
|`/=`|Division|

The `+` and the `-` operators can be used both as unary and binary operators. The `not` operator can only be used as a unary operator. All the other operators are binary.

Most of the operators can be used on different data types. The action of these operators may depend on the data type of the expression that they are used on.

### Example 1

In this example, the `+` operator is used as a binary operator.

```
number + number
``` 

This returns the sum of the numbers, that is, a result of type number.

### Example 2

In this example, the `+` operator is used as a binary operator.

```
string + string
```

This returns the concatenation of the strings, that is, a result of the type string.

### Example 3

In this example, the `+` operator is used as a unary operator to indicate sign.

```
+34545  
```

### Example 4

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

In this example, the `? :` operator is used to replace a if-then-else clause.

```al
codeunit 50122 TernaryOperator
{
    procedure Example()
    var
        myExpression: Boolean;
        myVar: Text;
    begin

        if myExpression then
            myVar := 'True';
        else
            myVar := 'False';

        myVar := myExpression ? 'True' : 'False';
    end;
}
```

## Operator hierarchy

Operators are organized in a hierarchy that determines the order in which the operands in a given expression are evaluated. The following list shows the order of precedence of the AL operators:

1. `.`(fields in records), `[ ]` (indexing), `()` (parentheses), `::` (scope), `@` (case-insensitive)

2. `not`, `-` (unary), `+` (unary)

3. `*`, `/`, `div`, `mod`, `and`, `xor`

4. `+`, `-`, `or`

5. `>`, `>=`, `<`, `<=`, `=`, `<>`, `in`

6. `..` (range)

### Example 1

```
2 + 3 * 4
```
This expression evaluates to 14.

### Example 2

```
(2 + 3) * 4
```
This expression evaluates to 20.

## See also

[Arithmetic operators](devenv-al-arithmetic-operators.md)  
[Boolean operators](devenv-al-boolean-operators.md)  
[Relational operators](devenv-al-relational-operators.md)  
[Get started with AL](devenv-get-started.md)  
