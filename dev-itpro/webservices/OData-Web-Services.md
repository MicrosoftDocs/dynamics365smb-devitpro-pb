---
title: "OData Web Services"
description: Learn about OData web services and how to create and maintain these services. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
---

# OData Web Services

The Open Data Protocol \(OData\) is a web protocol that is designed for querying tabular data and provides you with an alternative to SOAP-based web services. OData builds on web technologies such as HTTP and JavaScript Object Notation \(JSON\) to provide access to information from different applications, services, and stores. OData uses URIs for resource identification and commits to an HTTP-based, uniform interface for interacting with resources. This commitment to core Web principles allows for OData to enable a new level of data integration and interoperability across a broad range of clients, servers, services, and tools.  
  
 You can use OData web services to show [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data, and you can update data in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database using OData web services.  

## Using OData in other Microsoft products and technologies
OData is used in other Microsoft products and technologies, including the following:  
- Microsoft Excel implements OData for its PowerQuery feature.
- Microsoft PowerBI can read data from OData services.
- Microsoft SharePoint can expose its list-oriented data with OData.  

## Key concepts and techniques for accessing Business Central data using OData      
The topics in this section describe the key concepts and techniques for accessing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data from OData applications that are supported by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] .  
  
|To|See|  
|--------|---------|  
|Develop fast OData clients | [OData Query performance](odata-client-performance.md) |
|Expose a codeunit through OData to implement a Remote Procedure Call (RPC) |[Creating and Interacting with an OData V4 Unbound Action](../developer/devenv-creating-and-interacting-with-odatav4-unbound-action.md)|  
|Use OData to obtain an AtomPub document.|[Using OData to Return or Obtain an AtomPub Document](Return-Obtain-an-AtomPub-Document.md)|  
|Use OData to obtain a service metadata \(EDMX\) document.|[Using OData to Return or Obtain a Service Metadata \(EDMX\) Document](return-obtain-service-metadata-edmx-document.md)|  
|Use OData to obtain a JavaScript Object Notation \(JSON\) document.|[Using OData to Return-Obtain a JSON Document](return-obtain-json-document.md)|  
|Use filter expressions in OData URIs.|[Using Filter Expressions in OData URIs](Use-Filter-Expressions-in-OData-URIs.md)|  
|Use FlowFilters in OData URIs.|[Using FlowFilters in OData URIs](use-flowfilters-in-odata-uris.md)|  
|Use server-driven paging in OData URIs.|[Server-Driven Paging in OData Web Services](Server-Driven-Paging-in-OData-Web-Services.md)|  
|Navigate in an OData web service application by using resource properties.|[Using Containments and Associations](use-containments-associations.md)|  
|Write to the database through an OData web service that exposes a writable page.|[Using OData Web Services to Modify Data](use-odata-to-modify-data.md)|
|Learn about limitations with Business Central OData|[Known OData Limitations](odata-known-limitations.md)|    

## Enabling and Configuring OData on the [!INCLUDE[server](../developer/includes/server.md)]
 
The [!INCLUDE[server](../developer/includes/server.md)] instance has several configurations settings that enable and control OData services. For more information, see [OData Services Settings](../administration/configure-server-instance.md#ODataServices).

## Known Limitations with Business Central OData
The Open Data Protocol \(OData\) implementation in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] does not implement all features in the OData specification. For more information, see [Known OData Limitations](odata-known-limitations.md).

## See Also  

[SOAP Web Services](SOAP-Web-Services.md)
