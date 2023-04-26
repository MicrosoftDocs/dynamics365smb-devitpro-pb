---
title: "Troubleshooting: A server error occurred and the content cannot be displayed"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7c70c85e-b8b5-413e-b32e-82f1f21c462b
caps.latest.revision: 20
---
# Troubleshooting: A server error occurred and the content cannot be displayed
When you try to open the [!INCLUDE[nav_web](includes/nav_web_md.md)], you get the following error:  
  
 **A server error occurred, and the content cannot be displayed. Refresh the page or open a new browser window.**  
  
 In the Event Viewer of the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], the Windows application log includes the following event:  
  
 **Message: A server was not found at “net.tcp://navserver:7046/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/Service”. Either the URL is incorrect or the server is currently not available.**  
  
 **navserver** is the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
## Resolution  
 This error occurs when the [!INCLUDE[nav_web](includes/nav_web_md.md)] cannot connect to [!INCLUDE[nav_server](includes/nav_server_md.md)]. There are several conditions that can cause this error. Typical causes are [!INCLUDE[nav_server](includes/nav_server_md.md)] has stopped, or the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is configured for the client is incorrect. To resolve this error, verify that the following conditions are met:  
  
-   The [!INCLUDE[nav_web](includes/nav_web_md.md)] is configured to connect to the correct [!INCLUDE[nav_server](includes/nav_server_md.md)]. Verify that the [!INCLUDE[nav_server](includes/nav_server_md.md)] is running and uses the correct logon account.  
  
     Use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to verify the status and configuration. Try to start or restart [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
     For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
-   The logon account of [!INCLUDE[nav_server](includes/nav_server_md.md)] has permission to log on as a service on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
     For more information, see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  
  
-   If you are using Mozilla Firefox as your browser, then you must enable cookies in the browser. Additionally, configure the address of the [!INCLUDE[nav_web](includes/nav_web_md.md)] as a trusted URI in Firefox. For more information, see [How to: Configure Mozilla Firefox for Microsoft Dynamics NAV Clients](How-to--Configure-Mozilla-Firefox-for-Microsoft-Dynamics-NAV-Clients.md).  
  
-   If IIS and the [!INCLUDE[nav_server](includes/nav_server_md.md)] are on separate computers, verify the following conditions:  
  
    -   If the [!INCLUDE[nav_web](includes/nav_web_md.md)] is using Windows authentication, then the **Negotiate** provider must be included at the top of the providers list in the Windows authentication setup in IIS. For more information, see [Configuring the Credential Type on the Microsoft Dynamics NAV Web Client Web Site](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md#WebClient).  
  
    -   Delegation is configured from the computer that is running IIS to the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
        -   The following Service Principal Names are registered for the logon account of [!INCLUDE[nav_server](includes/nav_server_md.md)]:  
  
             `DynamicsNAV/navserver:port`  
  
             `DynamicsNAV/navserver.domain:port`  
  
             **navserver** is the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. **port** is the port that is used by [!INCLUDE[nav_server](includes/nav_server_md.md)]. **domain** is the domain that the computer belongs to.  
  
        -   Kernel mode authentication is either disabled or configured to use the service account of [!INCLUDE[nav_server](includes/nav_server_md.md)] \([!INCLUDE[nav_web](includes/nav_web_md.md)] only\).  
  
        > [!NOTE]  
        >  If you still get this error after verifying the setup, then disable the **Use Kerberos Only** option in the delegation setup and try again. The **Use Kerberos Only** option does not work on some network configurations with [!INCLUDE[navnow](includes/navnow_md.md)].  
  
         For more information about delegation, see [How to: Configure Delegation for Microsoft Dynamics NAV Web Client](How-to--Configure-Delegation-for-Microsoft-Dynamics-NAV-Web-Client.md).  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on Three Computers](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md)
