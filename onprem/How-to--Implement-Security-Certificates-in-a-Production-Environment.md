---
title: "How to: Implement Security Certificates in a Production Environment"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2a8f08ba-1555-4656-be65-7ce9dc9e5311
caps.latest.revision: 23
manager: edupont
---
# How to: Implement Security Certificates in a Production Environment
This topic describes how to implement security certificates on the [!INCLUDE[nav_server](includes/nav_server_md.md)], [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], and clients after you have obtained a service certificate and a root certification authority \(CA\) from a trusted provider.  
  
For general information about obtaining and requirements for certificates from a trusted provider, see [About Certificates for Production Environment](Using-Certificates-to-Secure-a-Remote-Client-Connection.md#AboutProdCerts).  
  
> [!NOTE]  
>  An instance of [!INCLUDE[nav_server](includes/nav_server_md.md)] that has been configured for secure WAN communication always prompts [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)] users for authentication when they start the client, even when the client computer is in the same domain as [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
## Running the Certificates Snap-in for Microsoft Management Console  
Some of the following procedures use the Certificates snap-in for Microsoft Management Console \(MMC\). If you do not already have this snap-in installed, you can add it to the MMC.  
  
#### To add Certificates snap-in for Microsoft Management Console \(MMC\)  
  
-   See [Add the Certificates Snap-in to an MMC](http://go.microsoft.com/fwlink/?LinkID=699497).  
  
## Installing and Configuring the Certificates  
You install the security certificates on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], computers running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], and the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] according to the following guidelines. The root CA certificate and the service certificate are used in the configuration, but client certificates are not.  
  
1.  Follow the installation instructions that are available from your certificate provider to install the root CA and service certificates on the following computers:  
  
    -   Install the root CA on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] and all computers that are running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  
  
    -   Install the service certificate on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] only.  
  
2.  Make sure that the **Server Authentication** and **Client Authentication** certificate purposes are enabled for the service certificate.  
  
    A certificate can be enabled for several different purposes. The **Server Authentication** and **Client Authentication** purposes must be enabled. You can enable or disable other purposes to suit your requirements.  
  
    You enable certificate purposes by using the Certificates Snap-in for MMC. For more information, see [Modify the Properties of a Certificate](http://go.microsoft.com/fwlink/?LinkID=699496).  
  
## Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)]  
After you have installed the root CA and the service certificate on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], you must grant access to the service account that is associated with the server so that the service account can access the service certificate’s private key. You must also change the configuration settings for [!INCLUDE[nav_server](includes/nav_server_md.md)] to enable remote logins.  
  
#### To configure the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]  
  
1.  In the left pane of MMC, expand the **Certificates \(Local Computer\)** node, expand the **Personal** node, and then select the **Certificates** subfolder.  
  
2.  In the right pane, right-click the certificate, select **All Tasks**, and then choose **Manage Private Keys**.  
  
3.  In the **Permissions** dialog box for the certificate, choose **Add**.  
  
4.  In the **Select Users, Computers, Service Accounts, or Groups** dialog box, enter the name of the dedicated domain user account that is associated with [!INCLUDE[nav_server](includes/nav_server_md.md)], and then choose the **OK** button.  
  
5.  In the **Full Control** field, select **Allow**, and then choose the **OK** button.  
  
6.  In the right pane, select the certificate.  
  
7.  In the **Certificate** dialog box, choose the **Details** tab, and then select the **Thumbprint** field.  
  
8.  Copy or note the value of the **Thumbprint** field.  
  
9. Start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
10. Stop the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  
  
11. Modify the following settings for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
    |Key|New value|Description|  
    |---------|---------------|-----------------|  
    |Credential Type|`NavUserPassword`, `Username`, or `AccessControlService`|This parameter is on the **General** tab in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. The default value is `Windows`. When you change it to `NavUserPassword`, `Username`, or `AccessControlService`, client users who connect to the server are prompted for user name and password credentials. For more information on authentication mechanisms for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Users and Credential Types](Users-and-Credential-Types.md). For information on how to provision users with initial username and password values, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).|  
    |Certificate Thumbprint|Value of the **Thumbprint** field in the previous procedure.|This parameter is on the Client Services tab in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. The default value is \<key>. Remove any leading or trailing spaces in the thumbprint.|  
  
12. Save and the new values for the server instance.  
  
13. Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
    If there is a problem, see Windows Event Viewer.  
  
## Configuring the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]  
The chain trust configuration allows all users of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on a computer to log on to one or more instances of [!INCLUDE[nav_server](includes/nav_server_md.md)] as long as their login credentials have been associated with user accounts in [!INCLUDE[navnow](includes/navnow_md.md)]. The client validates that the server certificate is signed with the root CA.  
  
After you have installed the root CA on the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you must modify the client configuration file.  
  
#### To modify the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] configuration file  
  
1.  Open the ClientUserSettings.config configuration file.  
  
     The location of this file is *Users\\\<*username*>\\AppData\\RoamingLocal\\Microsoft\\[!INCLUDE[navnow](includes/navnow_md.md)]\\<version>*.   
  
     By default, this file is hidden. Therefore, you may have to change your folder options in Windows Explorer to view hidden files.  
  
    > [!NOTE]  
    >  If you want to change default [!INCLUDE[nav_windows](includes/nav_windows_md.md)] settings for all future users, edit the default ClientUserSettings.config file —t hat is, the one in [!INCLUDE[navnow_install](includes/navnow_install_md.md)]. Be sure that you run your text editor with Administrator privileges when you do so.  
  
2.  Modify the following settings.  
  
    |Key|New value|Description|  
    |---------|---------------|-----------------|  
    |ClientServicesCredentialType|`NavUserPassword`, `Username`, or `AccessControlService`|The default value is `Windows`. When you change it to `NavUserPassword`, `Username`, or `AccessControlService`, client users are prompted for user name and password credentials. For more information on authentication mechanisms for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Users and Credential Types](Users-and-Credential-Types.md). For information on how to provision users with initial username and password values, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).|  
    |DnsIdentity|The subject name of the service certificate.|The default value is \<identity>. Replace this with the subject name or common name \(CN\) of the certificate that is used on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].|  
  
3.  Save and close the ClientUserSettings.config file.  
  
 When you starting the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], users are prompted for a valid user name and password.  
  
#### To modify the [!INCLUDE[nav_web](includes/nav_web_md.md)] configuration file  
  
1.  On the computer that is installed the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] in a text editor, such as Notepad.
  
2. Change the following settings:  
  
    |Key|New value|Description|  
    |---------|---------------|-----------------|  
    |ClientServicesCredentialType|`NavUserPassword`, `Username`, or `AccessControlService`|The default value is `Windows`. When you change it to `NavUserPassword`, `Username`, or `AccessControlService`, client users who connect to the server are prompted for user name and password credentials. For more information on authentication mechanisms for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Users and Credential Types](Users-and-Credential-Types.md). For information on how to provision users with initial username and password values, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).|  
    |DnsIdentity|The subject name of the service certificate|The default value is \<identity>. Replace this with the subject name or common name \(CN\) of the certificate that is used on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].|  
  
4.  Save the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)].  
  
     For more information about configuring the credential type for the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md).