---
title: "Arranging Fields in Rows and Columns Using a FixedLayout Control"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 71cfa27c-b7c5-4d34-8ff2-618eae92dded
caps.latest.revision: 13
manager: edupont
---
# Arranging Fields in Rows and Columns Using a FixedLayout Control
This topic describes the layout and behavior of fields in a FixedLayout control on a page. You use the FixedLayout control to arrange page fields in rows and columns, similar to a matrix, except that the FixedLayout control contains a specific number of fields, and a matrix can contain an unspecified number of fields. You typically use the FixedLayout control to display statistical data in a FastTab on a page or information in the details section of a Worksheet page. If you are using the [!INCLUDE[demolong](includes/demolong_md.md)], then you can see examples of these uses in page 151, Customer Statistics, and page 40, Item Journal.  
  
## Adding Fields  
 In Page Designer, you include a FixedLayout control under a group control. You can add fields directly under the FixedLayout control as shown in the following Page Designer example that contains four fields.  
  
 ![FixedLayout without grouping in Page Designer.](media/NAVRTCFixedLayoutPageDesignerNoGroup.PNG "NAVRTCFixedLayoutPageDesignerNoGroup")  
  
 The following illustration shows the resulting field layout on a page.  
  
 ![FixedLayout illustration of a single row of fields.](media/NAVRTCFixedLayoutSingle.png "NAVRTCFixedLayoutSingle")  
  
 It is important to notice that there are no captions for the fields.  
  
## Grouping Fields in a Fixed Layout Control  
 By placing the fields in a FixedLayout control throughout a group control, you can define separate rows and columns to create a matrix-like arrangement. The following illustration shows a Page Designer example that adds four fields of the FixedLayout control in a group control.  
  
 ![FixedLayout with grouping in Page Designer.](media/NAVRTCFixedLayoutPageDesignerGrouping.PNG "NAVRTCFixedLayoutPageDesignerGrouping")  
  
 The following illustration shows the resulting field layout on a page.  
  
 ![FixedLayout illustration showing 4 fields.](media/NAVRTCFixedLayoutGroup.png "NAVRTCFixedLayoutGroup")  
  
 The group control caption appears as the column header, and the field control captions appear as the row headers. If you add two more group controls that contain fields, then the layout on the page will resemble the following illustration.  
  
 ![FixedLayout of fields in multiple groups.](media/NAVRTCFixedLayoutMultipleGroups.png "NAVRTCFixedLayoutMultipleGroups")  
  
 Only the field captions for the first group control appear. The field captions in other group controls are ignored.  
  
## Multiple Fixed Layouts  
 You can also set up more than one FixedLayout control in a group control. For example, the following illustration shows the page layout if you have four FixedLayout controls.  
  
 ![FixedLayout of fields in a single group.](media/NAVRTCFixedLayoutMultiple.png "NAVRTCFixedLayoutMultiple")  
  
 The page area is divided into two columns that contain the separate FixedLayout fields.  
  
> [!NOTE]  
>  The fields in the FixedLayout controls in the illustration are not in a group control. If they were in a group control, then they would follow the same principle as described in the previous section about how to group fields.  
  
## Editing Fields in a Fixed Layout  
 Fields in a fixed layout are not editable even if the [Editable Property](Editable-Property.md) property is set to **TRUE**. However, if the field drills down to a page where the field source is defined, then you can modify the field.  
  
## See Also  
 [How to: Arrange Page Fields in Rows and Columns Using a FixedLayout Control](How-to--Arrange-Page-Fields-in-Rows-and-Columns-Using-a-FixedLayout-Control.md)   
 [Arranging Fields in Rows and Columns](Arranging-Fields-in-Rows-and-Columns.md)   
 [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md)