---
title: Windows Client Configuration
description: This article explains how to configure and modify settings in the initial Setup and the Installed Microsoft Dynamics NAV Windows Client.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 05e8a8fc-bcbd-4cd6-b16c-e4f52b7d5491
caps.latest.revision: 70
---
# Configuring the Microsoft Dynamics NAV Windows Client
When you install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the **Specify Parameters** page in [!INCLUDE[navnow](includes/navnow_md.md)] Setup prompts you for configuration information to enable the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to connect to [!INCLUDE[nav_server](includes/nav_server_md.md)]. This information is then saved in the default ClientUserSettings.config file.  

 A separate instance of the ClientUserSettings.config file is maintained for each user of the computer. The default location for this file is C:\\Users\\\<username>\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\90, where \<username> is the name of the user. This folder and file are hidden by default. Change your folder options in Windows Explorer to view hidden files before you attempt to modify the ClientUserSettings.config file.  

## Configuring the Microsoft Dynamics NAV Windows Client in Setup  
 If you install the [Demo Option](Demo-Option.md), you are not prompted for configuration information, because all [!INCLUDE[navnow](includes/navnow_md.md)] components are automatically installed on the local computer. If you install using any other installation option, you must provide some initial configuration information to enable the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to establish a connection with an instance of [!INCLUDE[nav_server](includes/nav_server_md.md)].  

 In Setup, select one of the following [Installation Options](Installation-Options.md) to install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]:  

-   [Client Option](Client-Option.md)  

-   [Developer Option](Developer-Option.md)  

 You can also customize your installation and customize the list of components to install. For more information, see [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md).  

 After you specify an installation option or customize your component list, the **Specify parameters** pane is displayed in Setup. The list of parameters that you see in the **Specify parameters** pane depends on which components that you have selected for configuration. Setup provides a short description for each parameter. For a description of the most important parameters for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], see [Client Option](Client-Option.md).  

 Choose **Apply** when you have finished entering values on the **Specify parameters** page in Setup. If you want to change the configuration after installation, you can modify the ClientUserSettings.config file for each client.  

##  <a name="afterset"></a> Configuring the Microsoft Dynamics NAV Windows Client After Installation  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup installs ClientUserSettings.config, the default configuration file, with the values that you provided as you ran Setup. This file is stored in C:\\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\90. The first time a user runs the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], a copy of ClientUserSettings.config is copied to C:\\Users\\\<username>\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\90, where \<username> is the name of the user. This folder and file are hidden by default.  

 If you want to change default [!INCLUDE[nav_windows](includes/nav_windows_md.md)] settings for all future users on this computer, edit the default ClientUserSettings.config file in C:\\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\90. You must run your text editor with Administrator permissions when you do this.  

 If you want to change [!INCLUDE[nav_windows](includes/nav_windows_md.md)] settings for an existing user, edit the ClientUserSettings.config file in that user’s C:\\Users\\\<username>\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\90 folder. After you modify a user’s ClientUserSettings.config file, you must restart the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] for changes to take effect.  

 In addition to the settings that you can configure in Setup, the ClientUserSettings.config file contains other settings for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

### Settings in the ClientUserSettings.config File  
 The ClientUserSettings.config file is an .xml file that you can edit with any text editor. Quotation marks are required for all values.  

 The following settings are available.  

|Setting|Description|  
|-------------|-----------------|  
|Server|Specifies the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] for this client.<br /><br /> Default value: Empty string if you installed by using the Client installation option, or **localhost** if you installed by using the Developer Environment installation option or a custom installation.|  
|ClientServicesPort|Specifies the listening TCP port for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the client connects to.<br /><br /> Default value: 7046|  
|ServerInstance|Specifies the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the client connects to.<br /><br /> Default value: [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]<br /><br /> For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).|  
|TenantID|Specifies the tenant that the client connects to in a multitenant deployment. For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md).<br /><br /> Default value: ""|  
|ClientServicesProtectionLevel|Specifies the security services for protecting the client/server data stream. This value must match the value that is specified in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration file. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).<br /><br /> Default: EncryptAndSign<br /><br /> Values: EncryptAndSign, Sign, None|  
|UrlHistory|Specifies a comma-delimited list of [!INCLUDE[nav_server](includes/nav_server_md.md)] connections that is displayed in the **Select Server** window when you choose the drop-down arrow in the **Server name** field.<br /><br /> This parameter is not available after you install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], but it is created and populated after the user enters a server name in the field.<br /><br /> You can create and populate this field after you install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. This gives the user a list of servers from which to choose.<br /><br /> Example:<br /><br /> `<add key="UrlHistory" value="localhost, dev:7046/nav_server_instance, sales:7046/nav_server_instance"/>`<br /><br /> Each value must contain a computer name and can optionally also include a port number and a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. Defaults are assumed if either value is missing.|  
|ClientServicesCompressionThreshold|Specifies the threshold in memory consumption at which the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] starts compressing datasets, in kilobytes.<br /><br /> Default: 64|  
|ClientServicesChunkSize|Specifies the default size for a chunk, in kilobytes.<br /><br /> Default: 28.<br /><br /> The range of values is from 4 to 80.|  
|MaxNoOfXMLRecordsToSend|Specifies the maximum number of data rows that can be sent as XML during export to Word or Excel.<br /><br /> Default: 5000<br /><br /> **Note:** This setting does not pertain to data in lists. The limit for list type pages is configured on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).|  
|MaxImageSize|Specifies the maximum image size \(in bytes\) allowed by validation.<br /><br /> Default: 26214400|  
|ClientServicesCredentialType|Specifies how [!INCLUDE[nav_windows](includes/nav_windows_md.md)] users are authenticated when they connect to [!INCLUDE[nav_server](includes/nav_server_md.md)].<br /><br /> For more information, see [Users and Credential Types](Users-and-Credential-Types.md).<br /><br /> This parameter value must be the same as the Credential Type setting for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the client is configured to connect to. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).<br /><br /> Default value: Windows|  
|ACSUri|Specifies the web location where the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] goes to authenticate the client user.<br /><br /> This parameter is only relevant if the **ClientServicesCredentialType** is set to **ACS**.<br /><br /> Default value: ""|  
|AllowNtlm|Specifies whether NTLM fallback is permitted for authentication.<br /><br /> To require Kerberos authentication, set this value to **false**.<br /><br /> Default value: **true**|  
|ServicePrincipalNameRequired|If this parameter is set to **true**, then the client can only connect to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that has been associated with a service principal name \(SPN\).<br /><br /> If this parameter is set to **false**, then the client attempts to connect to the configured [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, regardless of whether that instance is associated with an SPN.<br /><br /> Default: **false**|  
|ClientServicesCertificateValidationEnabled|Specifies whether to enforce validation of the certificate.<br /><br /> In a production environment, setting this parameter to **true** is strongly recommended.<br /><br /> When validation is enabled, the certificate must be trusted, not revoked, and the CN name should match the URL of your service.<br /><br /> When validation is disabled, you can use a self-signed certificate without a revocation list and no constraint on the CN name.<br /><br /> Default: **true**|  
|DnsIdentity|Specifies the subject name of the service certificate for [!INCLUDE[nav_server](includes/nav_server_md.md)]. The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] makes sure that the certificate that is provided during the SSL handshake contains a Domain Name System \(DNS\) or CommonName \(CN\) attribute that is equal to the DNS identity of the client. This check is performed in addition to determining the validity of the server certificate.<br /><br /> Default: ""<br /><br /> For more information, see [Connecting the Microsoft Dynamics NAV Clients over a Wide Area Network](Connecting-the-Microsoft-Dynamics-NAV-Clients-over-a-Wide-Area-Network.md).|  
|HelpServer|Specifies the name of the computer than hosts the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server.|  
|HelpServerPort|Specifies the TCP listening port for the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server.<br /><br /> Default: 49000|  
|UnknownSpnHint|Specifies whether to use server principal name when establishing the connection between the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)]. This setting is used to authenticate the [!INCLUDE[nav_server](includes/nav_server_md.md)]. You set the values that are based on the value of the **ServicePrincipalNameRequired** key.<br /><br /> Value: The value has the following format.<br /><br /> \* \(net.tcp://NavServer:Port/ServerInstance/Service\)=NoSpn&#124;SPN<br /><br /> \* NavServer is the name of the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)].<br /><br /> \* Port is the port number on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] is running.<br /><br /> \* ServerInstance is the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br /><br /> \* NoSpn&#124;SPN specifies whether to use an SPN. If the ServicePrincipalNameRequired key is set to **false**, then set this value to NoSpn. If the ServicePrincipalNameRequired key is set to **true**, then set this value to Spn.<br /><br /> Default value: \(net.tcp://localhost:7046/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/Service\)=NoSpn<br /><br /> This setting is updated automatically.|
|EnableLegacyControlAddIn|Specifies that control add-ins run in IE7 mode instead of IE11 mode. **Important:** With this parameter you enable IE7 mode for all control add-ins and this means that if you also have newer control add-ins, these will not run.|

## See Also  
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)   
 [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)
