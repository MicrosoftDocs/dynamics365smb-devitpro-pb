---
title: "Using Certificates to Secure a Remote Client Connection"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 04b72693-838a-4d0b-aefa-8e26a3a1f2fa
caps.latest.revision: 11
manager: edupont
---
# Using Certificates to Secure a Remote Client Connection
You can use service certificates to help secure [!INCLUDE[rtc](includes/rtc_md.md)] connections over a wide area network \(WAN\). The certificate is a file that [!INCLUDE[nav_server](includes/nav_server_md.md)] uses to prove its identity and establish a trusted connection with the client that is trying to connect. [!INCLUDE[navnowlong](includes/navnowlong_md.md)] can support the following configurations:  
  
-   *Chain trust*, which specifies that each certificate must belong to a hierarchy of certificates that ends in a root authority at the top of the chain.  
  
-   *Peer trust*, which specifies that both self-issued certificates and certificates in a trusted chain are accepted.  
  
 The implementation in this section describes the chain trust configuration, which is the more secure option.  
  
> [!NOTE]  
>  This implementation does not use *Secure Sockets Layer \(SSL\)*. Although these implementations do use the public and private key infrastructure of SSL and SSL certificates, they use Windows Communication Foundation \(WCF\) transport-level security \(TLS\) over the TCP/IP protocol instead of https. This means that these are not strict SSL implementations.  
  
## Certificates for Test and Production  
 In a production environment, you should obtain an certificate from a certification authority or trusted provider. Some large organizations may have their own certification authorities, and other organizations can request a certificate from a third-party organization. In a test environment, if you do not have certificate, then you can create your own self-signed certificate. For information about using self-signed certificates in a text environment, see [Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md).  
  
###  <a name="AboutProdCerts"></a> About Certificates for Production Environment  
 In a production environment, you implement chain trust by obtaining X.509 service certificates from a trusted provider. These certificates and their root certification authority \(CA\) certificates must be installed in the certificates store on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. The CA certificate must also be installed in the certificate store on computers that are running the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] and [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)] so that clients can validate the server.  
  
 Most enterprises and hosting providers have their own infrastructure for issuing and managing certificates. You can also use these certificate infrastructures. The only requirement is that the service certificates must be set up for key exchange and therefore must contain both private and public keys. Additionally, the service certificates that are installed on [!INCLUDE[nav_server](includes/nav_server_md.md)] instances must have the Service Authentication and Client Authentication certificate purposes enabled.  
  
 For more information, see [How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md).  
  
## See Also  
 [Connecting the Microsoft Dynamics NAV Clients over a Wide Area Network](Connecting-the-Microsoft-Dynamics-NAV-Clients-over-a-Wide-Area-Network.md)   
 [Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md)