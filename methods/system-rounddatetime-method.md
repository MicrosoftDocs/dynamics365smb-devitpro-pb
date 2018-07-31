---
title: "RoundDateTime Method"
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
# RoundDateTime Method
Rounds a DateTime.

## Syntax
```
NewDatetime :=   System.RoundDateTime(Datetime: DateTime, [Precision: BigInteger], [Direction: String])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Datetime*  
&emsp;Type: [DateTime](datetime-data-type.md)  
  
*Precision*  
&emsp;Type: [BigInteger](biginteger-data-type.md)  

            This optional parameter determines the precision used when rounding. The default value is 1000, which rounds to the nearest second.

            You can only use positive BigIntegers.
            
*Direction*  
&emsp;Type: [String](string-data-type.md)  

            This optional parameter specifies how to round the DateTime. The default rounding method is '='. You can change the method by using the following options:

            -   '=' rounds up or down to the nearest value (default). Values of 5 or greater are rounded up. Values less than 5 are rounded down.

            -   '>' rounds up

            -   '<' rounds down
            


## Return Value
*NewDatetime*  
&emsp;Type: [DateTime](datetime-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)