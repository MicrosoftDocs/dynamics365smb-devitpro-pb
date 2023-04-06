---
title: "C/AL Compound Statements"
description: "Describing the C/AL compound statements."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dd09d7e4-8664-4fee-874a-1791944659cc
caps.latest.revision: 8
---
# C/AL Compound Statements
A compound statement is one type of control structure in C/AL.  

## Using Compound Statements  
 In some cases, the C/AL syntax only lets you use a single statement. However, if you have to execute more than one simple statement, the statements can be written as a compound statement by enclosing the statements between the BEGIN and END keywords.  

```  
BEGIN  
  <Statement 1>;  
  <Statement 2>;  
  ..  
  <Statement n>;  
END  
```  

 The individual statements are separated by a semicolon. In C/AL, a semicolon is used to separate statements and not, as in other programming languages, as a terminator symbol for a statement. Nevertheless, an extra semicolon before an END does not cause an error because it is interpreted by the compiler as an empty statement.  

## Blocks  
 The BEGIN-END structure is also called a *block*. Blocks can be very useful to refer to the other control structures in C/AL.  

 When BEGIN follows THEN, ELSE, or DO, it should be on the same line and preceded by one space character.  

### Example  

```  
IF (x = y) AND (a = b) THEN BEGIN  
  x := a;  
  y := b;  
END;   
```  

### Example  

```  
IF (xxx = yyyyyyyyyy) AND   
   (aaaaaaaaaa = bbb)  
THEN BEGIN  
  x := a;  
  x := y;  
  a := y;  
END ELSE BEGIN  
  y := x;  
  y := a;  
END;  
```  

## See Also  
 [C/AL Conditional Statements](C-AL-Conditional-Statements.md)   
 [C/AL Repetitive Statements](C-AL-Repetitive-Statements.md)   
 [C/AL WITH Statements](C-AL-WITH-Statements.md)
