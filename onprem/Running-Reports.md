---
title: Run Reports
description: Add a report to the Report tab of a page and preview the report from a client computer using the Report Viewer.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: c12c52a8-d4a8-4749-beb2-00229f98adfb
caps.latest.revision: 4
author: jswymer
---
# Running Reports in Dynamics nav_web_md
After you design a report's dataset and layout, you can make it available in [!INCLUDE[navnow](includes/navnow_md.md)] client applications. For example, you can add a report to the **Report** tab of a page.

The following table describes where to find information about how to run reports.  

|To|See|  
|--------|---------|  
|Learn how to add a report to a client page.|[How to: Make a Report Available from a Page](How-to--Make-a-Report-Available-from-a-Page.md)|  
|Learn about how to run reports from Object Designer, a client, or at a command prompt.|[How to: Run Reports](How-to--Run-Reports.md)|  

##  <a name="ReportViewer"></a> Report Viewer in [!INCLUDE[nav2017](includes/nav2017.md)] and earlier  
The ReportViewer controls included with Visual Studio 2012 and Visual Studio 2013 allow reports to be embedded in [!INCLUDE[navnow](includes/navnow_md.md)] client applications. The ReportViewer controls are installed automatically on the following:  

1.  Client computer, for viewing reports from the [!INCLUDE[navnow](includes/navnow_md.md)] client.  

2.  [!INCLUDE[nav_server](includes/nav_server_md.md)], for using the SAVEASEXCEL and SAVEASPDF functions.  

3.  Computer running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], for compiling reports.  

The ReportViewer controls included with Visual Studio 2012 and Visual Studio 2013 prevent code expressions in hidden items on a report from being evaluated. We recommend that you eliminate code expressions from hidden items on reports.  

In [!INCLUDE[nav2009](includes/nav2009_md.md)], when you redesigned Classic reports as client report definition \(RDLC\) reports, in some cases, you may have created hidden text boxes in the body of a report so that in the RDLC layout, you could reference that report item in the header or footer of the report. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)] you do not have to create hidden text boxes in order to reference an item in a header or footer because the RDLC version allows data-bound fields in headers and footers. Additionally, if the hidden text boxes that you added had code expressions, then they may not be evaluated by the ReportViewer controls that are used in [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. We recommend that you move these data-bound fields out of the hidden items. For example, you may be able to move the code expression from the hidden text box to the **Visibility** property of the text box. For more information, see [How to: Print Report Header Information on Multiple Pages](How-to--Print-Report-Header-Information-on-Multiple-Pages.md). -->

## See Also  
 [Defining the Report Dataset](Defining-the-Report-Dataset.md)   
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)
