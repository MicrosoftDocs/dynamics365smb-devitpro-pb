---
title: "Using HTTPS and Certificates"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ea8838c0-0740-4ffc-9b1b-1f89cda8f13b
caps.latest.revision: 15
manager: edupont
---
# Using HTTPS and Certificates
The [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] can only run on an HTTPS protocol. To enable support for HTTPS on [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)], you must implement security certificates. Complete instructions are available from your certificate provider. We recommend that you secure the data that is transmitted over the Internet by enabling Secure Sockets Layer \(SSL\) on the connection to the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]. For more information, see [Digital Certificates](https://go.microsoft.com/fwlink/?LinkId=509846).  
  
 The following table illustrates how SSL is enforced.  
  
|Mode|Credentials Type|Enforced SSL?|  
|----------|----------------------|-------------------|  
|[!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]|Windows authentication|**Enforced**|  
||NavUserPassword|**Enforced**|  
|[!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser|Windows authentication|**Not enforced**<br /><br /> Only credentials are encrypted, all other communication over the network is sent in clear text. Use SSL to help secure this.|  
||NavUserPassword|**Not enforced**<br /><br /> Credentials in addition to all other communication over the network are sent in clear text. Use SSL to help secure this.|  
  
## Implementing Security Certificates  
 [!INCLUDE[navnow](includes/navnow_md.md)] Universal App only works using an HTTPS protocol. This means that you must configure a valid certificate on the server. If a trusted, valid, and signed certificate is configured on the [!INCLUDE[nav_server](includes/nav_server_md.md)], the end-user does not have to do anything. If a self-signed certificate is configured on the [!INCLUDE[nav_server](includes/nav_server_md.md)], the end-user must install a certificate on their device. The steps for implementing certificates will vary depending on the platform the user is using.  
  
 For more information, see [How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md).  
  
> [!IMPORTANT]  
>  It is recommended to only use self-signed certificates for testing purposes and never in a production environment.  
  
## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Getting Started Developing for the Microsoft Dynamics NAV Universal App](Getting-Started-Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)