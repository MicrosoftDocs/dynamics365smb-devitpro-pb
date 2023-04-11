---
title: "Relational Operators"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2cada4c5-4ded-4dc5-8e01-c936d4fe0961
caps.latest.revision: 8
---
# Relational Operators
The relational operators are used to compare expressions.  
  
## Evaluation Rules for Relational Operators  
 The following table defines the evaluation rules for relational operators. The rules assume that the data types of the expressions can be compared. For a complete overview of comparable data types, refer to the next section, "Valid Uses of Relational Operators".  
  
|Operator|Operator name|Expression|Resulting date type|  
|--------------|-------------------|----------------|-------------------------|  
|>|Greater than|Expr > Expr|Boolean|  
|\<|Less than|Expr \< Expr|Boolean|  
|>=|Greater than or equal|Expr >= Expr|Boolean|  
|\<=|Less than or equal|Expr \<= Expr|Boolean|  
|\<>|Not equal to|Expr \<> Expr|Boolean|  
|=|Equal to|Expr = Expr|Boolean|  
|IN|In range|Expr IN \[Valueset\]|Boolean|  
  
> [!NOTE]  
>  When using relational operators, uppercase and lowercase letters in strings are significant. Furthermore, the comparison is based on the built-in character comparison table of the system, that is, not by comparing "true" ASCII characters.  
  
### Valid Uses of Relational Operators  
 The following table describes the valid uses of the relational operators and the data types that result when expressions are evaluated. The invalid combinations of types for relational operators are indicated by a dash. All relational operators are binary infix operators; that is, they take a left and a right argument and are placed between the arguments.  
  
 The rows in the table show the type of the left argument and the columns show the type of the right argument. The cells show the resulting data type.  
  
 A valid use of the relational operators is, for example, text compared with text or code, while Boolean cannot be compared with anything other than Boolean, and so on.  
  
|Relational  operator|Boolean|Char|Option|Integer|Decimal|Date|Time|Text|Code|  
|--------------------------|-------------|----------|------------|-------------|-------------|----------|----------|----------|----------|  
|Boolean|Boolean|||||||||  
|char||Boolean|Boolean|Boolean|Boolean|||||  
|option||Boolean|Boolean|Boolean|Boolean|||||  
|integer||Boolean|Boolean|Boolean|Boolean|||||  
|decimal||Boolean|Boolean|Boolean|Boolean|||||  
|date||||||Boolean||||  
|time|||||||Boolean|||  
|text||||||||Boolean|Boolean|  
|code||||||||Boolean|Boolean|  
  
## See Also  
 [Type Conversion](Type-Conversion.md)
