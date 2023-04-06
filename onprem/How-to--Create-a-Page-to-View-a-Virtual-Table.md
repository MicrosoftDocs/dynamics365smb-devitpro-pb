---
title: Create a Page to View Virtual Table
description: To view a virtual table, you create a list page based on the virtual tables, since they are not stored in the database, you cannot view them directly. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7bc4f22f-a4de-400e-96d2-936df880b89c
caps.latest.revision: 4
---
# Creating a Page to View a Virtual Table
Virtual tables are not stored in the database, therefore you cannot view them directly. To view a virtual table, you must create a list page that is based on the virtual table.  
  
### To create a page to view a virtual table  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, and then choose the **New** button.  
  
3.  In the **New Page** window, in the **Table** field, enter the ID of the virtual table. Virtual tables have IDs in the range 2000000001 – 2000000203.  
  
4.  In the **Page** section, choose **Create blank page**, and then choose the **OK** button.  
  
5.  In Page Designer, in the first row, enter a name for the container, such as **VirtualTablePageContainer**. Verify that the **Type** is **Container** and the **SubType** is **ContentArea**.  
  
6.  In Page Designer, in the second row, in the **Type** column, choose **Group** and in the **SubType** column, choose **Repeater**.  
  
7.  In Page Designer, select the third row.  
  
8.  On the **View** menu, choose **Field Menu**.  
  
9. In the **Field Menu** window, select all the fields in the virtual table that you want to display on the page, and then choose the **OK** button.  
  
    > [!NOTE]  
    >  To select multiple fields in the **Field Menu** window, press the Shift key or the Ctrl key while you select the fields.  
  
10. On the **File** menu, choose **Save**.  
  
11. In the **Save As** dialog box, in the **ID** field, enter an ID for the page object. The ID must be in a valid range for your solution. In the **Name** field, enter a name for the page. Select the **Compiled** check box, and then choose the **OK** button.  
  
12. To view the data that is stored in the table, in Object Designer, select the page that you created and then choose the **Run** button.  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
