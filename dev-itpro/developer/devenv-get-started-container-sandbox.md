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
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

# Get started with the Container Sandbox Development Environment
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] offers a container-based image environment that enables access to both the AL development environment and the C/SIDE development environment. 

## Decide on Azure-hosted or local-hosted environment
When you set up the Container Sandbox, you can choose to host the sandbox on Microsoft Azure or on a local computer. Both environments offer the same capabilites, and use Docker to provide the infrastructure for the container-based apps. The difference is:

-  With Azure hosting, Docker is installed and configured for you. However, Azure hosting requires that you purchase ...
-  Local hosting requires that your computer is running Windows 10 or Windows Server 2016 and you install and configure Docker before setting up the container sandbox.

    To install and configure Docker, choose the version of Docker that is appropriate for the host operating system.

    For Windows 10, download from [Docker Community Edition](https://www.docker.com/community-edition). For more information, see [Install instructions](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10).

    For Windows Server 2016, download from [Docker Enterprise Edition](https://www.docker.com/enterprise-edition). For more information, see [Install instructions](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-server).


## Run the container-based image
Run the following command in a Command Prompt as Administrator to run a Docker image of Dynamics 365 Business Central:

```docker run -e accept_eula=Y -m 4G microsoft/dynamics-nav```

> [!NOTE]  
> When you run the Docker run command, it will start downloading the image if it does not already exist. A container consists of multiple layers, only the needed layers are downloaded.

At this point, you can open your internet browser and type in the Web client URL. You will be prompted with a login dialog, where you can login with the NAV Admin Username/Password displayed.

## The NavContainerHelper module
To support the use of containers, optional PowerShell scripts are available, which support setup of development environments. Use the `NavContainerHelper` to work with containers. On a Windows 10 or Windows Server 2016, start Powershell as an Administrator and type:

```install-module navcontainerhelper -force```

To see which functions are available in the NavContainerHelper module use the following command:

```Write-NavContainerHelperWelcomeText```

To get quickly get started, run the following command from the NavContainerHelper module:

```new-navcontainer -accept_eula -containerName test -imageName microsoft/dynamics-nav:devpreview```

The `NavContainerHelper` will create a folder on the C:\ drive called DEMO and will place all files underneath that folder. The DEMO folder will be shared to the container for transfer of files etc. If you do not specify a username and a password, it will ask for your password and use the current Windows username. If you specify your windows password, the container setup will use Windows Authentication integrated with the host. The `NavContainerHelper` will also create shortcuts on the desktop for the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Web client, a container prompt, and a container PowerShell prompt.

The `navcontainerhelper` module also allows you to add the `-includeCSide` switch in order to add the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Windows client and C/SIDE to the desktop and export all objects to a folder underneath C:\DEMO\Extensions for the object handling functions from the module to work.

## See Also
[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)    
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
