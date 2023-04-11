---
title: "Troubleshooting: Running the Cmdlet Fails Because the Microosft Dynamics NAV Server Fails to Start-Restart"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ab4a3d53-01c0-46ae-a837-3a16974c3822
caps.latest.revision: 4
---
# Troubleshooting: Running the Cmdlet Fails Because the Microosft Dynamics NAV Server Fails to Start-Restart
You can find more information about the [!INCLUDE[nav_server](includes/nav_server_md.md)] failure reason in the event log. The error most likely occurs because of the impossibility of the [!INCLUDE[nav_server](includes/nav_server_md.md)] to correctly configure the ACL for the ports that are used by the server’s communication endpoints. In some situations, when there are URLACL entries for the same ports but reserved by other services, including other [!INCLUDE[nav_server](includes/nav_server_md.md)]s, the removal procedure fails because of insufficient permissions. The user account running the [!INCLUDE[nav_server](includes/nav_server_md.md)] has to have administrative permissions for the modification of the URLACL to succeed. To fix the issue, you can try one of the following:  
  
-   Remove the URL ACL entries manually. For more information, see [Walkthrough: Configuring Web Services to Use SSL \(SOAP and OData\)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md).  
  
-   Set the [!INCLUDE[nav_server](includes/nav_server_md.md)] to run as Administrator account on your computer.  
  
## See Also  
 [How to: Set up Microsoft Dynamics NAV for Single Sign-on With Office 365 using Windows PowerShell](How-to--Set-up-Microsoft-Dynamics-NAV-for-Single-Sign-on-With-Office-365-using-Windows-PowerShell.md)   
 [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)
