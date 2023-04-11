---
title: Design Report Layouts
description: The report layout specifies which fields of the dataset are included and how they are arranged and formatted, such as font type and color, margin etc. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c69b83d1-8a3d-482e-bff7-bdb9429fb9ff
caps.latest.revision: 10
---
# Designing Report Layouts from the Microsoft Dynamics NAV Development Environment
After you have created a dataset for a report, you design the report layout. The report layout determines how the report looks when it is viewed, printed, and saved from the [!INCLUDE[navnow](includes/navnow_md.md)] client. The report layout specifies which fields of the dataset are included in the report and how they are arranged, the format of text that appears on the report \(such as font type and color\), margins, background images, and more.  

 You generally display most data in the body of a report, and you use the header to display information before any dataset fields are displayed. For example, you can display a report title, company, and user information in the header of a report.  

## Report Layout Types  
 There are two types of report layouts: Word and Client Report Language Definition \(RDLC\). Word report layouts are based on a Word document \(.docx file type\) and are created and modified by using Word 2013. RDLC report layouts are .rdlc or .rdl file types that are created and modified by using Visual Studio 2013 or Report Builder for SQL Server.  

##  <a name="BuiltinCustomLayouts"></a> Built-in and Custom Report Layouts  
 In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], you can create both an RDLC report layout and Word report layout on a report. These layouts are referred to as *built-in* layouts because they are part of the report object in the database. This means, for example, if you export the report object as a .fob or .txt file, the RDLC report layout and Word report layout are included. A report can only have one built-in RDLC report layout and one built-in Word report layout. By default, the built-in RDLC report layout is used when the report is run in the [!INCLUDE[navnow](includes/navnow_md.md)] client unless there is only a built-in Word report layout, in which case, the built-in Word report layout is used.  

 [!INCLUDE[navnow](includes/navnow_md.md)] users can specify whether to use the built-in RDLC or Word report layout on a report from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)]. From the client, users can also create *custom* report layouts that are based on the built-in report layouts. This enables users to have several different layouts for the same report which they can switch among. Custom report layouts are managed from page **9650 Report Layouts** in the [!INCLUDE[navnow](includes/navnow_md.md)] client. Unlike built-in report layouts, which are part of the report object, custom report layouts are stored in table **9650 Report Layouts** of the database. For more information about setting up report layouts from the [!INCLUDE[navnow](includes/navnow_md.md)] clients, see [Managing Report Layouts in the Clients](managing-report-layouts.md).  

## Report Layouts in a Multitenant Deployment  
 In a multitenant [!INCLUDE[navnow](includes/navnow_md.md)] deployment, the built-in report layouts are stored in the application database because they are part of the report objects. Therefore, built-in report layouts are available to all tenants. Custom report layouts are stored in the business data database; therefore they are specific to the tenant. This enables you to create separate report layouts for each tenant.  

## See Also  
 [Designing RDLC Report Layouts](Designing-RDLC-Report-Layouts.md)   
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)
