---
title: "How to: Modify a Word Report Layout"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7a193bac-4c45-4f04-bf68-e3f299beeba2
caps.latest.revision: 6
manager: edupont
---
# How to: Modify a Word Report Layout
This procedure describes how to modify a Word report layout on report from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. A Word report layout determines the content and format of a report when it is viewed and printed from the [!INCLUDE[navnow](includes/navnow_md.md)] client. When you modify a Word report layout, you specify the fields of the report dataset to include on report and how the fields are arranged. You also define the general format of the report, such as text font and size, margins, and background images. You will typically arrange the content of the report by adding tables to the layout.  
  
 You insert dataset fields in the layout by using a custom XML part that is automatically generated for the report when you create the Word report layout. For more information about custom XML parts, see [Custom XML Part Overview for Word Report Layouts](Custom-XML-Part-Overview-for-Word-Report-Layouts.md).  
  
### To modify the Word report layout  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], export the Word report layout as a Word document file to your computer or network.  
  
     For more information see [To export a Word report layout from a report to a file](How-to--Import-and-Export-a-Word-Report-Layout.md#ExportLayout).  
  
2.  Open the Word document file in Word 2013 and make changes.  
  
    -   To make basic layout changes, such as adding or removing tables and cells, formatting text, or changing margins, use the editing features of Word.  
  
    -   To add fields from the report dataset to the layout, use the custom XML part for the report to add content controls that map to the fields. For more information, see [How to: Add Fields from a Report Dataset to a Word Report Layout](How-to--Add-Fields-from-a-Report-Dataset-to-a-Word-Report-Layout.md).  
  
    > [!TIP]  
    >  Show the table gridlines so that you see the boundaries of table cells. Remember to hide the gridlines when you have finished editing. To show or hide table gridlines, select the table, and then under **Layout** on the **Table** tab, choose **View Gridlines**.  
  
3.  Save your changes, and then close the Word report layout document.  
  
4.  Import the Word document into the report.  
  
     For more information, see [To import a Word report layout from a file into report](How-to--Import-and-Export-a-Word-Report-Layout.md#ImportLayout).  
  
##  <a name="RemoveField"></a> Removing Label and Data Fields  
 Label and data fields of a report are contained in content controls in Word. The following figure illustrates a content control when it is selected in the Word document.  
  
 ![Content control for field in Word report layout.](media/NAV_WordReportLayouts_ContentControl.png "NAV\_WordReportLayouts\_ContentControl")  
  
 The name of the label or data field name displays in the content control. In the example, the field name is CompanyAddr1.  
  
#### To remove a label or data field  
  
1.  Right-click the field that you want to delete, and then choose **Remove Content Control**.  
  
     The content control is removed, but the field name remains as text.  
  
2.  Delete the remaining text as needed.  
  
## See Also  
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)   
 [Defining the Report Dataset](Defining-the-Report-Dataset.md)   
 [Designing RDLC Report Layouts](Designing-RDLC-Report-Layouts.md)