---
title: BigInteger Data Type
description: BigInteger data type stores very large whole numbers that range from -9,223,372,036,854,775,807 to 9,223,372,036,854,775,807 in Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 227f707b-04f6-47c6-9feb-0fb9499d11e5
caps.latest.revision: 9
manager: edupont
---
# BigInteger Data Type in Dynamics NAV
Stores very large whole numbers that range from -9,223,372,036,854,775,807 to 9,223,372,036,854,775,807.  
  
## Remarks  
 This data type is a 64-bit integer.  
  
 You must add an L to the constant definition to inform C/AL that the integer must be interpreted and treated as a BigInteger.  
  
 If you assign -9,223,372,036,854,775,808 directly to a BigInteger variable, then you get an error when you try to compile the code. However, you can indirectly assign -9,223,372,036,854,775,808 to a BigInteger variable by using the following code.  
  
```  
BigIntegerVar := -9223372036854775807L;  
BigIntegerVar := BigIntegerVar - 1;  
```  
  
 If you try to indirectly assign a value that is smaller than -9,223,372,036,854,775,808, or larger than 9,223,372,036,854,775,807, then you get a run-time error.  
  
## Example  
  
```  
BI := 1L;  
BI := 455500000000L;  
```  
  
## See Also  
 [Decimal Data Type](Decimal-Data-Type.md)   
 [Integer Data Type](Integer-Data-Type.md)   
 [ABS Function \(Decimal, Integer, BigInteger\)](ABS-Function--Decimal--Integer--BigInteger-.md)   
 [POWER Function \(Decimal, Integer, BigInteger\)](POWER-Function--Decimal--Integer--BigInteger-.md)   
 [RANDOM Function \(Integer\)](RANDOM-Function--Integer-.md)   
 [RANDOMIZE Function \(Integer\)](RANDOMIZE-Function--Integer-.md)   
 [ROUND Function \(Decimal\)](ROUND-Function--Decimal-.md)