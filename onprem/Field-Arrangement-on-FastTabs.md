---
title: "Field Arrangement on FastTabs"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a25d7a44-f769-4415-b52e-6d8350f049d3
caps.latest.revision: 9
manager: edupont
---
# Field Arrangement on FastTabs
This topic describes how individual fields are arranged on a FastTab and ways that you can change the layout.  
  
## How Fields are Arranged on a FastTab of a Page  
 By default, a FastTab is divided into two columns for containing fields. Fields are automatically distributed between the left and right columns based on their order in Page Designer and height on the rendered page. Starting with the first field in the Page Designer and working downward, fields are positioned in the left column and then in the right column so that the area that is occupied by the fields in each column is as equal as possible. Field captions are positioned to the left of fields.  
  
 For example, the following figure shows Page Designer for a FastTab setup with five fields.  
  
 ![Shows FastTab setup in Page Designer.](media/NAVPageDesignerFastTabFields.png "NAVPageDesignerFastTabFields")  
  
 The following figure illustrates the field layout on the rendered page.  
  
 ![Shows a FastTab setup of fields in Page Designer.](media/NAVFieldLayoutFastTab.png "NAVFieldLayoutFastTab")  
  
## Grouping Fields on a FastTab  
 By using the Group subtype control in a FastTab, you can include fields on a FastTab in separate groups. This gives you some control over how fields are distributed between the left and right columns. When you group fields on a FastTab, the groups and not the individual fields are distributed evenly between the left and right columns.  
  
 For example, the following figure shows Page Designer for a FastTab setup that includes three groups.  
  
 ![A FastTab setup with field groups in Page Designer.](media/NAVPageDesignerFastTabsFieldGroups.png "NAVPageDesignerFastTabsFieldGroups")  
  
 The following figure illustrates the groups and field layout on the rendered page.  
  
 ![Shows how field groups layout in a FastTab.](media/NAVFastTabFieldLayoutGroups.png "NAVFastTabFieldLayoutGroups")  
  
## Manually Arranging Fields in Multiple Rows and Columns  
 Using the GridLayout or FixedLayout controls, you can arrange fields in multiple rows and columns in a grid-like format. For more information, see [Arranging Fields in Rows and Columns](Arranging-Fields-in-Rows-and-Columns.md).