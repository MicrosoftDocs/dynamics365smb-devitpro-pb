---
title: "Get started with the Container Sandbox Development Environment"
description: "Overview of the getting started with the container-based development."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

# Get started with the Container Sandbox Development Environment
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] offers a container-based image environment that enables access to both the AL development environment and the C/SIDE development environment. 

You set up a container sandbox by running the **SANDBOX ENVIRONMENT (CONTAINER)** page from [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. You will have to decide whether you want an Azure-hosted or locally hosted container sandbox. See the next section for details.

> [!TIP]
> [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] also offers an online sandbox. For more information, see [Choosing Your Dynamics 365 Business Central Development Sandbox Environment](devenv-sandbox-overview.md).

## <a name="AzureVsLocal"></a>Choosing an Azure-hosted or local-hosted container sandbox
When you set up the container sandbox, you can choose to host the sandbox on Microsoft Azure or on a local computer. Both environments offer the same capabilites and use Docker to provide the infrastructure for the container-based applicationn. The difference is:

-  With Azure hosting, Docker is installed and configured for you. However, Azure hosting requires that you sign-up for an Azure subscription, and additional costs may be incurred for each container sandbox. 
-  Local hosting requires that your computer is running Windows 10 or Windows Server 2016, and you install and configure Docker before setting up the container sandbox.

## Set up an Azure-hosted container sandbox
1. If you you do not already have one, sign up for an Azure subscription.

    To get a free subscription and read more information, see [https://azure.microsoft.com](https://azure.microsoft.com).

2. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], choose the ![Search for Page or Report](media/search-icon.png "Search for Page or Report icon") icon, enter **SANDBOX ENVIRONMENT (CONTAINER)**, and then select the relevant link.
3. Choose **Host in Azure**. If prompted, enter the user name amd password of your Azure subscription. 

    The Azure portal opens to display a custom deployment form. 
4. Fill out the required fields on the fom, and then select **Purchase**.


## Set up a local-hosted container sandbox

1. If not already done, install Docker.

    To install and configure Docker, choose the version of Docker that is appropriate for the host operating system:

    -   For Windows 10, download from [Docker Community Edition for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows).

    -   For Windows Server 2016, download from [Docker Enterprise Edition](https://www.docker.com/enterprise-edition).

2. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], choose the ![Search for Page or Report](media/search-icon.png "Search for Page or Report icon") icon, enter **SANDBOX ENVIRONMENT (CONTAINER)**, and then select the relevant link.
3. Choose **Host Locally**.
4. Save the **CreateBCSandbox.ps1** file to your computer.
5. Run Windows PowerShell ISE as an administrator.
6. Open the **CreateBCSandbox.ps1** file.
7. Set the `$containername = ''` variable to the name that you want to give the container, for example `$containername = 'MyBizCentralApp'`.

    This name is only used internally in your envirorment for identification purposes.
8. Press F5 to run the script.

    The console pane displays the progress of the script. When the script has completed successfully, information like the following will display:
    ```
    ...
    Container IP Address: 172.22.147.63
    Container Hostname  : MyBizCentralApp
    Container Dns Name  : MyBizCentralApp
    Web Client          : http://MyBizCentralApp/NAV/
    Dev. Server         : http://MyBizCentralApp
    Dev. ServerInstance : NAV

    Files:
    http://MyBizCentralApp:8080/al-0.15.18566.vsix

    Initialization took 116 seconds
    Ready for connections!
    Reading CustomSettings.config from MyBizCentralApp
    Creating Desktop Shortcuts for MyBizCentralApp
    ```

9. Write down or copy the following parameter/values from the console: `Dev. Server`,  `Dev. ServerInstance`, and `Files`. You will need this information later to [set up Visual Studio Code for for extension development](#VSCode).

You now have a container sandbox set up on your computer. The following shortcuts have been added to your desktop:

-   **\<Container name\> Windows Client** - opens the Windows client for your application in the container.
-    **\<Container name\> Web Client** - opens the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] for the your application in the container.
-    **\<Container name\> CSIDE** - opens the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)] for developing your application using CSIDE.
-    **\<Container name\> PowerShell Prompt** - opens a Windows PowerShell prompt in the container. This gives you access to the [!INCLUDE[navnowg_md](includes/navnow_md.md)] (https://docs.microsoft.com/en-us/powershell/dynamics-nav/overview), which you can run against the container sandbox environment. 
-    **\<Container name\>Command Prompt**  - opens a Windows command prompt in the container.


For more information about working with a container sandbox, see [Running a Container-Based Development Environment](devenv-running-container-development.md).

### <a name="VSCode"></a>Set up Visual Studio Code
After the container sandbox is set up, you must set up Visual Studio Code for extension development. To do this, you need the values for `Dev. Server`,  `Dev. ServerInstance`, and `Files` parameters that you retrieved from the Windows PowerShell ISE console when you ran the **CreateBCSandbox.ps1** script. 

1. Open a browser to the path that is specified by the `Files` parameter, and save the .vsix file to your computer.
2. In Visual Studio Code, go to **Extensions**, and then choose **Install from VSIX**.
    You now have the AL Language extension enabled.
3. In Visual Studio Code, press Ctrl+Shift+P and then choose **AL Go!**.
4. Choose where to create the project, and then choose the **Your own server** option.
5. Open the generated `launch.json` file, update the `"server"` setting with the value of the `Dev. Server` parameter and the `"serverInstance"` setting with the value of the `Dev. ServerInstance` to reflect the container you just created. For example:

    ```
    "server": "http://MyBizCentralApp",
    "serverInstance": "NAV",
    ```
6. Save the launch.json file.

You have now set up Visual Studio Code with the AL Language extension.


<!-- 
Creating container MyBCapp2 from image navinsider.azurecr.io/dynamics-nav:11.0.21063.0-finus
Waiting for container MyBCapp2 to be ready
Initializing...
Starting Container
Hostname is MyBCapp2
PublicDnsName is MyBCapp2
Using Windows Authentication
Starting Local SQL Server
Starting Internet Information Server
Modifying NAV Service Tier Config File with Instance Specific Settings
Starting NAV Service Tier
Creating DotNetCore NAV Web Server Instance
Enabling Financials User Experience
Creating http download site
Creating Windows user jswymer
Setting SA Password and enabling SA
Creating NAV user
Container IP Address: 172.22.147.63
Container Hostname  : MyBCapp2
Container Dns Name  : MyBCapp2
Web Client          : http://MyBCapp2/NAV/
Dev. Server         : http://MyBCapp2
Dev. ServerInstance : NAV

Files:
http://MyBCapp2:8080/al-0.15.18566.vsix

Initialization took 116 seconds
Ready for connections!
Reading CustomSettings.config from MyBCapp2
Creating Desktop Shortcuts for MyBCapp2
-->


## See Also
[Running a Container-Based Development Environment](devenv-running-container-development.md)  
[Troubleshooting the Container Sandbox](https://blogs.msdn.microsoft.com/freddyk/2017/10/29/troubleshooting-nav-on-docker/)  
[Choosing Your Dynamics 365 Business Central Development Sandbox Environment](devenv-sandbox-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
