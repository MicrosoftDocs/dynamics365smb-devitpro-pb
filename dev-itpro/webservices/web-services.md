---
title: SOAP and ODATA Web Services
description: Compare the features of SOAP and OData web services and know how to create and maintain these services. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web Services

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports two types of web services: SOAP and OData. Web services are a lightweight, industry-standard way to make application functionality available to a variety of external systems and users. Developers can create and publish functionality as web services, where they expose pages, codeunits, or queries, and even enhance a page web service by using an extension codeunit. When [!INCLUDE[prod_short](../developer/includes/prod_short.md)] objects are published as web services, they are immediately available on the network.  


[!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services are stateless and do not preserve the values of global variables or single-instance codeunits between calls.  

## Comparing SOAP and OData Web Services

Developers planning to create [!INCLUDE[dyn_nav](../developer/includes/dyn_nav_md.md)] web services may need to decide which type of web service is better suited to their needs. The following table shows the types of web service applications that you can create for the web service protocols.  

|Object|SOAP web services|OData web services|  
|-|-----------------------|------------------------|  
|Pages|Yes: Create, Read, Update, and Delete operations \(CRUD\)|Yes: Create, Read, Update, and Delete operations \(CRUD\)|  
|Codeunits|Yes|Yes (through OData unbound actions)|  
|Queries|No|Yes: Read-only|  

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports OData web services in addition to the SOAP web services that have been available since [!INCLUDE[nav2009](../developer/includes/nav2009_md.md)]. 
  
### SOAP Web Services  
 SOAP web services allow full flexibility for building operation-centric services. They provide industry standard interoperability. Windows Communication Framework \(WCF\) has supported SOAP services since its initial release in .NET Framework 3.0, and later releases of the .NET Framework have added additional support and default bindings to make it easier to build SOAP services using WCF.  
  
 The most common type of messaging pattern in SOAP is the Remote Procedure Call \(RPC\), where one network node \(the client\) sends a request message to another node \(the server\), and the server sends a response message to the client.  
  
### OData Web Services  
 The OData standard is well suited for web service applications that require a uniform, flexible, general purpose interface for exposing create retrieve update delete \(CRUD\) operations on a tabular data model to clients. OData is less suited for applications that are primarily RPC-oriented or in which data operations are constrained to certain prescribed patterns. OData supports Representational State Transfer \(REST\)-based data services, which enable resources, identified using Uniform Resource Identifiers \(URIs\), and defined in an abstract data model \(EDM\), to be published and edited by web clients within corporate networks and across the Internet using simple Hypertext Transfer Protocol \(HTTP\) messages. OData services are lightweight, with functionality often referenced directly in the URI.  
  
 Whereas SOAP web services expose a WSDL document, OData web services expose an EDMX document containing metadata for all published web services.  
  
 OData is supported in PowerPivot, a data-analysis add-in to Microsoft Excel that provides enhanced Business Intelligence capabilities. PowerPivot supports sharing and collaboration on user-generated business intelligence solutions in a Microsoft SharePoint Server environment. For more information about PowerPivot, see [https://www.powerpivot.com/](https://go.microsoft.com/fwlink/?LinkID=262183).  
  
 The extensions to the Atom Publishing Protocol defined in the AtomPub extensions to the OData protocol documentation \(which you can download [here](https://go.microsoft.com/fwlink/?LinkID=262184)\) describe how REST-based data services can enable resources, identified using URIs and defined in an abstract data model \(EDM\), to be published and edited by web clients within corporate networks and across the Internet using simple HTTP messages.  
  
In addition to the AtomPub format, the OData implementation in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] also supports the JSON format, a somewhat less verbose format that may perform better in low-bandwidth environments.  

### Page Web Services  
When you expose a page as an OData web service, you can query that data to return a service metadata \(EDMX\) document, an AtomPub document, or a JavaScript Object Notation \(JSON\) document. You can also write back to the database if the exposed page is writable. For more information, see [OData Web Services](OData-Web-Services.md).  

When you expose a page as a SOAP web service, you expose a default set of operations that you can use to manage common operations such as Create, Read, Update, and Delete. Page-based web services offer built-in optimistic concurrency management. Each operation call in a page-based web service is managed as a single transaction.  

For SOAP services, you can also use extension codeunits to extend the default set of operations that are available on a page. Adding an extension codeunit to a page is useful if you want to perform operations other than the standard Create, Read, Update, and Delete operations. The benefit of adding an extension codeunit to a page is that you can make the web service complete by adding operations that are logical to that service. Those operations can use the same object identification principle as the basic page operations.  

### Codeunit Web Services  
 For SOAP services only, codeunit web services provide you with the most control and flexibility. When a codeunit is exposed as a web service, all functions defined in the codeunit are exposed as operations.  

### Query Web Services  
 When you expose a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] query as an OData web service, you can query that data to return a service metadata \(EDMX\) document or an AtomPub document. For more information about how to create and use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] queries, see [Query Object](../developer/devenv-query-object.md).  

### Web Services and Regional Settings  
 Data is formatted according to the value of the **Services Language** setting for the relevant [!INCLUDE[server](../developer/includes/server.md)] instance. The default value is **en-us**. This means that [!INCLUDE[server](../developer/includes/server.md)] interprets all incoming data as the specified culture, such as dates and amounts.  

 If you know that the **Services Language** setting is always en-us, for example, your code can be based on that assumption. In a multilanguage environment, you will see more predictable transformations of data if data that is transmitted through web services is in a consistent culture.  

 Similarly, you can use the **ServicesOptionFormat** setting to specify how [!INCLUDE[server](../developer/includes/server.md)] must understand option values. If you set the **ServicesOptionFormat** setting to *OptionString*, [!INCLUDE[server](../developer/includes/server.md)] understand option values as the *name* of the option value, which is always en\-us. If you set the setting to *OptionCaption*, web service data will be interpreted in the language specified by the **Services Language** setting.  

## Web Services in Multitenant Deployments  
 If your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution is used in a multitenant deployment architecture, you must make sure that any code that generates or consumes a web service specifies the relevant tenant. Web services are set up in the application, but typically you want to consume company-specific and tenant-specific data.  

 If you use the GETURL method, the generated URL will automatically apply to the user's tenant ID. For more information, see [GETURL Method](../developer/methods-auto/system/system-geturl-clienttype-string-objecttype-integer-recordref-boolean-method.md).

 The URL for accessing a web service in a multitenant deployment must specify the tenant ID in one of two ways: As a query parameter, or as a host name. If you use host names for tenants, the host name must be specified as an alternative ID.  

 For example, the following URL consumes the **Customer** ODATA web service for a specific tenant:  

```  
https://localhost:7048/BC130/OData/Company('CRONUS-International-Ltd.')/Customer?Tenant=Tenant1  
```  
For more information, see [Multitenant Deployment Architecture](../deployment/Multitenant-Deployment-Architecture.md).  

## See Also  
 [Publish a Web Service](publish-web-service.md)   
 [Web Services Overview](web-services.md)   
 [SOAP Web Service URIs](SOAP-Web-Service-URIs.md)   
 [Using SystemService to Find Companies](use-systemservice-to-find-companies.md)   
 [Basic Page Operations](Basic-Page-Operations.md)   
 [Web Services Best Practices](Web-Services-Best-Practices.md)   
 [Configuring Business Central Server](../administration/configure-server-instance.md)
  
