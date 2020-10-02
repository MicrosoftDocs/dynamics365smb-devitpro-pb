---
title: "How to: Set Up Multiple Web Server Instances for the Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Setting Up Multiple [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances Using PowerShell

Although you can use the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] and create a single web server instance in IIS for client connection, there may be scenarios when you want to set up multiple instances. For example, you could set up a separate [!INCLUDE[webserver](../developer/includes/webserver.md)] instance for the different companies of a business. For this scenario, you can use the [!INCLUDE[webserver](../developer/includes/webserver.md)] PowerShell cmdlets, which are outlined in the following table.

|Cmdlet|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|
|[New-NAVWebServerInstance](/powershell/module/navwebclientmanagement/New-NAVWebServerInstance)|Creates a new [!INCLUDE[webserver](../developer/includes/webserver.md)] instance and binds this instance to a [!INCLUDE[server](../developer/includes/server.md)] instance. |
|[Set-NAVWebServerInstanceConfiguration](/powershell/module/navwebclientmanagement/Set-NAVWebServerInstanceConfiguration)|Specifies configuration values for a named [!INCLUDE[webserver](../developer/includes/webserver.md)] instance.|
|[Get-NAVWebServerInstance](/powershell/module/navwebclientmanagement/Get-NAVWebServerInstance)|Gets the information about the [!INCLUDE[webserver](../developer/includes/webserver.md)] instances that are registered on a computer.|
|[Remove-NAVWebServerInstance](/powershell/module/navwebclientmanagement/Remove-NAVWebServerInstance)| Removes an existing [!INCLUDE[webserver](../developer/includes/webserver.md)] instance.|  

## <a name="GetStartedWebServerCmdlets"></a>Get started with the [!INCLUDE[webserver](../developer/includes/webserver.md)] cmdlets 

The [!INCLUDE[webserver](../developer/includes/webserver.md)] cmdlets are contained in the PowerShell script module **NAVWebClientManagement.psm1**, which is available on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD).

The module is installed with the [!INCLUDE[server](../developer/includes/server.md)] or the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].

There are different ways to launch this module and start using the cmdlets:

- If you are working on the computer where the [!INCLUDE[server](../developer/includes/server.md)] was installed, run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.

  For more information, see [Business Central PowerShell Cmdlets](/powershell/business-central/overview).

- If you installed the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], just start Windows PowerShell as an administrator.

- Otherwise, start Windows PowerShell as an administrator, and use the [Import-Module](/powershell/module/microsoft.powershell.core/import-module) cmdlet to import the **NAVWebClientManagement.psm1** file:

  ```
  Import-Module -Name [filepath]
  ```  
  For example:
  ```
  Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
  ```

    For more information about starting Windows PowerShell, see [Starting Windows PowerShell](/powershell/scripting/setup/starting-windows-powershell).

## Creating [!INCLUDE[webserver](../developer/includes/webserver.md)] instances

### Get Access to the WebPublish folder
To create a new web server instance, you need access to the **WebPublish** folder that contains the content files for the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].

- This folder is available on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD) and has the path "DVD\WebClient\Microsoft Dynamics NAV\13x\Web Client\WebPublish". 

- If you installed the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], this folder has the path "[!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\Web Client\WebPublish".

You can use either of these locations or you can copy the folder to more convenient location on your computer or network.


### <a name="WebClientonIIS"></a>Decide on the site deployment type for the instance
When you create a new [!INCLUDE[webserver](../developer/includes/webserver.md)] instance, you can choose to create either a RootSite or SubSite type. Each instance type has a different hierarchical structure in IIS, which influences its configuration and the URLs for the accessing from the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].
 
**RootSite**

A *RootSite* instance is a root-level web site that is complete with content files for serving the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. It is configured with its own set of bindings for accessing the site, such as protocol (http or https) and communication port. The structure in IIS looks like this:

```
- Sites
  - BusunessCentralWebSite (web site)
    + nn-NN (language versions)
    + www (content)
    navsettings.json
    ...
```

The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] URL for the RootSite instance has the format:

`https://[WebserverComputerName]:[port]`

For example: `https://localhost:8080`. 

**SubSite**

A *SubSite* instance is a web application that is under a container web site. The container web site is configured with a set of bindings, but the site itself has no content files. The content files are contained in the application (SubSite). The SubSite inherits the bindings from the container web site. This is the deployment type that is created when you install [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] in the Setup wizard. Using the New-NAVWebServerInstance cmdlet, you can add multiple SubSite instances in the container web site. The structure in IIS for two instances looks like this in IIS:

```
- Sites
  - BusunessCentralWebSite (web site)
    - BusinessCentralWebInstance1 (application)
      + nn-NN (language versions)
      + www 
      navsettings.json
      ...
    - BusinessCentralWebInstance2 (application)
      + nn-NN (language versions)
      + www
      navsettings.json
      ...
```

The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] URL of a SubSite instance is generally longer than a RootSite because it also contains the application's alias (or virtual path) for the instance, which you define. The URL for a SubSite instance has the format:

`https://[WebserverComputerName]:[port]/[WebServerInstance]`

For example: `https://localhost:8080/BusinessCentralWebInstance1` and `https://localhost:8080/BusinessCentralWebInstance2`. 

### Run the New-NAVWebServerInstance cmdlet

At the command prompt, run the New-NAVWebServerInstance cmdlet. The following are simple examples for creating a RootSite and SubSite deployment type.

RootSite example:

    ```  
    New-NAVWebServerInstance -WebServerInstance MyBCWebsite -Server MyBCServer -ServerInstance MyBCServerInstance -SiteDeploymentType RootSite -WebSitePort 8081 -PublishFolder "C:\Web Client\WebPublish"
    ```  
SubSite example:

    ```  
    New-NAVWebServerInstance -WebServerInstance MyWebApp -Server MyBCServer -ServerInstance MyBCServerInstance -SiteDeploymentType Subsite -ContainerSiteName MySiteContainer -WebSitePort 8081 -PublishFolder "C:\WebClient\WebPublish"
    ```  

-  Susbtitute *MyBCWebsite* with the name that you want to give the web application in IIS for the web server instance. If you are creating a SubSite deployment type, this name will become part of the URL for opening the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] application, for example, https://MyWebServer:8081/MyWebApp.  
  
- Susbtitute *MyBCServer* to the name of the computer that is running the [!INCLUDE[server](../developer/includes/server.md)] to which you want to connect.  
  
-   Susbtitute *MyBCServerInstance* with the name of the [!INCLUDE[server](../developer/includes/server.md)] instance to use.

-  Substitute *MySiteContainer* with name of the container web site under which you want to add the instance. If you specify a name that does not exist, then a new container web site will be created, which contains the new web server instance.

-  Susbtitute *8081* with the port number that you want to bind the instance to. If you do not specify a port number, then port 80 is used. 
    
-  Substitute *C:\WebClient\WebPublish* with the path to your WebPublish folder. By default, the cmdlet looks in the'[!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\Web Client' folder. So if you are working on a computer where the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] are installed, you do not have to set this parameter.

> [!NOTE]  
>  This command only sets the required parameters of the NAVWebServerInstance cmdlet. The cmdlet has several other parameters that can use to configure the web server instance. For more information about the syntax and parameters, see [New-NAVWebServerInstance](/powershell/module/navwebclientmanagement/New-NAVWebServerInstance).  

## Modifying a [!INCLUDE[webserver](../developer/includes/webserver.md)] instance
 
After you create the web server instance, if you want to change its configuration, you can use the Set-NAVWebServerInstanceConfiguration cmdlet. Or, you can modify the configuration file (navsettings.json) of the instance directly. For more information, see [Configuring Web Server Instances](../administration/configure-web-server.md).  

## See Also  
[Business Central Web Server Overview](../deployment/web-server-overview.md)     
[Configuring Web Server Instances](../administration/configure-web-server.md)