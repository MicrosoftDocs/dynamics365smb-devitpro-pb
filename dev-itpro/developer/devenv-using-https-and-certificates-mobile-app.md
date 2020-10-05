---
title: "Using HTTPS and Certificates in Business Central Mobile App"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
# Using HTTPS and Certificates in Business Central Mobile App
[!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] only works using an HTTPS protocol. This means that you must configure a valid certificate on the server. If a trusted, valid, and signed certificate is configured on the [!INCLUDE[server](includes/server.md)], the end user does not have to do anything. However, if a self-signed certificate is configured on the [!INCLUDE[server](includes/server.md)], the end user must install a certificate on their device. The steps for implementing certificates will vary depending on the platform the user is using.  
  
For more information, see [Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md).  
  
> [!IMPORTANT]  
> It is recommended to *only* use self-signed certificates for testing purposes and never in a production environment.  
  
## See Also  
 [Getting Started Developing for the Dynamics 365 Business Central Mobile App](devenv-getting-started-developing-business-central-mobile-app.md)  
  [Introducing the Dynamics 365 Business Central Mobile App](devenv-Introducing-business-central-Mobile-App.md)   
