---
title: Web Services Overview
description: Web services are a lightweight, industry-standard way to make application functionality available to a variety of external systems and users.
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Microsoft Dynamics NAV Web Services Overview
Web services are a lightweight, industry-standard way to make application functionality available to a variety of external systems and users. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports creation and publishing of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] functionality as web services. You can expose pages, codeunits, or queries as web services, and even enhance a page web service by using an extension codeunit. When you publish [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects as web services, they are immediately available on the network.  

 Developers can publish two types of web services from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects:  

-   [SOAP Web Services](SOAP-Web-Services.md). You can publish either [!INCLUDE[prodshort](../developer/includes/prodshort.md)] pages or codeunits as SOAP services.  

-   [OData Web Services](OData-Web-Services.md). You can publish either pages or queries as OData services.  

 [!INCLUDE[prodshort](../developer/includes/prodshort.md)] web services are stateless and do not preserve the values of global variables or single-instance codeunits between calls.  

## Web Service Protocols  
 The following table shows the types of web service applications that you can create for the web service protocols supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] .  

||SOAP web services|OData web services|  
|-|-----------------------|------------------------|  
|Pages|Yes: Create, Read, Update, and Delete operations \(CRUD\)|Yes: Create, Read, Update, and Delete operations \(CRUD\)|  
|Codeunits|Yes|No|  
|Queries|No|Yes: Read-only|  

 For more information about the difference between these protocols, see [Web Services Overview](web-services.md).  

### Page Web Services  
 When you expose a page as an OData web service, you can query that data to return a service metadata \(EDMX\) document, an AtomPub document, or a JavaScript Object Notation \(JSON\) document. You can also write back to the database if the exposed page is writable. For more information, see [OData Web Services](OData-Web-Services.md).  

 When you expose a page as a SOAP web service, you expose a default set of operations that you can use to manage common operations such as Create, Read, Update, and Delete. Page-based web services offer built-in optimistic concurrency management. Each operation call in a page-based web service is managed as a single transaction.  

 For SOAP services, you can also use extension codeunits to extend the default set of operations that are available on a page. Adding an extension codeunit to a page is useful if you want to perform operations other than the standard Create, Read, Update, and Delete operations. The benefit of adding an extension codeunit to a page is that you can make the web service complete by adding operations that are logical to that service. Those operations can use the same object identification principle as the basic page operations. For an example of how to implement an extension codeunit, see [Walkthrough: Creating a Web Service using Extension Codeunits \(SOAP\)](Walkthrough--Creating-a-Web-Service-using-Extension-Codeunits--SOAP.md).  

### Codeunit Web Services  
 For SOAP services only, codeunit web services provide you with the most control and flexibility. When a codeunit is exposed as a web service, all functions defined in the codeunit are exposed as operations.  

### Query Web Services  
 When you expose a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] query as an OData web service, you can query that data to return a service metadata \(EDMX\) document or an AtomPub document. For more information about how to create and use [!INCLUDE[prodshort](../developer/includes/prodshort.md)] queries, see [Queries](Queries.md).  

## Web Services and Regional Settings  
 Data is formatted according to the value of the **Services Language** setting for the relevant [!INCLUDE[server](../developer/includes/server.md)] instance. The default value is **en-us**. This means that [!INCLUDE[server](../developer/includes/server.md)] interprets all incoming data as the specified culture, such as dates and amounts.  

 If you know that the **Services Language** setting is always en-us, for example, your code can be based on that assumption. In a multilanguage environment, you will see more predictable transformations of data if data that is transmitted through web services is in a consistent culture.  

 Similarly, you can use the **ServicesOptionFormat** setting to specify how [!INCLUDE[server](../developer/includes/server.md)] must understand option values. If you set the **ServicesOptionFormat** setting to *OptionString*, [!INCLUDE[server](../developer/includes/server.md)] understand option values as the *name* of the option value, which is always en\-us. If you set the setting to *OptionCaption*, web service data will be interpreted in the language specified by the **Services Language** setting.  

>    [!NOTE] 
>    In earlier versions of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] , you could enable **ServicesCultureDefaultUserPersonalization** on the [!INCLUDE[server](../developer/includes/server.md)] instance. This was deprecated in [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)] in order to guarantee that web services have a consistent culture.  

## Web Services in Multitenant Deployments  
 If your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution is used in a multitenant deployment architecture, you must make sure that any code that generates or consumes a web service specifies the relevant tenant. Web services are set up in the application, but typically you want to consume company-specific and tenant-specific data.  

 If you use the GETURL method, the generated URL will automatically apply to the user’s tenant ID. For more information, see [GETURL Method](../developer/methods/devenv-GETURL-Method.md).  

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
 [How to: Use SystemService to Find Companies](How-to--Use-SystemService-to-Find-Companies.md)   
 [Basic Page Operations](Basic-Page-Operations.md)   
 [Web Services Best Practices](Web-Services-Best-Practices.md)   
 [Configuring Business Central Server](../administration/configure-server-instance.md)
