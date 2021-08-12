---
title: Arrange Page Fields Using FixedLayout Control
description: A FixedLayout group control is used to display statistical data. Learn how to use this control on a page to arrange page fields in rows and columns.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a1895add-b902-4fd6-b90e-27e251301aa6
caps.latest.revision: 23
manager: edupont
---
# Arrange Page Fields in Rows and Columns Using FixedLayout Control in Dynamics NAV
This topic describes how to use a FixedLayout group control on a page to arrange page fields in rows and columns, similar to a matrix. A FixedLayout group control is typically used to display statistical data. The following illustration shows an example of a page that uses a FixedLayout control to show sales totals for different time periods.  
  
 ![Screenshot of a FixedLayout example.](media/NAVRTCFixedLayoutExample.jpg "NAVRTCFixedLayoutExample")  
  
 Fields in a FixedLayout group control are displayed in a FastTab with a heading for each row and column. For more information about the FixedLayout group control, see [Arranging Fields in Rows and Columns Using a FixedLayout Control](Arranging-Fields-in-Rows-and-Columns-Using-a-FixedLayout-Control.md).  
  
> [!IMPORTANT]  
>  Previous versions of [!INCLUDE[navnow](includes/navnow_md.md)] supported having a FixedLayout control directly under a ContentArea. In [!INCLUDE[nav7long](includes/nav7long_md.md)] and later versions of [!INCLUDE[navnow](includes/navnow_md.md)], you must make sure that the FixedLayout control is nested in a Group control. For more information, see [Recommended Usage of GridLayout and FixedLayout](Recommended-Usage-of-GridLayout-and-FixedLayout.md).  
  
### To arrange page fields in rows and columns  
  
1.  Open the page in Page Designer.  
  
2.  In Page Designer, insert a blank line where you want to locate the fields.  
  
3.  Set the **Type** and **SubType** field to **Group**. In the **Caption** field, type the text that you want as the heading of the FastTab that contains the fields.  
  
4.  On the next line, set the **Type** to **Group** and **SubType** field to **FixedLayout**.  
  
5.  On the next line, set the **Type** and **SubType** field to **Group**. This defines the placeholder for the first column of fields. To add a heading to the column, type the text in the **Caption** field.  
  
6.  On the next line, set the **Type** to **Field**. This defines the first field in the column. In the **Caption** field, type the text that you want to use as the heading for the row.  
  
7.  Specify the data source for the field by doing one of the following:  
  
    -   If the data source is a field of the table that is associated with the page, then on the **View** menu, choose **Field Menu**, select the field, and then choose the **OK** button.  
  
    -   If the data source is a variable, then on the **View** menu, choose **C/AL Globals** or **C/AL Locals**, and then create the variable. After you create the variable, in the **SourceExpr** field in Page Designer, choose the **AssistEdit** button and select the variable.  
  
8.  Repeat steps 6 and 7 to add the remaining fields in the first column.  
  
     The following illustration shows a Page Designer example that has four fields.  
  
     ![FixedLayout group example in Page Designer.](media/NAVRTCFixedLayoutPageDesignerGroup.PNG "NAVRTCFixedLayoutPageDesignerGroup")  
  
9. Repeat steps 5 through 8 to add group controls that define the remaining columns.  
  
    > [!NOTE]  
    >  You do not need to specify captions for these fields. Only the captions of fields in the first column define the row headings.  
  
## See Also  
 [Arranging Fields in Rows and Columns](Arranging-Fields-in-Rows-and-Columns.md)   
 [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md)