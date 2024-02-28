---
title: REST APIs, OData, and SOAP web services
description: Compare the features of REST APIs, SOAP, and OData web services and know how to create and maintain these services. 
author: kenniep
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: kepontop
ms.date: 02/28/2024
---

# [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports three types of web services: (REST) API, SOAP, and OData. Web services are a lightweight, industry-standard way to make application functionality available to various external systems and users. Developers can create and publish functionality as REST API web services for reading and/or writing data back to [!INCLUDE[prod_short](../includes/prod_short.md)]. 

Using REST API web services is the recommended way to develop and consume web services. But apart from REST API web services, it's still possible to publish pages, codeunits, or queries as web services, and even enhance a page web service by using an extension codeunit. When [!INCLUDE[prod_short](../includes/prod_short.md)] objects are published as web services, they're immediately available on the network.  

All [!INCLUDE[prod_short](../includes/prod_short.md)] web services are stateless and don't preserve the values of global variables or single-instance codeunits between calls.  

[!INCLUDE[webservice_key_deprecated](../includes/web-service-key-deprecated.md)]

## Web service telemetry, performance, troubleshooting, and security

When working with web service integrations, you need to pay extra attention to the fundamental areas of telemetry, performance, troubleshooting, and security.

### Web service telemetry

All calls to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services are logged to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or (REST) API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

For more information web service telemetry, see: [Web Service Telemetry](web-service-telemetry.md)  

### Web service performance

The performance of web services (REST API, OData, or SOAP) is both the responsibility of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server endpoint and the consumer (the client). 

For more information about web service performance, see [Web service performance](web-service-performance.md).  

### Web service security

Security is an important part of a solution involving web services. One reason is because the client calling the web service endpoint is likely not delivered by Microsoft. Another reason is because the interaction between the client and [!INCLUDE[prod_short](../includes/prod_short.md)] is over a network.

For more information, see [Web service security](web-service-security.md).  


### Troubleshooting web services

Troubleshooting web service errors can be tricky because the root cause of the error can be in multiple places:

- It can be in the client that's calling the web service.
- It can be related to the network between the client and the web service endpoint.
- It can be in the code behind the web service endpoint.

For more information, see [Troubleshooting web service errors](web-service-troubleshooting.md).  


### Web services best practices

Apart from the articles mentioned previously, you might also want to learn more about best practices when working with web services in [!INCLUDE[prod_short](../includes/prod_short.md)].

For more information, see [Web services best practices](web-services-best-practices.md).


## The OData standard

Web services of type REST API and OData are both based on OData version 4. The OData standard is well suited for web service applications that require a uniform, flexible, general purpose interface for exposing create retrieve update delete \(CRUD\) operations on a tabular data model to clients. OData can also be used for applications that are primarily RPC-oriented by using unbound actions. OData supports Representational State Transfer \(REST\)-based data services.

REST-based data services  enable resources that are identified using Uniform Resource Identifiers \(URIs\) and defined in an abstract data model \(EDM\) to be published and edited by web clients within corporate networks and across the Internet using simple Hypertext Transfer Protocol \(HTTP\) messages. OData services are lightweight, with functionality often referenced directly in the URI.

OData is used in other Microsoft products and technologies, for example:

- Microsoft Excel implements OData for its PowerQuery feature.
- Microsoft Power BI can read data from OData services.
- Microsoft SharePoint can expose its list-oriented data with OData.  

For more information, see [OData overview](odata-web-services.md).

## Comparing REST APIs, SOAP, and OData Web Services

Developers planning to create [!INCLUDE[prod_short](../includes/prod_short.md)] web services might need to decide which type of web service is better suited to their needs. 

The following table shows how each type of web service is supported in Microsoft connectors.

|Connector      |SOAP web services|OData web services                   |(REST) API web services|
|---------------|-----------------|-------------------------------------|-----------------------|  
|Power BI       | No              |Yes (but considered a legacy method) | Yes (recommended) |
|Power platform | No              | No                                  | Yes |

The following table shows the types of objects you use in AL for each type of web service.  

|Object|SOAP web services|OData web services|(REST) API web service|
|-|-----------------------|------------------------|------------------------|  
|Pages|Yes: Create, Read, Update, and Delete operations \(CRUD\)|Yes: Create, Read, Update, and Delete operations \(CRUD\)| Yes: Create, Read, Update, and Delete operations \(CRUD\) |
|Codeunits|Yes|Yes (through OData unbound actions)| No, not yet |  
|Queries|No|Yes: Read-only| Yes: Read-only | 

[!INCLUDE[prod_short](../includes/prod_short.md)] supports REST API and OData web services in addition to the SOAP web services, which have been available since [!INCLUDE[nav2009](../developer/includes/nav2009_md.md)]. 

[!INCLUDE[gui_allowed](../developer/includes/include-gui-allowed.md)]

## REST API Web Services  

The [!INCLUDE[prod_short](../includes/prod_short.md)] API stack is optimized for performance and is the preferred way to integrate [!INCLUDE[prod_short](../includes/prod_short.md)] with external systems. [!INCLUDE[prod_short](../includes/prod_short.md)] also comes with an extensive list of built-in (REST) APIs that requires no code and minimal setup to use. You can also develop your own custom APIs using the AL object types API pages and API queries.

For more information about REST API web services, see [REST API web services overview](api-overview.md).

## OData Web Services  

With OData web services, you can publish pages, codeunits, and queries as ODataV4 web service endpoints. 

SOAP web services expose a Web Services Description Language (WSDL) document. OData web services expose an Entity Data Model XML (EDMX) document containing metadata for all published web services.  
  
The extensions to the Atom Publishing Protocol defined in the AtomPub extensions to the OData protocol documentation \(which you can download [here](https://go.microsoft.com/fwlink/?LinkID=262184)\) describe how REST-based data services can enable resources, identified using URIs and defined in an abstract data model \(EDM\), to be published and edited by web clients within corporate networks and across the Internet using simple HTTP messages.  
  
In addition to the AtomPub format, the OData implementation in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] also supports the JSON format, a less verbose format that might perform better in low-bandwidth environments.  

For more information about OData web services, see [Publishing a web service](publish-web-service.md).


## SOAP Web Services  

With SOAP web services, you can publish pages and codeunits as SOAP web service endpoints. The most common type of messaging pattern in SOAP is the Remote Procedure Call \(RPC\). With RPC, one network node \(the client\) sends a request message to another node \(the server\), and the server sends a response message to the client.

> [!IMPORTANT]
> SOAP is replaced by OData V4. The support for SOAP endpoints will be removed in a later release. We recommend that you migrate integrations to OData V4 or REST API web services as soon as possible. For codeunits published as SOAP web services, you can replace most of them with a similar OData web service using OData unbound actions. 

For more information about SOAP web services, see [SOAP web service overview](soap-web-services.md).  

## Publishing pages, queries, or codeunits as web services  

Before REST APIs were available in [!INCLUDE[prod_short](../includes/prod_short.md)], publishing pages, queries, or codeunits as OData or SOAP based web services was the only way to develop integrations to [!INCLUDE[prod_short](../includes/prod_short.md)]. 

The [!INCLUDE[prod_short](../includes/prod_short.md)] REST API stack is optimized for performance and is now the preferred way to integrate [!INCLUDE[prod_short](../includes/prod_short.md)] with external systems. 

### Web services based on a page

You can publish any page as a web service, but page concepts such as FactBoxes aren't included in the web service result. The developer of the page might not know that the page is published as a web service, so they might use AL code to calculate values for the FactBox. This situation is one reason why REST APIs are the recommended and preferred option over publishing a page as a web service.

Page-based web services offer built-in optimistic concurrency management. Each operation call in a page-based web service is managed as a single transaction.  

You can use extension codeunits to extend the default set of operations that are available on a page. Adding an extension codeunit to a page is useful if you want to perform operations other than the standard Create, Read, Update, and Delete operations. The benefit of adding an extension codeunit to a page is that you can make the web service complete by adding operations that are logical to that service. Those operations can use the same object identification principle as the basic page operations.

When you expose a page as an OData web service, you can query that data to return a service metadata \(EDMX\) document, an AtomPub document, or a JavaScript Object Notation \(JSON\) document. You can also write back to the database if the exposed page is writable. For more information, see [OData Web Services](OData-Web-Services.md).  

For more information about page web services, see [Publishing a web service](publish-web-service.md).


### Web services based on a codeunit

Codeunit web services provide you with the most control and flexibility. When a codeunit is exposed as a web service, all functions defined in the codeunit are exposed as operations. Both OData and SOAP can be used with codeunit web services.

For more information about codeunit web services, see [Publishing a web service](publish-web-service.md).

### Web services based on a query

When you expose a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] query as an OData web service, you can query that data to return a service metadata \(EDMX\) document or an AtomPub document. For more information about how to create and use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] queries, see [Query Object](../developer/devenv-query-object.md).  

For more information about query web services, see [Publishing a web service](publish-web-service.md).

## Managing timezones in web services

For fields of type datetime, the time part of the data needs clarification when the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is located in a different timezone than the connect app (the one that consumes data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services).

To learn more about how timezones work in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services stack for this type of data, see [Managing timezones in web services](managing-time-zones-with-web-services.md).



## Web Services and Regional Settings (for on-premises)

Data is formatted according to the value of the **Services Language** setting for the relevant [!INCLUDE[server](../developer/includes/server.md)] instance. The default value is **en-us**. This means that [!INCLUDE[server](../developer/includes/server.md)] interprets all incoming data as the specified culture, such as dates and amounts.  

If you know that the **Services Language** setting is always en-us, for example, your code can be based on that assumption. In a multilanguage environment, you see more predictable transformations of data if data that is transmitted through web services is in a consistent culture.  

Similarly, you can use the **ServicesOptionFormat** setting to specify how [!INCLUDE[server](../developer/includes/server.md)] must understand option values. If you set the **ServicesOptionFormat** setting to *OptionString*, [!INCLUDE[server](../developer/includes/server.md)] understand option values as the *name* of the option value, which is always en\-us. If you set the setting to *OptionCaption*, web service data is interpreted in the language specified by the **Services Language** setting.  


## Web Services in Multitenant Deployments (for on-premises) 

If your [!INCLUDE[prod_short](../includes/prod_short.md)] solution is used in a multitenant deployment architecture, you must make sure that any code that generates or consumes a web service specifies the relevant tenant. Web services are set up in the application, but typically you want to consume company-specific and tenant-specific data.  

If you use the GETURL method, the generated URL is automatically applied to the user's tenant ID. For more information, see [GETURL Method](../developer/methods-auto/system/system-geturl-clienttype-string-objecttype-integer-recordref-boolean-method.md).

The URL for accessing a web service in a multitenant deployment must specify the tenant ID in one of two ways: As a query parameter, or as a host name. If you use host names for tenants, the host name must be specified as an alternative ID.  

For example, the following URL consumes the **Customer** ODATA web service for a specific tenant:  

```  
https://localhost:7048/BC230/ODataV4/Company('CRONUS-International-Ltd.')/Customer?Tenant=Tenant1  
```  

For more information, see [Multitenant Deployment Architecture](../deployment/Multitenant-Deployment-Architecture.md).  


## See also
[Web Service Telemetry](web-service-telemetry.md)  
[Web service performance](web-service-performance.md)  
[Web service security](web-service-security.md)   
[Troubleshooting web service errors](web-service-troubleshooting.md)   
[Web Services Best Practices](Web-Services-Best-Practices.md)   
[OData overview](odata-web-services.md)   
[REST API web services overview](api-overview.md)  
[SOAP web service overview](soap-web-services.md)  
[Publish a Web Service](publish-web-service.md)   
[Multitenant Deployment Architecture (on-premises)](../deployment/Multitenant-Deployment-Architecture.md)   
[Configuring Business Central Server (on-premises)](../administration/configure-server-instance.md)  