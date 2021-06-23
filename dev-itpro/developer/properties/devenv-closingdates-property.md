---
title: "ClosingDates Property"
description: "Sets a value that determines whether users can enter a closing date in this field."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# ClosingDates Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that determines whether users can enter a closing date in this field. The default value is False.

## Applies to
-   Table Field
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property value

**True** if users can enter a closing date in the field, otherwise **false**. The default is **false**.

## Syntax

```AL
ClosingDates = true;
```

## Remarks  

All dates have a corresponding closing date. A closing date is a period following the given date, but before the next date. Closing dates are sorted immediately after the corresponding date but before the next date.  
  
## See Also  

[Date and Time Methods](../methods-auto/library.md)