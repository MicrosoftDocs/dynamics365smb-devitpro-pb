---
title: Add a FactBox to a Page
description: A Factbox displays additions pages, charts, or system parts, which can be added in the Factbox area for a page in Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 276615ab-ab79-4f65-99e0-bf05cb3a86b0
caps.latest.revision: 14
---
# How to Add a FactBox to a Page in Dynamics NAV
A FactBox is an area on the right side of a page that can display additional pages, charts, or system parts. To add a FactBox to a page, you add the FactBox area, and then add parts that contain charts, system parts, or pages of the ChartPart type or ListPart type.  
  
> [!TIP]  
>  When creating a new page, you can use the page wizard to add a FactBox to the page. For more information, see [How to: Create a Page](How-to--Create-a-Page.md).  
  
## Adding a FactBox Area to a Page  
 You define the FactBox by adding a FactBoxArea container control to the page. The FactBoxArea control acts as a placeholder to which you can add different parts for the FactBox. You can add a FactBoxArea control on the following page types only:  
  
-   Card  
  
-   Document  
  
-   List  
  
-   ListPlus  
  
-   Navigate  
  
-   Worksheet  
  
> [!NOTE]  
>  Only one FactBoxArea control is allowed on a page.  
  
#### To add a FactBox to a page  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, select the page you want to modify, and then choose the **Design** button to open Page Designer.  
  
3.  In Page Designer, select the blank row after the last page control.  
  
4.  In the row, set the **Type** column to **Container** and the **SubType** column to **FactBoxArea**.  
  
5.  In the **Caption** column, type the text that you want to appear as the heading for the FactBox.  
  
6.  Choose the left arrow button at the bottom of Page Designer until the **FactBoxArea** control is at the same level as the **ContentArea** control.  
  
## Adding a Page to the FactBox  
 You can add a part to the FactBox area that displays an existing page of the **CardPart** or **ListPart** type only. If you attempt to use another page type, you will get an error.  
  
> [!NOTE]  
>  This procedure assumes that the page that you want to display in the FactBox already exists. If not, create the page before proceeding. For an example of creating a **CardPart** page for using in a FactBox, see [Walkthrough: Adding a FactBox to the Customer List Page](Walkthrough--Adding-a-FactBox-to-the-Customer-List-Page.md).  
  
#### To add a page to the FactBox  
  
1.  Add a blank row under the **FactBoxArea** control.  
  
2.  In the blank row, set the **Type** column to **Part** and the **SubType** column to **Page**.  
  
3.  Select the row, and on the **View** menu, choose **Properties**.  
  
4.  In the **Properties** window, in the **Value** column of the **PagePartID** property, choose the up arrow.  
  
5.  In the **Page List** window, select the page you want, and then choose the **OK** button.  
  
6.  Close the **Properties** window. The selected page now appears in the **Name** and **Caption** columns of the Page Designer for the **Page** row.  
  
### Filtering Data that is Displayed on a Page in a FactBox  
 In many cases, you want to change the content that is displayed on the page in the FactBox based on the content of the main page. For example, if the main page is a **Customer List**, you can have a FactBox that includes the **Customer Details** page that shows information about a customer. When a user selects a customer in the **Customer List**, the **Customer Details** page displays information about the selected customer. To implement this functionality, you set up a table filter that associates a field in the table that is used by the **Customer Details** page with a field in the table that is used by the **Customer List** page. You can also filter on a constant value or set of conditions.  
  
##### To set up filter on the page in the FactBox  
  
1.  Select the **Page** row, and on the **View** menu, choose **Properties**.  
  
2.  In the **Properties** window, in the **Value** field of the **SubPageLink** property, choose the **Assist Edit** button.  
  
3.  In the **Table Filter** window, in the **Field**  column of a row, choose the up arrow.  
  
     The **Field List** window opens and displays all the fields in the table that are used by the page in the FactBox.  
  
4.  Select the field on which you want to filter, and then choose the **OK** button.  
  
5.  Set up the filter as follows:  
  
    |If you want to|Then|  
    |--------------------|----------|  
    |Associate the field with a field in table of the main page|1.  Set the **Type** column to **FIELD**.<br />2.  Set the **Value** column to the field in the table of the main page.|  
    |Filter on a constant value|1.  Set the **Type** column to **CONST**.<br />2.  In the **Value** column, type the constant.|  
    |Filter on a set of conditions|1.  Set the **Type** column to **FILTER**.<br />2.  In the **Value** column, type the conditions.|  
  
6.  Choose the **OK** button. The filter statement appears in the **SubPageLink** property value of the **Properties** window.  
  
## Adding a Chart to the FactBox  
 Charts provide a way to display data graphically. You can add any existing chart that is included in table **2000000078 Chart**.  
  
> [!NOTE]  
>  Charts are not supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. If the page is displayed in this display target, then the chart part is ignored.  
  
#### To add a chart to the FactBox  
  
1.  In Page Designer, add a blank row under the **FactBoxArea** control.  
  
2.  In the blank row, set the **Type** column to **Part** and the **SubType** column to **Chart**.  
  
3.  Select the row, and on the **View** menu, choose **Properties**.  
  
4.  In the **Properties** window, in the **Value** column of the **ChartPartID** property, choose the up arrow.  
  
5.  In the **Chart List** window, select the chart that you want, and then choose the **OK** button.  
  
6.  Close the **Properties** window. The selected chart now appears in the **Name** and **Caption** columns of the Page Designer for the **Chart** row.  
  
## Adding a System Part the FactBox  
 You can add any of the following system parts to a FactBox on a page in the [!INCLUDE[rtc](includes/rtc_md.md)]: Microsoft Outlook, Notes, MyNotes, or RecordLinks.  
  
> [!NOTE]  
>  System parts are not supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. If the page is displayed in this display target, then the system part is ignored.  
  
 For more information about system parts, see [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md).  
  
#### To add a system part to the FactBox  
  
1.  In **Page Designer**, add a blank row below the **FactBoxArea** control.  
  
2.  In the blank row, set the **Type** column to **Part** and the **SubType** column to **System**.  
  
3.  Select the row, and on the **View** menu, choose **Properties**.  
  
4.  In the **Properties** window, in the **SystemPartID** property, set the **Value** column to the system part you want.  
  
5.  Close the window. The selected system part now appears in the **Name** and **Caption** columns of the Page Designer for the **System** row.  
  
## See Also  
 [Adding a FactBox to Page](Adding-a-FactBox-to-Page.md)   
 [Walkthrough: Adding a FactBox to the Customer List Page](Walkthrough--Adding-a-FactBox-to-the-Customer-List-Page.md)   
 [How to: Create a Page](How-to--Create-a-Page.md)
