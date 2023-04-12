---
title: Web Service Alternatives SOAP and OData
description: Developers planning to create Dynamics NAV web services may have to choose which type of web service is better suited to their needs.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a84a800f-3ee8-43ba-8d84-47eaf9325f4f
caps.latest.revision: 19
---
# Web Service Alternatives: SOAP and OData
[!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports OData web services in addition to the SOAP web services that have been available since [!INCLUDE[nav2009](../developer/includes/nav2009_md.md)]. Developers planning to create [!INCLUDE[dyn_nav](../developer/includes/dyn_nav_md.md)] web services may need to decide which type of web service is better suited to their needs. First, there are some absolute limitations:  
  
-   It is not currently possible to access [!INCLUDE[prodshort](../developer/includes/prodshort.md)] query objects with SOAP web services. See [Queries](Queries.md) for information about [!INCLUDE[prodshort](../developer/includes/prodshort.md)] queries.  
  
-   It is not currently possible to access codeunits with OData web services.  
  
## SOAP Web Services  
 SOAP web services allow full flexibility for building operation-centric services. They provide industry standard interoperability. Windows Communication Framework \(WCF\) has supported SOAP services since its initial release in .NET Framework 3.0, and later releases of the .NET Framework have added additional support and default bindings to make it easier to build SOAP services using WCF.  
  
 The most common type of messaging pattern in SOAP is the Remote Procedure Call \(RPC\), where one network node \(the client\) sends a request message to another node \(the server\), and the server sends a response message to the client.  
  
## OData Web Services  
 The OData standard is well suited for web service applications that require a uniform, flexible, general purpose interface for exposing create retrieve update delete \(CRUD\) operations on a tabular data model to clients. OData is less suited for applications that are primarily RPC-oriented or in which data operations are constrained to certain prescribed patterns. OData supports Representational State Transfer \(REST\)-based data services, which enable resources, identified using Uniform Resource Identifiers \(URIs\), and defined in an abstract data model \(EDM\), to be published and edited by web clients within corporate networks and across the Internet using simple Hypertext Transfer Protocol \(HTTP\) messages. OData services are lightweight, with functionality often referenced directly in the URI.  
  
 Whereas SOAP web services expose a WSDL document, OData web services expose an EDMX document containing metadata for all published web services.  
  
 OData is supported in PowerPivot, a data-analysis add-in to Microsoft Excel that provides enhanced Business Intelligence capabilities. PowerPivot supports sharing and collaboration on user-generated business intelligence solutions in a Microsoft SharePoint Server environment. For more information about PowerPivot, see [https://www.powerpivot.com/](https://go.microsoft.com/fwlink/?LinkID=262183).  
  
 The extensions to the Atom Publishing Protocol defined in the AtomPub extensions to the OData protocol documentation \(which you can download [here](https://go.microsoft.com/fwlink/?LinkID=262184)\) describe how REST-based data services can enable resources, identified using URIs and defined in an abstract data model \(EDM\), to be published and edited by web clients within corporate networks and across the Internet using simple HTTP messages.  
  
 In addition to the AtomPub format, the OData implementation in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] also supports the JSON format, a somewhat less verbose format that may perform better in low-bandwidth environments.  
  
## See Also  
 [Web Services Overview](web-services.md)   
 [OData Web Services](OData-Web-Services.md)   
 [SOAP Web Services](SOAP-Web-Services.md)
