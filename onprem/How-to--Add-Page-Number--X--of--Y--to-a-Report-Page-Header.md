---
title: Add Page Number to Report Header
description: Each page can have different page names, and page numbering can be reset between pages when you add page breaks to a report page in Dynamics NAV.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: ede2ebf8-22ac-4ee4-a1d7-a4ed09d8026c
caps.latest.revision: 11
---
# How to Add Page Number &quot;X&quot; of &quot;Y&quot; to a Report Page Header
In Microsoft Visual Studio 2012 and Microsoft Visual Studio 2013, page breaks on tablix data regions, groups, and rectangles give you better control of report pagination. When you add page breaks to a report page, each page can have different page names and page numbering can be reset between pages. By using expressions, the page names and numbers can be dynamically updated when a report is run. You can also disable page breaks, or use an expression value to determine whether a page break should be inserted.  
  
 For some document reports, you may want to add page number “X” of “Y” in a report page header. This topic uses the **Order** report as an example to show how you can add page number “X” of “Y”.  
  
> [!IMPORTANT]  
>  The following procedure illustrates how page number “X” of “Y” is added to report 405, **Order**. You can use similar steps to add the same page numbering to other reports that have a similar layout, but the exact names of controls, text constants, functions, and expressions vary from one report to another.  
  
### To change the page numbering caption  
  
1.  Start the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
2.  On the **Tools** menu, choose **Object Designer**.  
  
3.  Choose **Report**, and from the list select the **Object ID** 405.  
  
4.  Choose **Design**, and on the **View** menu, choose **C/AL Globals**.  
  
5.  Open the **Text Constants** tab. Find the text constant **PageCaptonLbl**, which is used as the report page caption.  
  
6.  In the **ConstValue** field, replace the text with **Page %1 of %2**, where %1 and %2 are the placeholders for the current page and total page numbers.  
  
7.  On the **View** menu, choose **Layout**.  
  
     This opens the report layout in Microsoft Visual Studio.  
  
### To add page number “x” of “y” in a report page header  
  
1.  In Microsoft Visual Studio, on the **View** menu, choose **Other Windows**, and then choose **Document Outline**.  
  
2.  Under **Body**, choose **List1**  tablix, which controls an instance of a report.  
  
3.  In the **Row Groups** pane, verify in the **Group Properties** that the **list1** tablix for the **Order** report has a single row group, which is grouped by **No\_PurchHeader**, **DocType\_PurchHeader**, and **OutputNo**.  
  
    > [!NOTE]  
    >  If some reports have several tablix row groups, you should merge them into a single row group.  
  
4.  In the **Row Groups** pane, choose the group, and then, in the **Properties** window, under **Group**, fill in the PageBreak properties as described in the following table.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**BreakLocation**|**Between**|  
    |**ResetPageNumber**|**True**|  
  
5.  In the **Document Outline** pane, under **Page Header**, choose the **PageCaption1** text box, which displays page numbers.  
  
     This selects the text box in the report designer.  
  
6.  Right-click the text box, and then choose **Expression**. Replace the existing code with the following code.  
  
    ```  
    =Replace(Replace(Code.GetData(31,1), "%1", Globals!PageNumber), "%2", Globals!TotalPages)  
    ```  
  
    > [!NOTE]  
    >  The **Replace** function expands the placeholders in the **%1 and %2** caption text with actual values.  
  
7.  In the **Document Outline** pane, under **Body**, navigate to the **NewPage** text box under the table11 tablix.  
  
     The text box is not visible in the report layout.  
  
8.  Right-click the **NewPage** text box and choose **Cut** and then on the **Page Header** node, choose **Paste**.  
  
9. Replace the existing expression for the **NewPage** text box with the following code.  
  
    ```  
    =Code.GetData(31,1) & " " & Code.GetGroupPageNumber(ReportItems!NewPage.Value,Globals!PageNumber)  
    ```  
  
10. Save your changes and close Visual Studio.  
  
11. Return to the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], then save and compile the report.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)