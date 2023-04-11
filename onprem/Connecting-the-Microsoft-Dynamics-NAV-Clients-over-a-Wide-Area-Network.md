---
title: "Connecting the Microsoft Dynamics NAV Clients over a Wide Area Network"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4134e6f3-54ec-48e0-9f28-6b2e3a0e49d7
caps.latest.revision: 22
---
# Connecting the Microsoft Dynamics NAV Clients over a Wide Area Network
This topic contains information about how to implement a secure [!INCLUDE[nav_windows](includes/nav_windows_md.md)] connection to [!INCLUDE[nav_server](includes/nav_server_md.md)] over a wide area network \(WAN\). The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] computers can be in the same or separate Active Directory domains.  
  
 For additional information about hosting and WAN connections, see the [Microsoft Dynamics NAV Team Blog](https://go.microsoft.com/fwlink/?LinkId=205395) and search for the terms **hosting** and **performance**.  
  
## Assumptions  
 The implementation that is used in these topics assumes the following:  
  
-   User accounts are provisioned in an Active Directory domain.  SQL Server and [!INCLUDE[nav_server](includes/nav_server_md.md)] are installed on a computer in this domain.  
  
-   The administrator who is creating this implementation is a member of the domain administrator group in this domain.  
  
-   On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], a DNS entry that resolves to the published server port on the computer’s firewall exists for [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
-   If the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_server](includes/nav_server_md.md)] is behind a firewall, then you must open a port to communicate with [!INCLUDE[nav_server](includes/nav_server_md.md)] on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] computer and publish the port on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. The default port number is 7046.  
  
-   The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] are configured as described in the [Walkthrough: Installing the Three Tiers on Three Computers](https://go.microsoft.com/fwlink/?LinkID=163660) topic in the MSDN Library.  
  
## Implementing the Windows Client  over a Wide Area Network  
 The implementation that is shown in these topics includes instructions for protecting your WAN connections with security certificates. We recommend that you do not implement remote access without security certificates.  
  
|To|See|  
|--------|---------|  
|Read about the certificate security implementation that is presented in this implementation.|[Using Certificates to Secure a Remote Client Connection](Using-Certificates-to-Secure-a-Remote-Client-Connection.md)|  
|Follow a detailed demonstration of how to set up an environment for testing secure connections over a WAN by using the chain trust configuration.|[Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md)|  
|Learn how to implement security certificates in a production environment.|[How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md)|
