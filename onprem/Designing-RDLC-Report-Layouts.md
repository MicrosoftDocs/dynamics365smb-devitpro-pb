---
title: "Designing RDLC Report Layouts"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9677f4f9-1053-45b3-8837-d667324f16fb
caps.latest.revision: 21
---
# Designing RDLC Report Layouts
To create an RDLC layout, you use Report Designer for Visual Studio or Report Builder for SQL Server. With RDLC layouts, you can add useful features to your report layouts, such as:  
  
-   Links from a field on a report to either a page or another report.  
  
-   Images and graphs.  
  
-   The ability to toggle columns so that you can hide or display data.  
  
-   The ability for users to interactively change the column on which data in the report is sorted.  
  
 You generally display most data in the body of a report, and you use the header to display information before any dataset fields are displayed. For example, you can display a report title, company, and user information in the header of a report.  
  
 For general information about Visual Studio Report Designer, see [Report Designer \(Visual Studio\)](https://go.microsoft.com/fwlink/?LinkID=123725).  
  
 For general information about SQL Server Report Builder, see [Report Design View \(Report Builder\)](https://go.microsoft.com/fwlink/?LinkId=317717).  
  
## Working with SQL Server Report Builder or Visual Studio Report Designer  
 By default, Visual Studio Report Designer is used when you work with RDLC layouts if it is installed on the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. Otherwise, SQL Server Report Builder is used. SQL Server Report Builder is installed with the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
 If your computer is running both Visual Studio Report Designer and SQL Server Report Builder, you can configure the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to use SQL Server Report Builder when you design layouts instead of Visual Studio Report Designer.  
  
#### To configure the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to use SQL Server Report Builder  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Options**.  
  
2.  Set the **Use Report Builder** field to **Yes**.  
  
3.  Choose the **OK** button.  
  
## See Also  
 [Understanding Headers and Footers](Understanding-Headers-and-Footers.md)   
 [How to: Add and Identify Hidden Fields](How-to--Add-and-Identify-Hidden-Fields.md)   
 [How to: Add Totals in Visual Studio](How-to--Add-Totals-in-Visual-Studio.md)   
 [How to: Apply Conditional Visibility Controls](How-to--Apply-Conditional-Visibility-Controls.md)   
 [How to: Conditionally Change a Row to Bold Font](How-to--Conditionally-Change-a-Row-to-Bold-Font.md)   
 [How to: Change the Printed Values of Boolean Variables](How-to--Change-the-Printed-Values-of-Boolean-Variables.md)   
 [How to: Create New Pages per Record](How-to--Create-New-Pages-per-Record.md)   
 [How to: Format Date Values](How-to--Format-Date-Values.md)   
 [How to: Conditionally Display Filter Headers](How-to--Conditionally-Display-Filter-Headers.md)   
 [How to: Print Report Header Information on Multiple Pages](How-to--Print-Report-Header-Information-on-Multiple-Pages.md)   
 [How to: Use Option Strings in Multilanguage Implementations](How-to--Use-Option-Strings-in-Multilanguage-Implementations.md)   
 [How to: Reset Report Page Numbers](How-to--Reset-Report-Page-Numbers.md)   
 [How to: Specify Rounding Precision](How-to--Specify-Rounding-Precision.md)   
 [Troubleshooting: Visual Studio Report Designer provided metadata is not valid](Troubleshooting--Visual-Studio-Report-Designer-provided-metadata-is-not-valid.md)
