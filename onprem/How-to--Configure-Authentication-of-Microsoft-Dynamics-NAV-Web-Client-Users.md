---
title: Configure Web Client Users Authentication
description: Configure the installation to authenticate users who connect by using the Web Client on Windows, UserName, NavUserPassword and AccessControlService credential types.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c9e0dd2b-1f7f-417d-a9ca-a08ef2f22d26
caps.latest.revision: 37
---
# Configuring Dynamics NAV Web Client Users Authentication
You can configure the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] installation to authenticate users who connect by using the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] on one of the following credential types.  
  
|Credential type|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Prompted to sign in|  
|---------------------|---------------------------------------|-------------------------|  
|Windows|Users are authenticated using a Windows account \(Active Directory\). Users are automatically authenticated using the Windows account that is currently logged on to the device that they are using to access the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].|No|  
|UserName|Users are authenticated using their Windows account.|Yes|  
|NavUserPassword|Users are authenticated using their [!INCLUDE[navnow](../developer/includes/navnow_md.md)] user name and password, instead of their Windows credentials.|Yes|  
|AccessControlService|Users are authenticated using either Microsoft Azure Access Control Service \(ACS\) or Microsoft Azure Active Directory \(AAD\).|Yes|  
  
 For more information about the credential types and their use, see [Users and Credential Types](Users-and-Credential-Types.md).  
  
 To set up user authentication, you change configuration settings on the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and the [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)] on IIS. The [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)] make up the web site for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] on IIS. Complete the following tasks:  
  
-   [Implementing Security Certificates](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md#Certs)  
  
     Implement security certificates on the computer that is running [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and the computer that is running [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)].  
  
    > [!NOTE]  
    >  This step is not required when you use the Windows credential type.  
  
-   [Configuring the Credential Type for Microsoft Dynamics NAV Server](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md#NavServer)  
  
-   [Configuring the Credential Type on the Microsoft Dynamics NAV Web Client Web Site](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md#WebClient)  
  
##  <a name="Certs"></a> Implementing Security Certificates  
 When using the UserName, NavUserPassword, or AccessControlService credential type, you must implement security certificates on the computer that is running [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and the web server computer that is running [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)]. Security certificates protect the passing of credentials between the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)]. A certificate is a file that the web server uses to prove its identity and establish a trusted connection with [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)].  
  
> [!NOTE]  
>  You do not have to perform this task for Windows authentication.  
  
#### To implement security certificates  
  
-   To create your own certificates and implement them in a test environment for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], see [Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md).  
  
     In this scenario, you create your own self-signed certificates, and then install them on the computers that are running [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and the [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)].  
  
-   To implement certificates in a production environment for [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], see [How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md).  
  
     In this scenario, you obtain certificates from a certification authority. Some large organizations may have their own certification authorities, and other organizations can request a certificate from a third-party organization. After you obtain the certificates, you install them on the computers that are running [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and the [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)].  
  
##  <a name="NavServer"></a> Configuring the Credential Type for Microsoft Dynamics NAV Server  
 The credential type of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] must match the credential type in the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance that is used by the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
#### To configure the credential type for the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance  
  
1.  Start either the [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)] or the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)].  
  
     For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md) or [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
2.  Find the **ClientServicesCredentialType** parameter in the configuration for the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance.  
  
     In the [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)], the parameter is named **Credential Type** and is on the **General** tab.  
  
     For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).  
  
3.  Change the value to either **Windows**, **UserName**, **NavUserPassword**, or **AccessControlService**.  
  
    > [!IMPORTANT]  
    >  On the **Client Services** tab, you must set the **Certificate Thumbprint** parameter to the thumbprint of the security certificate that is used by [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)].  
  
4.  Restart the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance.  
  
##  <a name="WebClient"></a> Configuring the Credential Type on the Microsoft Dynamics NAV Web Client Web Site  
 To configure the credential type for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], perform the following procedures, as described in this section:  
  
1.  Configure the credential type in the [!INCLUDE[web_server_settings_file_md.md](../developer/includes/web_server_settings_file_md.md)]s for the web server instance of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
2.  Enable the authentication methods on the Internet Information Services \(IIS\) website for [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
#### To configure the credential type in the [!INCLUDE[web_server_settings_file_md.md](../developer/includes/web_server_settings_file_md.md)]s of the Microsoft Dynamics NAV Web client site  
  
1.  On the computer that is running the [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)], open the [!INCLUDE[web_server_settings_file_md.md](../developer/includes/web_server_settings_file_md.md)] that is located in the physical path of the virtual directory for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] application. This [!INCLUDE[web_server_settings_file_md.md](../developer/includes/web_server_settings_file_md.md)] contains the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] settings.  
  
2.  The folder path is *%systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]*. For example, the folder for the default [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] application is *%systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](../developer/includes/nav_server_instance_md.md)]* folder.  
  
3.  In the `<DynamicsNavSettings>` element, which is located toward the end of the file, find the `<add key="ClientServicesCredentialType" value=""/>` element, and then change it to one of the following.  
  
    ```  
    <add key="ClientServicesCredentialType" value="Windows"/>  
    ```  
  
    ```  
    <add key="ClientServicesCredentialType" value="UserName"/>  
    ```  
  
    ```  
    <add key="ClientServicesCredentialType" value="NavUserPassword"/>  
    ```  
  
    ```  
    <add key="ClientServicesCredentialType" value="AccessControlService/>  
    ```  
  
4.  If you are configuring the Windows credential type, then you are finished. Save the [!INCLUDE[web_server_settings_file_md.md](../developer/includes/web_server_settings_file_md.md)]. For other credential types, continue to the next step.  
  
5.  Find the `<add key="DnsIdentity" value=""/>` element, and change it as follows.  
  
    ```  
    <add key="DnsIdentity" value="SubjectName"/>  
    ```  
  
     Replace `subjectName` with the subject name or common name \(CN\) of the certificate that is used on the computer that is running [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)].  
  
    > [!NOTE]  
    >  You can find the subject name by opening the certificate in the Certificates snap-in for Microsoft Management Console \(MMC\) on the computer that is running [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)]. For more information, see [Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md) or [How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md).  

<!-- 
  
6.  If you are configuring AccessControlService authentication, then find the `<add key="ACSUri" value=""/>` element, and set the `value` to the URI of the ACS or AAD authentication page.  
  
    ```  
    <add key="ACSUri" value=""/>  
    ```  
  
     For more information, see [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md) and [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md). 

--> 
  
7.  Save the [!INCLUDE[web_server_settings_file_md.md](../developer/includes/web_server_settings_file_md.md)].  
  
#### To enable an authentication method on the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] site  
  
1.  On the computer that is running [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)], open Internet Information Services \(IIS\) Manager.  
  
     On the **Start** menu, in the **Search programs and files** box, type **inetmgr**, and then press Enter.  
  
2.  In the **Connections** pane, under **Sites**, choose **[!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)] Web Client**.  
  
3.  Under **IIS**, double-click **Authentication**.  
  
4.  In the **Authentication** pane, enable the appropriate authentication based on the credential type.  
  
    -   For the Windows credential type, enable **Windows authentication**. If you are using [!INCLUDE[navnow](../developer/includes/navnow_md.md)] apps, you must also enable **Anonymous authentication**. 
  
    -   For the UserName, NavUserPassword, and AccessControlService credential types, enable both **Forms authentication** and **Anonymous authentication**.  
  
     To enable an authentication method, choose the authentication method from the list, and then choose **Enable** in the **Actions** pane.  
  
5.  For Windows authentication, you must set up an authentication provider. By default, Windows authentication is configured to use the Negotiate and NTML providers, which is sufficient for most installations and no action is required. If the computer that is running [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] are on different computers, and delegation with Kerberos is configured between the two computers, then the Negotiate provider must be first in the list of providers.  
  
     To set up the providers, do the following:  
  
    1.  Choose **Window Authentication**, and then under **Actions**, choose **Providers**.  
  
    2.  To add a provider, select the provider from the **Available Providers** list, and then choose **Add**.  
  
    3.  To move a provider in the **Enables Providers** list, select the provider, and then choose the **Move Up** or **Move Up** button.  
  
    4.  Choose the **OK** button.  
  
6.  Restart the web server.  
  
     In the **Connections** pane of IIS Manager, choose the root node for your computer, and then in the **Actions** pane, choose **Restart**.  
  
## See Also  
 [Business Central Web Server Overview](web-server-overview.md)     
 [Configuring Web Server Instances](../administration/configure-web-server.md)   
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)
