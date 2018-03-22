---
title: "ABS Method (Decimal, Integer, BigInteger)"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 36cfc0e3-ee2b-45a9-a528-7ac6067fd146
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ABS Method (Decimal, Integer, BigInteger)
Calculates the absolute value of a number \(Decimal, Integer or BigInteger\). ABS always returns a positive numeric value or zero.  

## Syntax  

```  

NewNumber := ABS(Number)  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The input value.  

## Property Value/Return Value  
 Type: Integer  

 The return value is greater than or equal to 0 \(zero\).  

## Remarks  
 The system automatically converts all of the numeric data types for you.  

## Example  
 This example shows how to remove the sign from a negative numeric value. This example requires that you create the following global variables and text constant.  

|Variable name|DataType|  
|-------------------|--------------|
|y|Decimal|  

|Text constant name|ENU Value|  
|------------------------|---------------|  
|Text000|x = %1, y = %2|  

```  
x := -10.235; // x is assigned a negative value  
y := ABS(x); // y is assigned the value of x without sign  
MESSAGE(Text000, x, y);  
```  

 The message window displays the following:  

 **x = -10.235, y = 10.235**  

## See Also  
 [POWER Method \(Decimal, Integer, BigInteger\)](devenv-power-method-decimal-integer-biginteger.md)   
 [RANDOM Method \(Integer\)](devenv-random-method-integer.md)   
 [RANDOMIZE Method \(Integer\)](devenv-randomize-method-integer.md)   
 [ROUND Method \(Decimal\)](devenv-round-method-decimal.md)
