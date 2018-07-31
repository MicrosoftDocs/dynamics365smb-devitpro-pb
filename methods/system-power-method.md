---
title: "Power Method"
ms.author: solsen
ms.custom: na
ms.date: 07/31/2018
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
# Power Method
Raises a number to a power. For example, you can use this function to square the number 2 to get the result of 4.

## Syntax
```
NewNumber :=   System.Power(Number: Decimal, Power: Decimal)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Number*  
&emsp;Type: [Decimal](decimal-data-type.md)  

            The number you want to raise exponentially. This number is the base in the exponential function.
            
*Power*  
&emsp;Type: [Decimal](decimal-data-type.md)  

            The exponent in the exponential function.
            


## Return Value
*NewNumber*  
&emsp;Type: [Decimal](decimal-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)