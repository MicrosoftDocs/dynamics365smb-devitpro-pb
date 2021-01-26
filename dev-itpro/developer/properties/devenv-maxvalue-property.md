---
title: "MaxValue Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# MaxValue Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the maximum numeric value for a field.

## Applies to
-   Table Field
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  
  
|**Value**|**Description**|  
|---------|---------------|  
|**9999**|Integers|  
|**9999.0**|Decimals|  
|**December 31, 9999**|Dates|  
|**23:59:59**|Time|  

## Syntax

```AL
MaxValue = 100;
```
  
## Remarks

The field setting is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table directly. If a field is updated through application code, then the **MaxValue** is not validated.  
  
## See Also  

[MinValue Property](devenv-minvalue-property.md)   
[NotBlank Property](devenv-notblank-property.md)   
[Numeric Property](devenv-numeric-property.md)