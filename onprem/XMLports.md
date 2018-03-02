---
title: XMLports Overview
description: Use XMLport to import or export data between an external source and a Dynamics NAV database, you first design the XMLport and set some properties.
ms.custom: na
ms.date: 10/24/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: aa8d94aa-1cea-4602-8f8f-9fd49ffb54f1
caps.latest.revision: 26
manager: edupont
---
# XMLports in Microsoft Dynamics NAV
XMLports are used to export or import data between an external source and a [!INCLUDE[navnow](includes/navnow_md.md)] database. Sharing data between different computer systems is seamless when it is shared in XML format. Working with XML files can be tedious so the details of how the XML file is handled are encapsulated in XMLports.  
  
 To use an XMLport to import or export data, you first design the XMLport in the XMLport Designer window and set some properties. You can run the XMLport from Object Designer or create a codeunit to run the XMLport. For more information about how to run XMLports in a codeunit, see [How to: Create Codeunits to Run XMLports](How-to--Create-Codeunits-to-Run-XMLports.md). For information about how to run XMLports in Object Designer, see [How to: Run an XMLport from Object Designer](How-to--Run-an-XMLport-from-Object-Designer.md).  
  
 If you are upgrading from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] and used Dataports in the earlier version, then you should analyze the functionality of each Dataport and re-create that functionality in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] using XMLports.  
  
## Introducing XMLports  
 The following table lists topics that provide detailed information about how to use XMLports.  
  
|To|See|  
|--------|---------|  
|Read about the XMLport Designer window.|[XMLport Designer](uiref/-$-S_21001-XMLport-Designer-$-.md)|  
|Read about triggers available for XMLports and XMLport elements.|[XMLport Triggers](XMLport-Triggers.md)|  
|Learn how to design an XMLport for import or export.|-   [Designing XMLports](Designing-XMLports.md)<br />-   [How to: Create XMLports](How-to--Create-XMLports.md)|  
|Learn how to create codeunits to run XMLports.|[How to: Create Codeunits to Run XMLports](How-to--Create-Codeunits-to-Run-XMLports.md)|  
|Learn about designing request pages for XMLports|[Request Pages \(XMLPorts\)](Request-Pages--XMLPorts-.md)|  
|Learn how to run XMLports from Object Designer.|[How to: Run an XMLport from Object Designer](How-to--Run-an-XMLport-from-Object-Designer.md)|  
|Read about XMLport data types and functions.|[XMLport Data Type](XMLport-Data-Type.md)|  
  
## XMLports Walkthroughs  
 The following table lists topics that provide information about how to use XMLports to create scenario based applications.  
  
|To|See|  
|--------|---------|  
|Learn how to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] table into an XML document.|[Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md)|  
|Learn how to import data from an XML document to multiple tables in a [!INCLUDE[navnow](includes/navnow_md.md)] database. The XML document contains data that belongs in two different tables in the database.|[Walkthrough: Inserting Data from XML Documents to Multiple Tables](Walkthrough--Inserting-Data-from-XML-Documents-to-Multiple-Tables.md)|  
|Learn how to export data from tables to CSV \(comma separated value\) files.|[Walkthrough: Exporting Data from Tables to CSV Files](Walkthrough--Exporting-Data-from-Tables-to-CSV-Files.md)|  
|Learn how to import data from text files.|[Walkthrough: Importing Data from Text Files to Tables](Walkthrough--Importing-Data-from-Text-Files-to-Tables.md)|  
  
## See Also  
 [Designing XMLports](Designing-XMLports.md)