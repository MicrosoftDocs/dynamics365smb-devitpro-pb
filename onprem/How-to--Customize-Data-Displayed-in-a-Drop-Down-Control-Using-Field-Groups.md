---
title: Customize Drop-Down Control Data
description: Fields are enabled with filter-as-you-type functionality, a drop-down control displays data from source table when you type text into these fields.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 27e06f03-185e-49d2-8c81-841ecf53ef28
caps.latest.revision: 16
---
# Customize Data Displayed in a Drop-Down Control Using Field Groups
In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], some fields are enabled with filter-as-you-type functionality. When you type text into these fields, a drop-down control appears that displays data from a source table. For example, in the sell-to-customer-no field on the Sales Orders page, records from the Customer table are displayed when you use this control.  
  
 If you do not define any field groups for the drop-down control, by default you only see data from two fields in the source table; the primary key and description fields, as these are indexed automatically.  
  
 To specify which fields are displayed in the drop-down control, you must use field groups. If you select the appropriate fields in the field groups table, you can help users to quickly find the data they need, without scrolling through multiple records. For example, if you define field groups on the Items table you can help the order processor to create new customer orders more easily. On the Sales Order card page, they can find specific items for the order, such as 2-inch nails, by using filter-as-you-type, and the drop-down control linked to the Items table. This could be very useful when creating a new customer order over the telephone.  
  
## Adding Fields to the Field Groups Table  
 You can add or remove field groups from the Field groups table, using Table Designer.  
  
#### To add fields to the field groups table  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer** to open the **Object Designer** window.  
  
2.  In **Object Designer**, choose **Tables**, select a table, and then choose the **Design** button to open **Table Designer**. For example, select table **18**, the **Customer** table.  
  
3.  To open the **Field Groups** table, select any row, choose **View**, and then choose **Field Groups**.  
  
4.  Select the first row in the **Field Groups** table, and in the **Name** field, type **DropDown**.  
  
5.  In the **Groups** field, choose the **AssistButton** to open the **Field List** table.  
  
6.  In the **Field List** table, make a selection from the fields in the source table. If you want to select more than one row, select a row, and then use the Shift key to select multiple rows. Choose the **OK** button to add the fields to the **Field Groups** table.  
  
7.  Close the **Field List** table, and the **Field Groups** table. Choose **Save** and **Compile**.  
  
8.  Run the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to view your changes.  
  
     For example, open the **Edit Sales Order** card page **1003**, and then choose **Sell-to Customer No**. The fields that you added to the **Customer** table, using field groups, are now displayed in the drop-down control for that field.  
  
     Follow the same procedure to remove fields, or to change the order of fields displayed in the drop-down control.  
  
## See Also  
 [Walkthrough: Creating a Customer Card Page in Page Designer](Walkthrough--Creating-a-Customer-Card-Page-in-Page-Designer.md)
