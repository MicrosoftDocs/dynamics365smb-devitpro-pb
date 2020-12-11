---
title: Plan for Deployment
description: Get an overview of your options for deploying Dynamics 365 Business Central
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
ms.date: 10/01/2020
---
# Planning Your [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Deployment

This article outlines some of the things you should consider and decide on before you install [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

Most of the topics discussed in this article can be changed at any time after the initial installation.  

## Network Topology

A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment consists of various components that support the production, development, and testing. These components can be installed on various computers. The deployment process varies depending on the topology that you implement.

For more information, see [Deployment Topologies](deployment-scenarios.md).

## Single-tenancy and Multitenancy

By default, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is installed as a single-tenant deployment. This means that the application and the business data is stored in the same database. You can also set up a multitenant deployment, where the application and business data reside in separate databases.

In a multitenant deployment, information about the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application is stored in a separate application database. Your customers’ data is stored in separate business databases, each of which is a *tenant* in your deployment. By separating application from data, you can deploy the same solution to many customers with centralized maintenance of the application and isolation of each tenant, which in turn, makes upgrading easier compared with a single-tenant deployment. 

For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md).
 

## User Authentication

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports several credential mechanisms for authorizing users trying to access data. By default, Windows authentication is used. 

For more information, see [Authentication and Credential Types](../administration/users-credential-types.md).

 
## [!INCLUDE[server](../developer/includes/server.md)] Service Account

The central component of a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment is the [!INCLUDE[server](../developer/includes/server.md)], which handles all communication between the client and the databases. The [!INCLUDE[server](../developer/includes/server.md)] requires a log on account, referred to as the service account. By default, the Network Service Account is used, which is acceptable in a test environment, but we recommend that you use a domain account in your production environment.   

For more information, see [Provisioning the [!INCLUDE[server](../developer/includes/server.md)] Service Account](provision-server-account.md).
 
## Enhancing Connection Security

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] offers features that help secure connections over a wide area network \(WAN\), such as connections from the [!INCLUDE[webserver](../developer/includes/webserver.md)], [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)], and web services to the [!INCLUDE[server](../developer/includes/server.md)]. The implementation of these security features require that you obtain a certificate from a certification authority or trusted provider.

For more information, see:

[Using Security Certificates with Business Central On-Premises](implement-security-certificates-production-environment.md)


[Configuring SSL to Secure the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Web Client Connection](configure-ssl-web-client-connection.md)


## See Also  

[Upgrading to Business Central](../upgrade/upgrading-to-business-central.md)
[Business Central Components](Product-and-Architecture-Overview.md)  
[System Requirements](system-requirement-business-central.md)  
