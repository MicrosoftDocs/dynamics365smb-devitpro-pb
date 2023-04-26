---
title: "C/AL Assignment Statements"
description: "Describing the C/AL compound statements."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f82aa4bd-6242-4d04-aaeb-432b70c74031
caps.latest.revision: 6
---
# C/AL Assignment Statements
Assignment statements assign a value to a variable. The value that you assign to the variable is a C/AL expression. It can be a constant or a variable, or it can consist of multiple elements of C/AL expressions. If you use a function call as the value to assign to a variable in an assignment statement, then the value that is assigned is the return value of the function.  

 You use the ":=" operator for assignment statements.  

## Example  
 The following example assigns a constant integer value to an integer variable that you have defined.  

```  
Count := 1;  
```  

## Example  
 The following example assigns a value that consists of a constant, an operator, and a variable.  

```  
Amount := 2 * Price;  
```  

## Example  
 The following example assigns the return value of the [OPEN Function \(File\)](OPEN-Function--File-.md) to a Boolean variable that you have defined.  

```  
OK := TestFile.OPEN('C:\temp\simple.xml');  
```  

 The return value of the OPEN function is optional. If you do not handle the return value in your code, then a run-time error occurs when a function returns FALSE. The following example causes a run-time error if the file C:\temp\simple.xml cannot be opened.  

```  
TestFile.OPEN('C:\temp\simple.xml');  
```  

 You can handle the return value by using an IF-THEN statement.  

```  
IF TestFile.OPEN('C:\temp\simple.xml') THEN BEGIN  
  // continue running  
ELSE  
  ERROR(Text001);  
```  

## See Also  
 [C/AL Simple Statements](C-AL-Simple-Statements.md)
