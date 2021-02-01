---
title: "SignDisplacement Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SignDisplacement Property
> **Version**: _Available from runtime version 1.0._

Sets a value to shift negative values to the right for display purposes only. You can shift negative values in increments of 1/100 of a millimeter.

## Applies to
-   Table Field
-   Page Field


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
SignDisplacement = 600; 
```
  
## Remarks  

For example, if you enter 600 (6 millimeters) you would see a result similar to:  
  
(+)999888777  
  
(+)123456789  
  
(-) 123456789  
  
(-) 999888777  
  
(+)987654321  
  
## See Also  

[Properties](devenv-properties.md)