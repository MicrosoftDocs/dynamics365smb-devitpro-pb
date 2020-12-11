---
title: "Layout Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7c117ea8-3426-4e48-8991-10b08feec6c3
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

# Layout Property
Sets whether the fields in Group controls are arranged horizontally in a row or vertically in a column.  
  
## Applies to  
  
-   Group controls, including Group, Repeater, CueGroup, FixedLayout, and GridLayout on pages.  
  
## Property Values  
  
|Value|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|**Rows**|Arranges fields within Group controls in rows. This only works in the [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)]. In the [!INCLUDE[webclient](../includes/webclient.md)], fields can only be arranged in columns.|  
|**Columns**|Arranges fields within Group controls in columns. This is the default.|  
|**Undefined**|Same as the **Columns** setting.|  
  
## Remarks  
This property is used to arrange fields that display in FastTabs on page type like card and document. For more information, see [Field Arrangement on FastTabs](../devenv-arranging-fields-using-grid-and-fixed-controls.md). 

## See Also

[Field Arrangement on FastTabs](../devenv-arranging-fields-on-fasttab.md)  
[Properties](devenv-properties.md)  
[Rowspan Property](devenv-rowspan-property.md)  
[Columnspan Property](devenv-columnspan-property.md)
