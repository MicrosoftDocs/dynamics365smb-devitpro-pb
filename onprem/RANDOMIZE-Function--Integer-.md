---
title: "RANDOMIZE Function (Integer)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 21e2d99a-2774-47c5-9cff-fd31070dbe0e
caps.latest.revision: 15
manager: edupont
---
# RANDOMIZE Function (Integer)
Generates a set of random numbers from which the [RANDOM Function \(Integer\)](RANDOM-Function--Integer-.md) will select a random number.  
  
## Syntax  
  
```  
  
RANDOMIZE([Seed])  
```  
  
#### Parameters  
 *Seed*  
 Type: Integer  
  
 A number used to create a unique set of numbers.  
  
## Remarks  
 If you use the same number as *Seed*, the same set of numbers is generated. If you omit this optional parameter, **RANDOMIZE** uses the current system time \(total number of milliseconds since midnight\). Calling the **RANDOMIZE** function before the **RANDOM** function makes the random numbers more unpredictable.  
  
 Furthermore, the random generator is specific to each connection so the sequence of numbers that is returned when you call the **RANDOM** function will be the same after each call to **RANDOMIZE** with a specific seed.  
  
## Example  
 The following example generates random numbers between 1 and 5 by using the *Seed* from the **RANDOMIZE** function to initialize the random number generator in the **RANDOM** function. The **RANDOMIZE** function uses the data from system clock as the *Seed* value.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|x|Integer|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|X=%1|  
  
```  
  
RANDOMIZE();  
x := RANDOM(5);  
MESSAGE(Text000, x);  
```  
  
## See Also  
 [ABS Function \(Decimal, Integer, BigInteger\)](ABS-Function--Decimal--Integer--BigInteger-.md)   
 [POWER Function \(Decimal, Integer, BigInteger\)](POWER-Function--Decimal--Integer--BigInteger-.md)   
 [RANDOM Function \(Integer\)](RANDOM-Function--Integer-.md)   
 [ROUND Function \(Decimal\)](ROUND-Function--Decimal-.md)