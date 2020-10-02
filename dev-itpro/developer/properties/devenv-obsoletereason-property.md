---
title: "ObsoleteReason Property"
description: "Description of the ObsoleteReason property"
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# ObsoleteReason Property

Specifies why an object or element has been marked as **Pending** or **Removed** in the **ObsoleteState** property.  

# Applies To

- Table objects
- Table fields
- Table keys
- Codeunit
- Enum
- EnumValue
- Page
- PageAction
- PageActionArea
- PageActionGroup
- PageActionSeparator
- PageArea
- PageChartPart
- PageField
- PageGroup
- PageLabel
- PagePart
- PageSystemPart
- Query
- QueryColumn
- QueryDataItem
- QueryFilter
- Report
- ReportColumn
- ReportDataItem
- RequestPage
- XmlPort
  
## Property Value

A text string.

## Syntax

```AL
ObsoleteReason = 'Not Needed';
```

## Remarks 

Use this property to inform developers about a table, field, or key that will become obsolete in time or is already obsolete. Use the [ObsoleteTag Property](devenv-obsoletetag-property.md) to specify additional information which can be valuable to other developers.

## See Also

[ObsoleteState](devenv-obsoletestate-property.md)  
[ObsoleteTag](devenv-obsoletetag-property.md)  
[Properties](devenv-properties.md)  
[MethodType Property (Upgrade Codeunits)](../devenv-methodtype-property-upgrade-codeunits.md)  

