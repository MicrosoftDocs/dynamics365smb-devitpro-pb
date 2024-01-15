---
title: Relational operators
description: Description of the relational operators in AL and how they are used to compare expressions, as well as valid uses of relational operators.
ms.reviewer: solsen
ms.topic: conceptual
ms.collection: 
ms.date: 01/15/2024
ms.custom: bap-template
author: KennieNP
---

# Relational operators

The relational operators in AL are used to compare expressions.  

## Evaluation rules for relational operators

The following table defines the evaluation rules for relational operators. The rules assume that the data types of the expressions can be compared. For a complete overview of comparable data types, refer to the section [Valid uses of relational operators](#valid-uses-of-relational-operators).  

|Operator|Operator name|Expression|Resulting date type|  
|--------|-------------|----------|-------------------|  
|`>`|Greater than|`Expr > Expr`|Boolean|  
|`\<`|Less than|`Expr \< Expr`|Boolean|  
|`>=`|Greater than or equal|`Expr >= Expr`|Boolean|  
|`\<=`|Less than or equal|`Expr \<= Expr`|Boolean|  
|`\<>`|Not equal to|`Expr \<> Expr`|Boolean|  
|`=`|Equal to|`Expr = Expr`|Boolean|  
|`in`|In range|`Expr in [Valueset]`|Boolean|  

> [!NOTE]  
> When using relational operators, uppercase and lowercase letters in strings are significant. Furthermore, the comparison is based on the built-in character comparison table of the system, that is, not by comparing "true" ASCII characters.  
  
### Valid uses of relational operators

The following table describes the valid uses of the relational operators and the data types that result when expressions are evaluated. The non-valid combinations of types for relational operators are indicated by a dash. All relational operators are binary infix operators; that is, they take a left and a right argument and are placed between the arguments.  

The rows in the table show the type of the left argument and the columns show the type of the right argument. The cells show the resulting data type.  

A valid use of the relational operators is, for example, text compared with text or code, while `boolean` can't be compared with anything other than `boolean`, and so on.  

|Relational operator|Boolean|Char|Option|Integer|Decimal|Date|Time|Text|Code|  
|-----------|------|----|----|----|----|---|----|----------|----------|  
|Boolean|Boolean|||||||||  
|char||Boolean|Boolean|Boolean|Boolean|||||  
|option||Boolean|Boolean|Boolean|Boolean|||||  
|integer||Boolean|Boolean|Boolean|Boolean|||||  
|decimal||Boolean|Boolean|Boolean|Boolean|||||  
|date||||||Boolean||||  
|time|||||||Boolean|||  
|text||||||||Boolean|Boolean|  
|code||||||||Boolean|Boolean|  

## See also

[AL operators](devenv-al-operators.md)  
[Arithmetic operators](devenv-al-arithmetic-operators.md)  
[Boolean operators](devenv-al-boolean-operators.md)