---
title: "Round Method"
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
# Round Method
Rounds the value of a numeric variable.

## Syntax
```
NewNumber :=   System.Round(Number: Decimal, [Precision: Decimal], [Direction: String])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Number*  
&emsp;Type: [Decimal](decimal-data-type.md)  

            The number that you want to round.
            
*Precision*  
&emsp;Type: [Decimal](decimal-data-type.md)  
This optional parameter determines the precision used when rounding. If you do not specify a Precision parameter, then the following steps are used to specify the precision:
            1.  The function ReadRounding in Codeunit 1, Application Management, is called. ReadRounding returns a decimal value that is the precision. By default, the ReadRounding function returns the Amount Rounding Precision field from the GLSetup table.
            2.  If you have customized Codeunit 1 and it does not implement the ReadRounding function, then the precision is specified as 2 digits after the decimal.
            
*Direction*  
&emsp;Type: [String](string-data-type.md)  

            This optional parameter specifies how to round the Number parameter. The default rounding method is '='. The following are the options for rounding:

            -   '=' rounds up or down to the nearest value (default). Values of 5 or greater are rounded up. Values less than 5 are rounded down.

            -   '>' rounds up

            -   '<' rounds down
            


## Return Value
*NewNumber*  
&emsp;Type: [Decimal](decimal-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)