---
title: "How to: Set Up Multiple Web Server Instances for the Microsoft Dynamics NAV Web Client"
ms.custom: na
ms.date: 21/09/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Creating and Managing [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] Instances Using PowerShell

**Applies to:** [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. [See [!INCLUDE[nav2017](includes/nav2017.md)] version](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client-2017.md).

Although you can use the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and create a single web server instance in IIS for the [!INCLUDE[nav_web](includes/nav_web_md.md)], there may be scenarios when you want to set up multiple instances. For example, you could set up a separate [!INCLUDE[nav_web](includes/nav_web_md.md)] instance for the different companies of a business. For this scenario, you can use the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] PowerShell cmdlets, which are outlined in the following table.

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|
|[New-NAVWebServerInstance](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/new-navwebserverinstance)|Creates a new [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance and binds this instance to a Dynamics NAV Server instance. |
|[Set-NAVWebServerInstanceConfiguration](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/Set-NAVWebServerInstanceConfiguration)|Specifies configuration values for a named [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance.|
|[Get-NAVWebServerInstance](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/Get-NAVWebServerInstance)|Gets the information about the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances that are registered on a computer.|
|[Remove-NAVWebServerInstance](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/Remove-NAVWebServerInstance)| Removes an existing [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance.|  

## <a name="GetStartedWebServerCmdlets"></a>Get started with the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] cmdlets 

The [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] cmdlets are contained in the PowerShell script module **NAVWebClientManagement.psm1**, which is available on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media (DVD).

The module is installed with the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] or the [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)].

There are different ways to launch this module and start using the cmdlets:

- If you are working on the computer where the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] was installed, run the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)] as an administrator.

  For more information, see [Starting a [!INCLUDE[nav_shell](includes/nav_shell_md.md)] Session](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md#StartAdminShell)

- If you installed the [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)], just start Windows PowerShell as an administrator.

- Otherwise, start Windows PowerShell as an administrator, and use the [Import-Module](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/import-module) cmdlet to import the **NAVWebClientManagement.psm1** file:

  ```
  Import-Module -Name [filepath]
  ```  
  For example:
  ```
  Import-Module -Name "C:\Program Files\Microsoft Dynamics NAV\110\Service\NAVWebClientManagement.psm1"
  ```

    For more information about starting Windows PowerShell, see [Starting Windows PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/setup/starting-windows-powershell).

## Creating [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances

### Get Access to the WebPublish folder
To create a new web server instance, you need access to the **WebPublish** folder that contains the content files for the [!INCLUDE[nav_web_md](includes/nav_web_md.md)].

- This folder is available on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media (DVD) and has the path "DVD\WebClient\Microsoft Dynamics NAV\110\Web Client\WebPublish". 

- If you installed the [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)], this folder has the path "[!INCLUDE[navnow_install_md](includes/navnow_install_md.md)]\Web Client\WebPublish".

You can use either of these locations or you can copy the folder to more convenient location on your computer or network.


### <a name="WebClientonIIS"></a>Decide on the site deployment type for the instance
When you create a new [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance, you can choose to create either a RootSite or SubSite type. Each instance type has a different hierarchical structure in IIS, which influences its configuration and the URLs for the accessing the [!INCLUDE[nav_web](includes/nav_web_md.md)].
 
**RootSite**

A *RootSite* instance is a root-level web site that is complete with content files for serving the [!INCLUDE[nav_web](includes/nav_web_md.md)]. It is configured with its own set of bindings for accessing the site, such as protocol (http or https) and communication port. The structure in IIS looks like this:

```
- Sites
  - DynamicsNAVWebInstance (web site)
    + nn-NN (language versions)
    + www (content)
    navsettings.json
    ...
```
The [!INCLUDE[nav_web](includes/nav_web_md.md)] URL for the RootSite instance has the format:

`http://[WebserverComputerName]:[port]`

For example: `http://localhost:8080`. 

**SubSite**

A *SubSite* instance is a web application that is under a container web site. The container web site is configured with a set of bindings, but the site itself has no content files. The content files are contained in the application (SubSite). The SubSite inherits the bindings from the container web site. This is the deployment type that is created when you install [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)] in the Setup wizard. Using the New-NAVWebServerInstance cmdlet, you can add multiple SubSite instances in the container web site. The structure in IIS for two instances looks like this in IIS:

```
- Sites
  - DynamicsNAVWebSite (web site)
    - DynamicsNAVWebInstance1 (application)
      + nn-NN (language versions)
      + www 
      navsettings.json
      ...
    - DynamicsNAVWebInstance2 (application)
      + nn-NN (language versions)
      + www
      navsettings.json
      ...
```

The [!INCLUDE[nav_web](includes/nav_web_md.md)] URL of a SubSite instance is generally longer than a RootSite because it also contains the application's alias (or virtual path) for the instance, which you define. The URL for a SubSite instance has the format:

`http://[WebserverComputerName]:[port]/[WebServerInstance]`

For example: `http://localhost:8080/DynamicsNAVWebInstance1` and `http://localhost:8080/DynamicsNAVWebInstance2`. 

### Run the New-NAVWebServerInstance cmdlet

At the command prompt, run the New-NAVWebServerInstance cmdlet. The following are simple examples for creating a RootSite and SubSite deployment type.

RootSite example:

    ```  
    New-NAVWebServerInstance -WebServerInstance MyNavWebClient -Server NAVServer -ServerInstance NAVServerInstance -SiteDeploymentType RootSite -WebSitePort 8081 -PublishFolder "C:\Web Client\WebPublish"
    ```  
SubSite example:

    ```  
    New-NAVWebServerInstance -WebServerInstance MyWebApp -Server NAVServer -ServerInstance NAVServerInstance -SiteDeploymentType Subsite -ContainerName MySiteContainer -Port 8081 -PublisherFolder "C:\WebClient\WebPublish"
    ```  

-  Susbtitute *MyWebClient* with the name that you want to give the web application in IIS for the web server instance. If you are creating a SubSite deployment type, this name will become part of the URL for opening the [!INCLUDE[nav_web](includes/nav_web_md.md)] application, for example, http://MyWebServer:8081/MyWebApp.  
  
- Susbtitute *NAVServer* to the name of the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)] to which you want to connect.  
  
-   Susbtitute *NAVServerInstance* with the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to use.

-  Substitute *MySiteContainer* with name of the container web site under which you want to add the instance. If you specify a name that does not exist, then a new container web site will be created, which contains the new web server instance.

-  Susbtitute *8081* with the port number that you want to bind the instance to. If you do not specify a port number, then port 80 is used. 
    
-  Substitute *C:\WebClient\WebPublish* with the path to your WebPublish folder. By default, the cmdlet looks in the'[!INCLUDE[navnow_install_md](includes/navnow_install_md.md)]\Web Client' folder. So if you are working on a computer where the [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)] are installed, you do not have to set this parameter.

> [!NOTE]  
>  This command only sets the required parameters of the NAVWebServerInstance cmdlet. The cmdlet has several other parameters that can use to configure the web server instance. For more information about the syntax and parameters, see [New-NAVWebServerInstance](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/New-NAVWebServerInstance).  

## Modifying a [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance  
After you create the web server intance, if you want to change its configuration, you can use the Set-NAVWebServerInstanceConfiguration cmdlet. Or, you can modify the configuration file (navsettings.json) of the instance directly. For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).  

## See Also  
[Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
[How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
[Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md)