---
title: "ObsoleteState Property"
description: "Description of the ObsoleteState property"
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

# ObsoleteState Property

Marks whether the object or element is or will become obsolete.   

## Applies to  

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
 
The following table describes the property values.  

|  Value  |  Description  |
|---------|---------------|  
|**No**|Not obsolete. This is the normal/default setting.|  
|**Pending**|Will be obsolete in a future release. This setting has no effect on the current use of the table, field, or key in code. |  
|**Removed**|Is obsolete. Applies to tables and table fields; the element is not deleted from the database, however, references to the element in code are only allowed in upgrade codeunits. References from other objects will result in a runtime error.|   

## Syntax

```AL
ObsoleteState = Pending;
```

## Remarks

By coding against this property, you can use this property as a way to communicate through code to other developers which objects and elements will become obsolete over time and those which are already obsolete, enabling them to adjust their application code accordingly.

> [!NOTE]  
> When developing using [!INCLUDE[nav_dev_long_md](../includes/nav_dev_long_md.md)] (CSIDE), you do not get warnings or errors when you compile objects that reference table objects, fields, or keys that are marked as **Pending** or **Removed**. **ObsoleteState** property is only detected by the AL compiler, which will return warnings for references to elements marked as **Pending** and errors for references to elements marked as **Removed**.

## See Also

[ObsoleteReason Property](devenv-obsoletereason-property.md)  
[Properties](devenv-properties.md)  
[Upgrade Codeunits](../devenv-methodtype-property-upgrade-codeunits.md)  

