---
title: "Client Option"
description: "Describing the different client options"
author: SusanneWindfeldPedersen
ms.date: 10/01/2018
ms.topic: article
ms.assetid: dca2ad0b-d384-479b-8437-cb6de6bd5a10
caps.latest.revision: 2
---
# Client Option
The Client option is available on the **Choose an installation option** page in Microsoft Dynamics NAV Setup.

### Installed Components

When you choose the Client option, Microsoft Dynamics NAV Setup installs the following components:

* Microsoft Dynamics NAV Windows client

  For more information, see [Client Types](Client-Types.md).

* Microsoft Office Excel Add-In

With the Microsoft Office Excel Add-In, you can update the data in your Excel document with fresh data from Microsoft Dynamics NAV. However, if your company configures Microsoft Dynamics NAV to integrate with Office 365, documents will open in the installed version of Excel and not in the Excel Web App.

The Microsoft Dynamics NAV Windows client constitutes tier one in the Microsoft Dynamics NAV three-tier [Product and Architecture Overview](Product-and-Architecture-Overview.md). Microsoft Dynamics NAV Server is tier two, and SQL Server Database Components, together with SQL Server or SQL Server Express, is tier three.

You can configure the Client option to add or remove components by choosing **Customize** under the Client option on the **Choose an installation** option pane. You can configure the Client option to add or remove components on the **Customize the installation** page.
Additional components available under the Client option include the Microsoft Dynamics NAV Development Environment, and the Microsoft Office Outlook Add-In.

You must provide some initial configuration information to enable the Microsoft Dynamics NAV Windows client to establish a connection with an instance of Microsoft Dynamics NAV Server.

### Configuring the Microsoft Dynamics NAV Windows client in Setup

When you choose the Client option, the **Specify parameters** pane is displayed in Setup. You must specify certain parameters in order to install the Microsoft Dynamics NAV Windows client so that the client can connect to the relevant Microsoft Dynamics NAV Server instance. Each parameter is described in the Setup window. The following list provides a high-level description of the required parameters.



Section/Parameter  |Description  
---------|---------
Installation location for 32-bit components     |Specifies the folder destination for Microsoft Dynamics NAV Windows client files.         
Microsoft Dynamics NAV Server server name, service instance name, and the listening TCP port or the computer running Microsoft Dynamics NAV Server for this client.     | If you are not sure which Microsoft Dynamics NAV Server computer to specify, enter a temporary value, such as **TBD**, so you can complete Setup. Then edit the Microsoft Dynamics NAV Windows client configuration file later to identify the actual server. You will not be able to run the Microsoft Dynamics NAV Windows client without a valid Microsoft Dynamics NAV Server connection.<br/>If you specify a server name, instance name or server port in Setup that is not valid, then the Microsoft Dynamics NAV Windows client cannot connect to Microsoft Dynamics NAV Server. You will receive the following message when you attempt to open the Microsoft Dynamics NAV Windows client:<br/>**The program could not create a connection to the server. Do you want to try again?**<br/>If you choose **No**, then the **Select Server** window opens. Correct the port number by typing a string in this format in the **Server Name** field:<br/>If your deployment uses a multitenant architecture, the string must identify the tenant database that the client connects to. The format changes to the following: `servername:port/ServerInstance/tenant`        
Add rule to Firewall     |Specifies whether Microsoft Dynamics NAV Setup adds a rule to Windows Firewall to allow the Microsoft Dynamics NAV Windows client to communicate with a Microsoft Dynamics NAV Server instance on another computer, through the specified **Server Port**.<br/>The default value is **Yes** for the Client or Server installation options, where the assumption is that Microsoft Dynamics NAV Server is installed on a different computer from the client, and **No** for the Demo and Developer options, where the assumption is that Microsoft Dynamics NAV Server is installed on the same computer as the client.<br/>If the target computer uses a firewall other than Windows Firewall, or if networking is not configured on the target computer, then this option must be set to No or Setup will not be able to complete successfully.         
Credential Type     |Microsoft Dynamics NAV supports different credential authorization mechanisms for users. When you create a user, you provide different information depending on the credential type that you are using in the current Microsoft Dynamics NAV Server instance. The credential type that is configured for a user must match the credential type that is configured for the Microsoft Dynamics NAV Server instance that the user connects to. For more information, see [Users and Credential Types](Users-and-Credential-Types.md).         
Help Server and Help Server port     |Specifies the name and port of the server that hosts the Microsoft Dynamics NAV Help Server.<br/>This can be a public website or a local computer.<br/>For more information, see [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md).         

Choose **Apply** when you have finished entering values on the **Specify parameters** page in Setup. If you want to change the configuration after installation, you can modify the ClientUserSettings.config file for each client. For more information, see [Configuring the Windows Client](Configuring-the-Windows-Client.md).

### See Also
[How to: Choose Components to Install](How-to--Choose-Components-to-Install.md)  
[Installation Options](Installation-Options.md)  
[Working with Microsoft Dynamics NAV Setup](Working-with-Microsoft-Dynamics-NAV-Setup.md)  
[Configuring the Windows Client](Configuring-the-Windows-Client.md)  
[Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)  
[Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)  
[Users and Credential Types](Users-and-Credential-Types.md)  
[Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)  

