---
title: "Integer Data Type"
ms.author: solsen
ms.custom: na
ms.date: 08/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Integer Data Type
This simple data type stores whole numbers with values that range from -2,147,483,647 to 2,147,483,647.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 In addition to representing whole numbers in this range, you can use integers to represent Boolean values. For Boolean values, -1 represents **true** and 0 represents **false**.  
  
 If you assign -2,147,483,648 directly to an Integer variable, then you get an error when you try to compile the code. However, you can indirectly assign -2,147,483,648 to an Integer variable by using the following code.  
  
```  
IntegerVar := -2147483647;  
IntegerVar := IntegerVar - 1;  
```  
  
 If you try to indirectly assign a value that is smaller than -2,147,483,648 or larger than 2,147,483,647, then you get a run-time error.  

## Methods
The following methods are supported for the Integer data type:

[BigInteger Data Type](devenv-biginteger-data-type.md)   
[Decimal Data Type](devenv-decimal-data-type.md)   
[ABS method (Decimal, Integer, BigInteger)](../methods/devenv-abs-method-decimal-integer-biginteger.md)  
[POWER method (Decimal, Integer, BigInteger)](../methods/devenv-power-method-decimal-integer-biginteger.md)  
[RANDOM method (Integer)](../methods/devenv-random-method-integer.md)   
[RANDOMIZE method (Integer)](../methods/devenv-randomize-method-integer.md)   
[ROUND method (Decimal)](../methods/devenv-round-method-decimal.md)

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
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  