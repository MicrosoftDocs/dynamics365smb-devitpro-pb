---
title: "OData Web Services"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 70edac11-b450-4e6c-92b0-d677929ee868
caps.latest.revision: 19
manager: edupont
---
# OData Web Services
The Open Data Protocol \(OData\) is a web protocol that is designed for querying tabular data and provides you with an alternative to SOAP-based web services. OData builds on web technologies such as HTTP, the Atom Publishing Protocol \(AtomPub\), and JavaScript Object Notation \(JSON\) to provide access to information from different applications, services, and stores. OData uses URIs for resource identification and commits to an HTTP-based, uniform interface for interacting with resources. This commitment to core Web principles allows for OData to enable a new level of data integration and interoperability across a broad range of clients, servers, services, and tools.  
  
 You can use OData web services to show [!INCLUDE[navnow](includes/navnow_md.md)] data, and you can update data in a [!INCLUDE[navnow](includes/navnow_md.md)] database using OData web services.  
  
 OData can be found in other Microsoft products and technologies, including the following:  
  
-   Microsoft Excel implements OData for its PowerPivot add-in.  
  
-   Microsoft SharePoint can expose its list-oriented data with OData.  
  
-   Microsoft Azure Table Services are based on OData.  
  
 The topics in this section describe the key concepts and techniques for accessing [!INCLUDE[navnow](includes/navnow_md.md)] data from OData applications that are supported by [!INCLUDE[navnow](includes/navnow_md.md)].  
  
|To|See|  
|--------|---------|  
|Use OData to obtain an AtomPub document.|[How to: Use OData to Return-Obtain an AtomPub Document](How-to--Use-OData-to-Return-Obtain-an-AtomPub-Document.md)|  
|Use OData to obtain a service metadata \(EDMX\) document.|[How to: Use OData to Return-Obtain a Service Metadata \(EDMX\) Document](How-to--Use-OData-to-Return-Obtain-a-Service-Metadata--EDMX--Document.md)|  
|Use OData to obtain a JavaScript Object Notation \(JSON\) document.|[How to: Use OData to Return-Obtain a JSON Document](How-to--Use-OData-to-Return-Obtain-a-JSON-Document.md)|  
|Use filter expressions in OData URIs.|[Using Filter Expressions in OData URIs](Using-Filter-Expressions-in-OData-URIs.md)|  
|Use FlowFilters in OData URIs.|[How to: Use FlowFilters in OData URIs](How-to--Use-FlowFilters-in-OData-URIs.md)|  
|Use server-driven paging in OData URIs.|[Server-Driven Paging in OData Web Services](Server-Driven-Paging-in-OData-Web-Services.md)|  
|Navigate in an OData web service application by using resource properties.|[Using Containments and Associations](Using-Containments-and-Associations.md)|  
|Write to the database through an OData web service that exposes a writable page.|[Using OData Web Services to Modify Data](Using-OData-Web-Services-to-Modify-Data.md)|  
  
## Known Limitations  
 You can specify filters in OData web services in general that are not supported in [!INCLUDE[navnow](includes/navnow_md.md)], such as using an OR operator to filter on two different fields. In those cases, you will see the following error:  
  
```  
An error occurred while processing this request.   
 The 'OR' operator is not supported on distinct fields on an OData filter.  
```  
  
## See Also  
 [SOAP Web Services](SOAP-Web-Services.md)   
 [Web Service Alternatives: SOAP and OData](Web-Service-Alternatives--SOAP-and-OData.md)   
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)  