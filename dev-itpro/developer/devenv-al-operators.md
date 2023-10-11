---
title: AL operators
description: Describes the operators you can use in AL for Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.topic: conceptual
ms.collection: 
ms.date: 10/11/2023
ms.custom: bap-template
---

# AL operators

Operators can be used in expressions to combine, investigate, and adjust values and data elements. This article describes the operators that you can use in AL.

## AL operators and meaning

The following table shows the valid operators in AL.

|AL operator | Meaning |
|:---|:---|
|`.`|Fields in records, controls on pages, and reports|
|`()`|Parentheses|
|`[ ]`|Indexing|
|`::`|Scope|
|`+`|Addition|
|`-`|Subtraction or negation|
|`*`|Multiplication|
|`/`|Division|
|`DIV`|Integer division|
|`MOD`| Modulus|
|`>`|Greater than|
|`>=`|Greater than or equal to|
|`<`|Less than|
|`<=`|Less than or equal to|
|`=`|Equal to|
|`<>`|Not equal to|
|`IN`|In range|
|`AND`|Logical conjunction|
|`OR`|Logical disjunction|
|`NOT`|Logical negation|
|`XOR`|Exclusive logical disjunction|
|`..`|Range|
|`@`|Case-insensitive|

The `+` and the `-` operators can be used both as unary and binary operators. The `NOT` operator can only be used as a unary operator. All the other operators are binary.

Most of the operators can be used on different data types. The action of these operators may depend on the data type of the expression that they are used on.

### Example 1

In this example, the "+" operator is used as a binary operator.
```
number + number
``` 

This returns the sum of the numbers, that is, a result of type number.

### Example 2

In this example, the "+" operator is used as a binary operator.

```
string + string
```

This returns the concatenation of the strings, that is, a result of the type string.

### Example 3

In this example, the "+" operator is used as a unary operator to indicate sign.

```
+34545  
```

## Operator hierarchy

Operators are organized in a hierarchy that determines the order in which the operands in a given expression are evaluated. The following list shows the order of precedence of the AL operators:

1. .(fields in records), [ ] (indexing), () (parentheses), :: (scope)

2. NOT, - (unary), + (unary)

3. *,/,DIV, MOD, AND, XOR

4. +, -, OR

5. , <. >=, <=, = <>, IN

6. .. (range)

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