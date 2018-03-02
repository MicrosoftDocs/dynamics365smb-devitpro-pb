---
title: "Web Services Best Practices"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4eedbc85-81a6-4a16-bdb5-0c975c3bb7a7
caps.latest.revision: 8
manager: edupont
---
# Web Services Best Practices
This topic provides recommendations that you can implement to make your web services applications easier to understand and maintain.  
  
|Recommendation|Example|  
|--------------------|-------------|  
|Use the HTTPS protocol to send data between [!INCLUDE[navnow](includes/navnow_md.md)] and the web service consumer. The examples in this section use the HTTP protocol to illustrate the setup, but we recommend that your solution uses transport-level security.|In the application that consumes the [!INCLUDE[navnow](includes/navnow_md.md)] web service, require that URIs are accessed by using HTTPS. For example, a more secure URI for the OData web services on your local computer is **https://localhost:7048/DynamicsNAV/OData/**.|  
|Use singular forms of names. This provides meaningful singular entity names in the generated proxy classes.|When publishing page 21, Customer Card, use **Customer** as the service name instead of **Customers** or **CustomerCard**.|  
|Avoid using spaces and other characters because they are transformed to underscores or other characters that may not be displayed as you want and could lead to ambiguity.|When publishing page 42, Sales Order, remove the space and use **SalesOrder** as the service name.|  
|Use Pascal casing when you combine words. Pascal casing capitalizes the first character of each word, including acronyms and initialisms that are more than two letters long.|Use **SalesOrder** or **ContactPerson** as the service name.|