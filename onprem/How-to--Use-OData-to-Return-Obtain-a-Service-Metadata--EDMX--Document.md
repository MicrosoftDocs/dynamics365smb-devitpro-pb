---
title: "How to: Use OData to Return-Obtain a Service Metadata (EDMX) Document"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7d77f649-ff15-4f78-a090-ec8499e5122c
caps.latest.revision: 16
manager: edupont
---
# How to: Use OData to Return-Obtain a Service Metadata (EDMX) Document
The Entity Data Model \(**EDM**\) is a specification for defining the data that is used by applications that are built on the Entity Framework. **EDMX** is an XML-based file format that is the packaging format for the service metadata of a data service. When you interact with an OData service that is published from [!INCLUDE[navnow](includes/navnow_md.md)], you can request EDM-based proxies and then use tools such as LINQ to create data access logic. LINQ is a programming model that developers can use to query data from a variety of data sources, including OData. For more information, see [LINQ \(Language-Integrated Query\)](http://go.microsoft.com/fwlink/?LinkId=230540)  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] implementation of EDM follows the [.NET 4.0 WCF Data Service Framework implementation](http://go.microsoft.com/fwlink/?LinkId=214680).  
  
 The following guidelines have been implemented for EDM.  
  
-   [!INCLUDE[navnow](includes/navnow_md.md)] field names are mapped to EDMX property names by replacing spaces with underscores.  
  
-   Primary key fields in tables are automatically defined as properties in the service metadata document even if they are not exposed on a page as controls.  
  
### To obtain a service metadata \(EDMX\) document  
  
1.  You can obtain service metadata documents for either page or query web services. This example uses a page web service. Register and publish a page web service by using the [!INCLUDE[rtc](includes/rtc_md.md)]. For more information, see [Walkthrough: Creating and Interacting with a Page Web Service \(OData\)](Walkthrough--Creating-and-Interacting-with-a-Page-Web-Service--OData-.md).  
  
2.  Start Windows Internet Explorer. In the **Address** field, enter a URI in this format:  
  
    ```  
    http://<Server>:<WebServicePort>/<ServerInstance>/OData/$metadata  
    ```  
  
     If [!INCLUDE[nav_server](includes/nav_server_md.md)] is running on the local computer and is using the default [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and OData port, then the address is:  
  
    ```  
    http://localhost:7048/nav_server_instance/OData/$metadata  
    ```  
  
     The browser should now show the complete metadata for the page web service that you have published. The beginning of this document looks like this:  
  
     ![EDMX metadata](media/EDMX.JPG "EDMX")  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)