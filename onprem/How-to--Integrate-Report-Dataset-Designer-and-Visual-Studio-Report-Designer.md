---
title: "How to: Integrate Report Dataset Designer and Visual Studio Report Designer"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a289ca6c-d65c-45a9-9e0c-5af791cf001d
caps.latest.revision: 31
---
# How to: Integrate Report Dataset Designer and Visual Studio Report Designer
To create and modify client report definition \(RDLC\) report layouts, you must use Visual Studio. When you create an RDLC layout for a report, you may have to perform some steps in Report Dataset Designer in the [!INCLUDE[navnow](includes/navnow_md.md)] development environment to modify the dataset, and some steps in Visual Studio Report Designer to modify the layout. To work with both Report Dataset Designer and Visual Studio Report Designer, you must know when and where to save your work and how to switch between them efficiently.  
  
 You can save changes to the RDLC report layout of the report in Visual Studio multiple times and then return to Report Dataset Designer and load the changes that you made to the layout into the report. You can save and compile changes to the report dataset in Report Dataset Designer multiple times and then return to Visual Studio Report Designer and reload the dataset into the report layout.  
  
 To switch between Report Dataset Designer and Visual Studio Report Designer, we recommend that you follow these steps:  
  
-   Before you switch from Visual Studio Report Designer to Report Dataset Designer, save the report.rdlc file. You can also build the report in Visual Studio before you switch to the Report Dataset Designer, but this is not required.  
  
-   Before you switch from Report Dataset Designer to Visual Studio Report Designer, save and compile the report.  
  
-   After you update the dataset in Report Dataset Designer, you must refresh the dataset result in Visual Studio Report Designer. On the **View** menu, choose **Report Data**. In the **Report Data** pane, expand **DataSets**, right-click **DataSet\_Result**, and then choose **Refresh**.  
  
-   Before you rename a column in Report Dataset Designer, you must close Visual Studio Report Designer.  
  
-   If you delete a field in Report Dataset Designer, then you must delete all instances of that field in the Visual Studio Report Designer layout. Otherwise, the report will not successfully compile.  
  
 The following procedure describes how to switch between Report Dataset Designer and Visual Studio Report Designer.  
  
### To work with both Report Dataset Designer and Visual Studio Report Designer  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  To modify an RDLC report, in Object Designer, choose **Report**, select the report that you want to modify, and then choose **Design**.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  After you make changes in the RDLC layout, in Visual Studio, on the **File** menu, choose **Save Report.rdlc**.  
  
5.  In Report Dataset Designer, select an empty line in the report. A dialog box opens with the following message:  
  
     “The layout of report id: '*\<report ID>*' is changed by another application.   
    Filename of the changed RDLC: *\<filename>*  
    Do you want to load the changes?”  
  
6.  Choose **Yes** to load the changes that you made to the RDLC layout into the report.  
  
7.  In [!INCLUDE[navnow](includes/navnow_md.md)] development environment, on the **File** menu, choose **Save**.  
  
8.  In the **Save** dialog box, select **Compiled**, and then choose **OK**.  
  
    > [!NOTE]  
    >  If you try to close the report in the [!INCLUDE[navnow](includes/navnow_md.md)] development environment, then you see the following error:  “You must close the Visual Studio Designer window before closing the report object.”  
  
    > [!NOTE]  
    >  If you try to view the layout when the report layout is already open, then you see the following error:  “The report layout is already open in Visual Studio.”  
  
9. In Report Dataset Designer, make some additional changes to the report dataset.  
  
10. In the [!INCLUDE[navnow](includes/navnow_md.md)] development environment, on the **File** menu, choose **Save**.  
  
11. In the **Save** dialog box, select **Compiled**, and then choose **OK**.  
  
    > [!IMPORTANT]  
    >  If you save the report but do not compile it, or if you compile the report but do not save it, then you cannot load the changes into the RDLC report layout in the following step. You must both save and compile the report.  
  
12. Go to the Visual Studio Report Designer. You see the following message:  “This file has been modified outside of the source editor. Do you want to reload it?” Choose **Yes** or **Yes to All** to reload the changes from Report Dataset Designer into the RDLC report layout.  
  
13. In Visual Studio, on the **View** menu, choose **Report Data**. In the **Report Data** pane, expand **DataSets**, right-click **DataSet\_Result**, and then choose **Refresh**. The additional items that you added to the dataset in Report Dataset Designer in the [!INCLUDE[navnow](includes/navnow_md.md)] development environment are displayed in the Visual Studio dataset.  
  
14. You can continue making changes in either Visual Studio Report Designer or Report Dataset Designer without having to close either designer. You must save and compile the report object after you make changes and load the changes into the report object or the RDLC report layout when you are prompted.
