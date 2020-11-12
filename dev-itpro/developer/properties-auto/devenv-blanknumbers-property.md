---
title: "BlankNumbers Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
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
# BlankNumbers Property
> **Version**: _Available from runtime version 1.0._

Indicates whether the system will clear a range of numbers as it formats them.

## Applies to
-   Field
-   Page Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**DontBlank**|Not clear any numbers. This is the default value.|
|**BlankNeg**|Clear negative numbers.|
|**BlankNegAndZero**|Clear negative numbers and zero.|
|**BlankZero**|Clear numbers equal to zero.|
|**BlankZeroAndPos**|Clear positive numbers and zero.|
|**BlankPos**|Clear positive numbers.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Syntax  
```AL
BlankNumbers = BlankNegAndZero;
```

## See Also  
 [BlankZero Property](devenv-blankzero-property.md)