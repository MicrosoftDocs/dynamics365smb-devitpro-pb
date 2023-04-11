---
title: RDLC Report Layout
description: Visual Studio Report Designer is used to create RDLC report layout. Open the report for which you want to create the layout and follow the instructions as follows. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0ccd332a-db93-454f-9d92-c3368d4c7010
caps.latest.revision: 5
---
# Creating an RDLC Report Layout in Dynamics NAV
To create an RDLC report layout, you use Visual Studio Report Designer.  
  
### To create an RDLC report layout  
  
1.  Open the report for which you want to create the layout as follows.  
  
    1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
    2.  In Object Designer, choose **Report**, select the report, and then choose the **Design** button.  
  
2.  On the **View** menu, choose **Layout**.  
  
     Visual Studio opens. The dataset in Visual Studio contains the dataset items that you added in Report Dataset Designer.  
  
3.  Use Visual Studio Report Designer to add items from the dataset to the report and design the layout of the report. For more information, see [Defining a Report Layout \(Visual Studio Report Designer\)](https://go.microsoft.com/fwlink/?LinkID=133192).  
  
4.  In Visual Studio, on the **File** menu, choose **Save report.rdlc**, and then close Visual Studio.  
  
5.  In Report Dataset Designer, select a new row. A dialog box shows the following message:  
  
     **The layout of report id: '** *\<report ID>* **' is changed by another application.**  
  
     **Filename of the changed RDLC: ‘** *\<filename>* **’**  
  
     **Do you want to load the changes?**  
  
6.  In the dialog box, choose **Yes** to load the changes that you made to the RDLC layout into the report.  
  
7.  In the development environment, on the **File** menu, choose **Save**.  
  
8.  In the **Save** dialog box, select **Compiled**, and then choose **OK**.  
  
9. To run the new report, in Object Designer, select the report and then choose **Run**.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)   
 [How to. Specify the Default Built-in Report Layout](How-to.-Specify-the-Default-Built-in-Report-Layout.md)   
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)   
 [Defining the Report Dataset](Defining-the-Report-Dataset.md)
