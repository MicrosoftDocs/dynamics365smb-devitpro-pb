---
title: "IncludeCaption Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5c155846-4dd6-49d0-a6f5-9af11f725d54
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

 

# IncludeCaption Property
Sets whether to include the caption of a field in the dataset of a report.  

## Applies To  
 Columns on client report definition (RDLC) report datasets.  

## Property Value  
 **True** if the caption is included in the dataset; otherwise **false**. The default value is **true**.  

## Syntax
```
IncludeCaption = false;
```

## Remarks  
 In Visual Studio Report Designer, if you want to use the Caption or CaptionML values of a field as a label on a report layout, then you must include the caption in the dataset. You design the dataset by using Report Dataset Designer. When you add table fields to the dataset with Report Dataset Designer, you can set the **IncludeCaption property** to **true** to specify that the caption for the field is also added to the dataset. If you do not include the caption in the dataset, then in a multilanguage application, you cannot use the multilanguage captions as labels in the report.  

 You can set the **IncludeCaption property** either in the **Properties** window of a data item or in the **IncludeCaption** column of Report Dataset Designer for a data item or a column. If you set the **IncludeCaption** column of a data item, then the **IncludeCaption property** is set to **true** for every child column of the data item.  

## See Also  
 [Caption Property](devenv-caption-property.md)   
 <!--
 [How to: Create Labels for a Report](../devenv-How-to-Create-Labels-for-a-Report.md) -->
