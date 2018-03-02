---
title: Integer Data Type
description: This simple data type stores whole numbers, and the integers can also be represented as Boolean values where -1 represents true and 0 as false.
ms.custom: na
ms.date: 10/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ede60a1a-e656-4135-9859-f264d0aa2a66
caps.latest.revision: 8
---
# Integer Data Type in Dynamics NAV
This simple data type stores whole numbers with values that range from -2,147,483,647 to 2,147,483,647.  
  
## Remarks  
 In addition to representing whole numbers in this range, you can use integers to represent Boolean values. For Boolean values, -1 represents **true** and 0 represents **false**.  
  
 If you assign -2,147,483,648 directly to an Integer variable, then you get an error when you try to compile the code. However, you can indirectly assign -2,147,483,648 to an Integer variable by using the following code.  
  
```  
IntegerVar := -2147483647;  
IntegerVar := IntegerVar - 1;  
```  
  
 If you try to indirectly assign a value that is smaller than -2,147,483,648 or larger than 2,147,483,647, then you get a run-time error.  
  
## Example  
 The following are examples of integer values.  
  
```  
546  
-3425  
```  
  
## Example  
 The following example is a decimal and not an integer.  
  
```  
342.45  
```  
  
## See Also  
 [BigInteger Data Type](BigInteger-Data-Type.md)   
 [Decimal Data Type](Decimal-Data-Type.md)   
 [ABS Function \(Decimal, Integer, BigInteger\)](ABS-Function--Decimal--Integer--BigInteger-.md)   
 [POWER Function \(Decimal, Integer, BigInteger\)](POWER-Function--Decimal--Integer--BigInteger-.md)   
 [RANDOM Function \(Integer\)](RANDOM-Function--Integer-.md)   
 [RANDOMIZE Function \(Integer\)](RANDOMIZE-Function--Integer-.md)   
 [ROUND Function \(Decimal\)](ROUND-Function--Decimal-.md)