---
title: Add Labels to RDLC Report Layout
description:  A Client report definition RDLC report layout in Visual Studio requires adding data items and columns from the report dataset to the layout.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 84952a05-7192-47f5-b7ab-3053c6aceae1
caps.latest.revision: 4
---
# How to Add Labels to an RDLC Report Layout in Dynamics NAV
When you create a client report definition \(RDLC\) report layout in Visual Studio, you add data items and columns from the report dataset to the layout. If you want to add a label to the report layout, such as a caption for a field, a title for a chart, or a title for the report, then you must include the label in the report dataset, and then add the label to the report layout. You add labels to the dataset by using Report Dataset Designer. You add labels to the RDLC report layout by using Visual Studio.  
  
### To add a label to an RDLC report layout  
  
1.  If not already done, add the labels to the report dataset.  
  
     For more information, see [How to: Create Labels for a Report](How-to--Create-Labels-for-a-Report.md).  
  
2.  Open the report layout in Visual Studio as follows.  
  
    1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
    2.  In Object Designer, choose **Report**, select the report for which you want to modify, and then choose the **Design** button.  
  
    3.  On the **View** menu, choose **Layout**.  
  
         The RDLC layout opens in Visual Studio. The labels that you included are available in the **Report Data** pane in Visual Studio, under **Parameters**.  
  
        > [!NOTE]  
        >  To view the **Report Data** pane, in Visual Studio, on the **View** menu, choose **Report Data**.  
  
3.  Drag the labels from the parameters list to the layout to add labels to the report.  
  
     The actual text that appears for the label in the report is the value of the **Caption** property for either a field in the data item table, if the label is related to column in the report dataset, or a label in the Report Label Designer, if the label is not related to a column in the dataset.  
  
     The language of the label that is displayed when you run the report depends on the language setting of the report object. For more information, see [Multiple Document Languages](Multiple-Document-Languages.md) and [Viewing the Application in Different Languages](Viewing-the-Application-in-Different-Languages.md).  
  
## See Also  
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)   
 [Designing RDLC Report Layouts](Designing-RDLC-Report-Layouts.md)
