---
title: Boolean operators
description: Description of the boolean operators in AL
ms.reviewer: solsen
ms.topic: conceptual
ms.collection: 
ms.date: 01/15/2024
ms.custom: bap-template
author: KennieNP
---

# Boolean (logical) operators

Logical operators can only be used with arguments that can be evaluated to a boolean.  

## Boolean operators

As the following table shows, the `not` operator is a unary prefix operator. This means that it takes only one argument and is placed in front of the argument. The `and`, `or`, and `xor` operators are binary infix operators; they take two arguments and are placed between the corresponding arguments.  

|Operator|Name|Expression|Resulting data type|  
|--------|----|----------|-------------------------|  
|`not`|Logical negation|not bool|Boolean|  
|`and`|Logical and|bool1 and bool2|Boolean|  
|`or`|Logical or|bool1 or bool2|Boolean|  
|`xor`|Exclusive logical or|bool1 xor bool2|Boolean|  

## See also
<!-- more links -->
[Arithmetic operators](devenv-al-arithmetic-operators.md)  
[Relational operators](devenv-al-relational-operators.md)