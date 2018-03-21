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



## Steps to set up a container sandbox environment
1. Sign up for a [Dynamics 365 Business Central tenant](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%3FredirectedFromSignup%3D1).
2. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], and in the **Search** field, enter **SANDBOX ENVIRONMENT (CONTAINER)** and then select the relevant link.
3. Read the page, and then choose **Host in Azure** or **Host Locally**.

    For more information, see [Decide on Azure-hosted or local-hosted environment](#AzureVsLocal).
4. If you chose **Host in Azure**, the Azure portal opens 
5. If you chose **Host Locally**, save the **CreateBCSandbox.ps1** file to your computer.
6. Open **CreateBCSandbox.ps1** file in Windows PowerShell ISE.
7. 
Note: You need to replace the path of the license file with the location of your partner license.
The script will create a container, which is running Windows Authentication with your docker host. The container name is old and you will have a set of shortcuts on the desktop for launching Web Client, CSIDE, Windows Client etc.
When starting the container of a given version the first time, new-navcontainer will export all objects of the base app in order to be able to create deltas. This will take some time, but is needed later in the process.

## <a name="AzureVsLocal"></a>Decide on Azure-hosted or local-hosted environment
When you set up the Container Sandbox, you can choose to host the sandbox on Microsoft Azure or on a local computer. Both environments offer the same capabilites, and use Docker to provide the infrastructure for the container-based apps. The difference is:

-  With Azure hosting, Docker is installed and configured for you. However, Azure hosting requires that you purchase ...
-  Local hosting requires that your computer is running Windows 10 or Windows Server 2016 and you install and configure Docker before setting up the container sandbox.

    To install and configure Docker, choose the version of Docker that is appropriate for the host operating system.

    For Windows 10, download from [Docker Community Edition](https://www.docker.com/community-edition). For more information, see [Install instructions](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10).

    For Windows Server 2016, download from [Docker Enterprise Edition](https://www.docker.com/enterprise-edition). For more information, see [Install instructions](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-server).

## Setting up a local-hosted container sandbox

1. If not already done, install Docker.

    To install and configure Docker, choose the version of Docker that is appropriate for the host operating system:

    -   For Windows 10, download from [Docker Community Edition for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows).

    -   For Windows Server 2016, download from [Docker Enterprise Edition](https://www.docker.com/enterprise-edition).

2. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], choose the ![Search for Page or Report](media/search-icon.png "Search for Page or Report icon") icon, enter enter **SANDBOX ENVIRONMENT (CONTAINER)** and then select the relevant link.
3. Choose **Host Locally**.
4. Save the **CreateBCSandbox.ps1** file to your computer.
5. Run Windows PowerShell ISE as an administrator.
6. Open the **CreateBCSandbox.ps1** file.
7. Set the `$containername = ''` variable to the name that you want to give the container, for example `$containername = 'MyBizCentralApp'`.

    This name is only used internally in your envirorment for identification purposes.
8. Press F5 to run the script.

The console pane will display the progress of the script. Whne the script has completed successfully, it will display information similar to the following:

```
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

In particular, you should make note the following parameters, because they will be useful when working in the container sandbox:

|  Parameter  |  Description  |
|-------------|---------------|
|Dev. Server|This specifies the |
|Dev. ServerInstance|This specifies the  |
|Files||
|||




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
[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)    
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
