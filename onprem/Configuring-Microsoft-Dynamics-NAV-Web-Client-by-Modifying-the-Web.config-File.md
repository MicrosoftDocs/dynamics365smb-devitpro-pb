---
title: "Configuring Microsoft Dynamics NAV Web Client by Modifying the NavSettings.json File"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Configuring a [!INCLUDE[nav_web](includes/nav_web_md.md)] Instance for the Web Client
You can create a [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance for the [!INCLUDE[nav_web](includes/nav_web_md.md)] by using the Setup wizard to install the [!INCLUDE[nav_web](includes/nav_web_md.md)] or by running the [New-NAVWebServerInstance cmdlet](https://docs.microsoft.com/en-us/powershell/module/Microsoft.Dynamics.Nav.Management/new-navwebserverinstance). When you set up a web server instance, you are configuring the connection from the [!INCLUDE[nav_web](includes/nav_web_md.md)] to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The connection settings, along with several other configuration settings, are saved in a configuration file for the web server instance.

## <a name="WebClientSettingsFile"></a>About the configuration file
The name of the configuration file depends on your [!INCLUDE[navnow_md.md](includes/navnow_md.md)].

-   With [!INCLUDE[nav2018_md](includes/nav2018_md.md)], because the web server instances run on .NET Core, the configuration file for the web server instances is a .json file type called **navsettings.json**. The navsettings.json file is a Java Script Object Notification file type that is similar to files that use the XML file format.

- With [!INCLUDE[nav2017](includes/nav2017.md)] and earlier, the configuration file is a .config type file called **web.config**. 

 After installation, you can change the configuration by modifying the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)]. There are two ways to modify this file: directly or using PowerShell.

### Where to find the navsettings.json or web.config file
The navsettings.json or web.config file is stored in the physical path of the web server instance, which is by default is *%systemroot%\\inetpub\\wwwroot\\[WebServerInstanceName]*.

*[WebServerInstanceName]* corresponds to the name (alias) of the web server instance in IIS, for example, *c:\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)]*. 

## Modify the navsettings.json or web.config file directly

1. Open the navsettings.json or web.config in any text or code editor, such as Notepad or Visual Studio Code.

    Each setting is defined by a key-value pair.  
    
    -   In the navsettings.json file, a setting has the format:

        `"keyname": "keyvalue",`

    -   In the web.config file, a setting has the format:

        `<add key="keyname" value="keyvalue"/>`

    
    The `keyname` is the name of the configuration setting and the `keyvalue` is the value.
    
    For example, in the navsettings.json file, the configuration setting that specifies the Windows credential type for authenticating users is:

    `"ClientServicesCredentialType":  "Windows",`

    In the web.config file, the setting is:
    
    `<add key="ClientServicesCredentialType" value="Windows"/>`

2.  Find the configuration settings that you want to change, and then change the values.

    See the [Settings](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md#Settings) section for a description of each setting.
3.  When you are done making changes, save the file.
4.  Restart the [!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)] for the changes to take effect.
    
    For example, in IIS Manager, in the **Connections** pane, select website node for [!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)], and then in the **Actions** pane, choose **Restart**. Or, from your desktop, run `iisreset`. 

## Modify the navsettings.json or web.config file by using the Set-NAVWebServerInstanceConfiguration PowerShell cmdlet
The PowerShell script module **NAVWebClientManagement.psm1** includes the [Set-NAVWebServerInstanceConfiguration cmdlet](https://docs.microsoft.com/en-us/powershell/module/Microsoft.Dynamics.Nav.Management/Set-NAVWebServerInstanceConfiguration) that enables you to configure a web server instance.

1. Depending on your installation, run the [!INCLUDE[nav_dev_shell_md](includes/nav_dev_shell_md.md)] or Windows PowerShell as an administrator.

    For more information, see [Get started with the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] cmdlets](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md#GetStartedWebServerCmdlets).

2. For each setting that you want to change, at the command prompt, run the following command:

    ```
    Set-NAVWebServerInstanceConfiguration -Server [MyComputer] -ServerInstance [NAVServerInstanceName] -WebServerInstance [MyNavWebServerInstance] -KeyName [Setting] -KeyValue [Value]
    ```

    Replace:
    -   `[MyComputer]` with the name of the computer that is running the [!INCLUDE[nav_server_md](includes/nav_server_md.md)]
    -   `[NAVServerInstanceName]` with the name of the server instance, such as **[!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)]**.
    -   `[MyNavWebServerInstance]`with the name of the web server instance for the [!INCLUDE[nav_web](includes/nav_web_md.md)].
    -   `[KeyName]` with the name of the setting. Refer to the next section in this article.
    -   `[KeyValue]` with the new value of the setting.


## <a name="Settings"></a>Settings in the navsettings.json  
The following table describes the settings that are available in the navsettings.json.   

> [!IMPORTANT]  
>  If modifying the file directly, place values in double quotes `""`.    

|Setting/KeyName|Description|  
|-------------|-----------------|  
|AllowedFrameAncestors|Specifies the host name of any web sites in which the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] or parts of are embedded. By default, the [!INCLUDE[nav_web](includes/nav_web_md.md)] will not allow a website to display it inside an iframe unless the website is hosted on the same web server. This value of this setting is a comma-separated list of host names (URIs). Wildcard names are accepted. For example: `https:mysite.sharepoint.com, https:*.myportal.com`<BR /><BR /> For more information, see [Embedding Microsoft Dynamics NAV Web Client Pages in Other Websites](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md)|
|GlobalEndPoints|Specifies the comma-separated list of global endpoints that are allowed to call this website. The values must include http scheme and fully qualifies omain name (FDQN), such as `https://financials.microsoft.com`.|
|AllowNtlm|Specifies whether NT LAN Manager \(NTLM\) fallback is permitted for authentication.<br /><br /> To require Kerberos authentication, set this value to **false**.<br /><br /> Values: **true**, **false**<br /><br /> Default value: **true**|  
|ClientServicesChunkSize|Sets the maximum size, in kilobytes, of a data chunk that is transmitted between [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)]. Data that is transmitted between [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] is broken down into smaller units called chunks, and then reassembled when it reaches its destination.<br /><br /> Values: From 4 to 80.<br /><br /> Default value: 28|  
|ClientServicesCompressionThreshold|Sets the threshold in memory consumption at which [!INCLUDE[nav_web](includes/nav_web_md.md)] starts compressing data sets. This limits amount of consumed memory. The value is in kilobytes.<br /><br /> Default value: 64|  
|ClientServicesProtectionLevel|Specifies the security services used to protect the data stream between the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)]. This value must match the value that is specified in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration file. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).<br /><br /> Values: EncryptAndSign, Sign, None<br /><br /> Default value: EncryptAndSign|  
|Server|Specifies the name of the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)].<br /><br /> Default value: localhost|  
|ServerInstance|Specifies the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to.<br /><br /> For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).<br /><br /> Default value: [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]|  
|ClientServicesCredentialType|Specifies the authorization mechanism that is used to authenticate users who try to connect to the [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md) and [Users and Credential Types](Users-and-Credential-Types.md).<br /><br /> The credential type must match the credential type configured for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to. For information about how to set up the credential type on [!INCLUDE[nav_server](includes/nav_server_md.md)], see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).<br /><br /> Values: Windows, UserName, NavUserPassword, AccessControlService<br /><br /> Default value: Windows|  
|ClientServicesPort|Specifies the TCP port for the [!INCLUDE[nav_server](includes/nav_server_md.md)]. This is part of the [!INCLUDE[nav_server](includes/nav_server_md.md)]’s URL.<br /><br /> Values: 1-65535<br /><br /> Default value: 7046|  
|ServicePrincipalNameRequired|If this parameter is set to **true**, then the [!INCLUDE[nav_web](includes/nav_web_md.md)] can only connect to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that has been associated with a service principal name \(SPN\).<br /><br /> If this parameter is set to **false**, then the [!INCLUDE[nav_web](includes/nav_web_md.md)] attempts to connect to the configured [!INCLUDE[nav_server](includes/nav_server_md.md)] service, regardless of whether that service is associated with an SPN.<br /><br /> For more information about SPNs, see [How to: Configure Delegation for Microsoft Dynamics NAV Web Client](How-to--Configure-Delegation-for-Microsoft-Dynamics-NAV-Web-Client.md).<br /><br /> Default: **false**|  
|SessionTimeout|Specifies the maximum time that a connection between the [!INCLUDE[nav_web](includes/nav_web_md.md)] and the [!INCLUDE[nav_server](includes/nav_server_md.md)] can remain idle before the session is stopped.<br /><br /> In the [!INCLUDE[nav_web](includes/nav_web_md.md)], this setting determines how long an open [!INCLUDE[navnow](includes/navnow_md.md)] page or report can remain inactive before it closes. For example, when the SessionTimeout is set to 20 minutes, if a user does not take any action on a page within 20 minutes, then the page closes and it is replaced with the following message: **The page has expired and the content cannot be displayed.**<br /><br /> The time span has the format \[dd.\]hh:mm:ss\[.ff\]:<br /><br /> -   dd is the number of days<br />-   hh is the number of hours<br />-   mm is the number of minutes<br />-   ss is the number of seconds<br />-   ff  is fractions of a second<br /><br /> Default value: 00:20:00|  
|ShowPageSearch|Specifies whether to show the **Search for Page or Report** icon in the ribbon pane of the Role Center. The **Search for Page or Report** lets users find [!INCLUDE[navnow](includes/navnow_md.md)] objects, such as pages, reports, and codeunits. **Note:**  The **Search for Page or Report** option only finds objects that are available from the Departments page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. <br /><br /> If you do not want to the **Search for Page or Report** icon available in the [!INCLUDE[nav_web](includes/nav_web_md.md)], then set the parameter to **false**.<br /><br /> Default value: **true**|  
|UnknownSpnHint|Specifies whether to use a server principal name when establishing the connection between the [!INCLUDE[nav_web](includes/nav_web_md.md)] server and [!INCLUDE[nav_server](includes/nav_server_md.md)]. This setting is used to authenticate the [!INCLUDE[nav_server](includes/nav_server_md.md)], and it prevents the [!INCLUDE[nav_web](includes/nav_web_md.md)] server from restarting when it connects to [!INCLUDE[nav_server](includes/nav_server_md.md)] for the first time. You set values that are based on the value of the ServicePrincipalNameRequired key.<br /><br /> Value: The value has the following format.<br /><br /> \(net.tcp://NavServer:Port/ServerInstance/Service\)=NoSpn&#124;SPN<br /><br /> -   NavServer is the name of the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)].<br />-   Port is the port number on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] is running.<br />-   ServerInstance is the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br />-   NoSpn&#124;SPN specifies whether to use an SPN. If the ServicePrincipalNameRequired key is set to **false**, then set this value to NoSpn. If the ServicePrincipalNameRequired key is set to **true**, then set this value to Spn.<br /><br /> Default value: \(net.tcp://localhost:7046/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/Service\)=NoSpn<br /><br /> If you set this key to the incorrect value, then during startup, the [!INCLUDE[nav_web](includes/nav_web_md.md)] will automatically determine a correct value. This will cause the [!INCLUDE[nav_web](includes/nav_web_md.md)] to restart. **Note:**  For most installations, you do not have to change this value. Unlike the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], this setting is not updated automatically. If you want to change the default value, then you must change it manually.|  
|DnsIdentity|Specifies the subject name or common name of the service certificate for [!INCLUDE[nav_server](includes/nav_server_md.md)].<br /><br /> This parameter is only relevant when the ClientServicesCredentialType is set to UserName, NavUserPassword, or AccessControlService, which requires that security certificates are used on the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] to protect communication. **Note:**  You can find the subject name by opening the certificate in the Certificates snap-in for Microsoft Management Console \(MMC\) on the computer that is running [!INCLUDE[nav_web](includes/nav_web_md.md)] or [!INCLUDE[nav_server](includes/nav_server_md.md)]. <br /><br /> For more information, see [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md).<br /><br /> Value: The subject name of the certificate.<br /><br /> Default value: none|   
|SigninHelpLink|Specifies the URL to open if the user selects help on the sign in dialog.<br /><br /> Default value: none|  
|HelpServer|Specifies the name of the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server that the [!INCLUDE[nav_web](includes/nav_web_md.md)] must connect to, such as *MyServer*.<br /><br /> Default value: none|  
|HelpServerPort|Specifies the TCP port on the specified [!INCLUDE[navnow](includes/navnow_md.md)] Help Server that the [!INCLUDE[nav_web](includes/nav_web_md.md)] can access Help through, such as **49000**.<br /><br /> Default value: none| 
| Feedback Link  |Specifies the URL to a feedback system for gathering end-user feedback about the application. |
|Community Link	|Specifies the URL to a community or resource for sharing information.|
|Privacy Link	|Specifies the URL to the privacy information for the application. This link also appears in the sign-in page.|
| Legal Link |Specifies the URL to the legal information about application. |
|Sign In Help Link	|This link appears on the sign-in page. It specifies the URL to a resource that provides information to help the user sign in the Dynamics NAV application.| 

## See Also  
[How to: Set Up Multiple Web Server Instances for the Microsoft Dynamics NAV Web Client](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md)   
[How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
[Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)
