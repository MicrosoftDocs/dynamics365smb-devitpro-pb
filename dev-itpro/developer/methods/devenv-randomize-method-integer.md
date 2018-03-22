---
title: "RANDOMIZE Method (Integer)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 21e2d99a-2774-47c5-9cff-fd31070dbe0e
caps.latest.revision: 15
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RANDOMIZE Method (Integer)
Generates a set of random numbers from which the [RANDOM Method \(Integer\)](devenv-RANDOM-Method-Integer.md) will select a random number.  
  
## Syntax  
  
```  
  
RANDOMIZE([Seed])  
```  
  
#### Parameters  
 *Seed*  
 Type: Integer  
  
 A number used to create a unique set of numbers.  
  
## Remarks  
 If you use the same number as *Seed*, the same set of numbers is generated. If you omit this optional parameter, **RANDOMIZE** uses the current system time \(total number of milliseconds since midnight\). Calling the **RANDOMIZE** method before the **RANDOM** method makes the random numbers more unpredictable.  
  
 Furthermore, the random generator is specific to each connection so the sequence of numbers that is returned when you call the **RANDOM** method will be the same after each call to **RANDOMIZE** with a specific seed.  
  
## Example  
 The following example generates random numbers between 1 and 5 by using the *Seed* from the **RANDOMIZE** method to initialize the random number generator in the **RANDOM** method. The **RANDOMIZE** method uses the data from system clock as the *Seed* value.  
  
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
 [ABS Method \(Decimal, Integer, BigInteger\)](devenv-ABS-Method-Decimal-Integer-BigInteger.md)   
 [POWER Method \(Decimal, Integer, BigInteger\)](devenv-POWER-Method-Decimal-Integer-BigInteger.md)   
 [RANDOM Method \(Integer\)](devenv-RANDOM-Method-Integer.md)   
 [ROUND Method \(Decimal\)](devenv-ROUND-Method-Decimal.md)