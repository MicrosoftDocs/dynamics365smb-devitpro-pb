---
title: "How to: Make a Report Available from a Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1b723ebd-fb79-4ea3-856f-059618a64e52
caps.latest.revision: 27
---
# How to: Make a Report Available from a Page
After you have created and designed a report, you can add the report to the interface of the page so that users can view the report.  
  
 For more information about other ways to run reports, see [How to: Run Reports](How-to--Run-Reports.md).  
  
 The following procedure explains how to make a report available from the **Customer List** page by adding the report to the promoted actions pane.  
  
### To make a report available from a page  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open **Object Designer**, and then choose **Page**.  
  
2.  Select the page to display the report, such as **Page 22**, **Customer List**.  
  
3.  Choose **Design** to open the page in Page Designer.  
  
4.  Select an empty row in the designer.  
  
5.  On the **View** menu, choose **Page Actions** to open Action Designer.  
  
6.  Scroll down to the **ActionContainer** that has **Reports** as its subtype.  
  
7.  Right-click the row where you want to add the new action, and then choose **New**.  
  
8.  On the new row, in the **Caption** column, enter a name for the action, and in the **Type** column, select **Action**.  
  
9. On the **View** menu, choose **Properties** to open the **Properties** window for the new action.  
  
10. In the **Value** field of the **RunObject** property, choose the drop-down arrow, and then select the new report that you want to run in the **Object List** window.  
  
11. Set the **Promoted** property to **Yes**, and then set the **PromotedCategory** property to **Report**.  
  
12. Compile and save the page.  
  
13. Open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in the **Search** box, enter **Customers** and then choose the related link to open the **Customers** page.  
  
     The report is added to the list of promoted actions on the **Customers** page.  
  
14. Choose the action to run the report.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)   
 [Walkthrough: Designing a Customer List Report](Walkthrough--Designing-a-Customer-List-Report.md)
