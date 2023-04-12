---
title: Create Labels for Report
description: Add labels to the dataset by using Report Dataset Designer in development environment using RDLC report layout in Visual Studio or Word report layout. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fa9bc4b3-14f1-4ba3-95fd-d9d309d39186
caps.latest.revision: 17
---
# Creating Labels for Report in Dynamics NAV
Whether you are using an RDLC report layout in Visual Studio or a Word report layout, if you want to add a label to the report layout, such as a caption for a field, a title for a chart, or a title for the report, then the label must be included in the report dataset. You add labels to the dataset by using Report Dataset Designer in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. You can either add labels that are related to column of a data item in the dataset, such as the caption for a table field, or labels that are not related to a column of a data item, such as the title of the report. After you add a label to the dataset, you add to the report layout.  

### To add a label that is related to a column of a data item  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Report**.  

3.  Select a report, and then choose the **Design** button.  

4.  In Report Dataset Designer, do one of the following:  

    -   Select the **Include Caption** check box for a **Column** data type row to add a label for the column.  

    -   Select a **Column** data type row for which you want to add a label to the dataset, and on the **View** menu, choose **Properties**. In the **Properties** window, set the **IncludeCaption** property to **Yes**.  

5.  Compile and save the report.  

6.  To add the label to a report layout, see one of the following procedures.  

    -   [How to: Add Labels to an RDLC Report Layout](How-to--Add-Labels-to-an-RDLC-Report-Layout.md)  

    -   [Managing Report Layouts](managing-report-layouts.md)  

### To add a label that is not related to a column of data item  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Report**.  

3.  Select a report, and then choose the **Design** button.  

4.  In Report Dataset Designer, on the **View** menu, choose **Labels**.  

5.  In Report Label Designer, in the **Name** field, add a Common Language Specification \(CLS\)–compliant name for the label. This name is used in the Visual Studio dataset. For more information, see the "Naming" section in [Common Language Specification](https://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library.  

6.  In the **Caption** field, enter the caption.  

    > [!NOTE]  
    >  The default language of the caption depends on the current language of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. For more information, see [Caption Property](Caption-Property.md).  

7.  On the **View** menu, choose **Properties**.  

8.  If you have a multilanguage application, then in the **Properties** window, specify values for the **CaptionML** property.  

9. Compile and save the report.  

10. To add the label to a report layout, see one of the following procedures.  

    -   [How to: Add Labels to an RDLC Report Layout](How-to--Add-Labels-to-an-RDLC-Report-Layout.md)  

    -   [Managing Report Layouts](managing-report-layouts.md)  

## See Also  
 [How to: Create a Report Dataset](How-to--Create-a-Report-Dataset.md)   
 [Designing Reports](Designing-Reports.md)   
 [IncludeCaption Property](IncludeCaption-Property.md)   
 [CaptionML Property](CaptionML-Property.md)   
 [Caption Property](Caption-Property.md)
