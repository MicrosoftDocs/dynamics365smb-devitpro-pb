---
title: Arithmetic operators
description: Description of the arithmetic operators in AL for Business Central.
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 07/01/2024
ms.author: solsen
author: KennieNP
ms.custom: evergreen
ms.collection: get-started
---

# Arithmetic operators

This article contains examples of how to use the type conversion rules for arithmetic operators. The examples illustrate how the operators should be used and the effect of the type conversion that the AL compiler performs. The examples are divided into groups corresponding to the data types in AL.  

## Unary arithmetic operators

The unary arithmetic operators in AL are prefix operators with the following syntax.  

```  
PrefixExpression = PrefixOperator Expression  
```  

The following table shows the data types for which the unary operators in AL are defined, and the resulting data types.  

|Unary operator|Option|Integer|Decimal|  
|--------------|------|-------|-------|  
|`+`|integer|integer|decimal|  
|`-`|integer|integer|decimal|  


## Binary arithmetic operators

The following table shows the data types for which the binary arithmetic operators are defined. The binary arithmetic operators in AL are all infix operators.  

```  
InfixExpression = LeftExpression InfixOperator RightExpression  
```  

|Operator|Boolean|Byte|Char|Option|Integer|Decimal|Date|Time|Text|Code|  
|--|--|--|--|------------|-------------|-------------|----------|----------|----------|----------|  
|`+`|No|Yes|Yes|Yes|Yes|Yes|Yes|Yes|Yes|Yes|  
|`-`|No|Yes|Yes|Yes|Yes|Yes|Yes|Yes|No|No|  
|`*`|No|Yes|Yes|Yes|Yes|Yes|No|No|No|No|  
|`/`|No|Yes|Yes|Yes|Yes|Yes|No|No|No|No|  
|`DIV`|No|Yes|Yes|Yes|Yes|Yes|No|No|No|No|  
|`MOD`|No|Yes|Yes|Yes|Yes|Yes|No|No|No|No|  

In the table, `Yes` means that the operator can take at least one operand \(left, right, or both\) of the given type; `No` means that the operator can't be used with the given type.  

The following table defines the valid uses of the binary arithmetic operators, and the resulting data types.  

### Definition of type conversion rules for the `+` operator  

|The `+` operator|Boolean|Byte/Char|Option|Integer|Decimal|Date|Time|Text|Code|  
|----------------|--|--|--|--|--|----------|----------|----------|----------|  
|Boolean||||||||||  
|Byte/Char||Integer|Integer \(C\)|Integer \(C\)|Decimal \(C\)|||||  
|Option||Integer|Integer \(C\)|Integer \(C\)|Decimal \(C\)|||||  
|Integer||Integer \(C\)|Integer \(C\)|Integer \(C\)|Decimal \(C\)|||||  
|Decimal||Decimal \(C\)|Decimal \(C\)|Decimal \(C\)|Decimal \(C\)|||||  
|Date||Date \(A\) \(C\)|Date \(A\) \(C\)|Date \(A\) \(C\)|Date \(A\) \(C\) \(D\)|||||  
|Time||Time\(B\) \(C\)|Time\(B\) \(C\)|Time\(B\) \(C\)|Time\(B\) \(C\) \(D\)|||||  
|Text||||||||Text|Text|  
|Code||||||||Text|Code|  

 \(A\) The operation isn't defined for the Date 0D.  

 \(B\) The operation isn't defined for the Time 0T.  

 \(C\) Overflow might occur.  

 \(D\) The operation isn't defined if the Decimal has a fractional part.


## Example 1

This table illustrates type conversion in integer operator expressions.  

|Operator|Name|Expression|Resulting data type|  
|--------|----|----------|-------------------|  
|`+`|Time addition|Time + Integer|Time|  
|`-`|Time difference|Time - Time|Integer|  

The time unit is milliseconds. If time is undefined \(0T\), a runtime error occurs.  

## Example 2

This table illustrates type conversion in text and code \(String\) operator expressions.  

|Operator|Name|Expression|Resulting data type|  
|--------|----|----------|-------------------|  
|`+`|Concatenation|Text + Text|Text|  
|`+`|Concatenation|Text + Code|Text|  
|`+`|Concatenation|Code + Text|Text|  
|`+`|Concatenation|Code + Code|Code|  

## See also

[AL operators](devenv-al-operators.md)  
[Boolean operators](devenv-al-boolean-operators.md)  
[Relational operators](devenv-al-relational-operators.md)  