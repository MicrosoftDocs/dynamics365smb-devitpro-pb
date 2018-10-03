---
title: "Running a Container-Based Development Environment"
description: "Overview of the running container-based development."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---


# Running a Container-Based Development Environment
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] is available as a container-based image, ready for running on a Windows system with Docker installed. The container-based approach is used when you need access to both the AL development environment and the C/SIDE development environment.

## Install and configure Docker
Install Docker and configure it for Windows Containers. Please choose the version of Docker that is appropriate for the host operating system.
- Use [Docker Community Edition](https://www.docker.com/community-edition) if the host operating system is Windows 10.  
    For more information, see [Install instructions](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10).
- Use [Docker Enterprise Edition](https://www.docker.com/enterprise-edition) if the host operating system is Windows Server.  
    For more information, see [Install instructions](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-server).


## Run the container-based image
Run the following command in a Command Prompt as Administrator to run a Docker image of Dynamics 365 Business Central:

```docker run -e accept_eula=Y -m 4G microsoft/dynamics-nav```

> [!NOTE]  
> When you run the Docker run command, it will start downloading the image if it does not already exist. A container consists of multiple layers, only the needed layers are downloaded.

After starting the `docker run` command above, you will see log entries similar to the following:

```
Initializing...
Starting Container
Hostname is cdc633cdb0a2
...
Container IP Address: 172.20.203.209
Container Hostname  : cdc633cdb0a2
Container Dns Name  : cdc633cdb0a2
Web Client          : https://cdc633cdb0a2/NAV/WebClient/
NAV Admin Username  : admin
NAV Admin Password  : Biba4071

Files:
http://cdc633cdb0a2:8080/certificate.cer

Initialization took 83 seconds
Ready for connections!
```

At this point, you can open your internet browser and type in the Web client URL from the log. You will be prompted with a login dialog, where you can login with the NAV Admin Username/Password displayed.

> [!NOTE]  
> The container image uses a so called self-signed certificate for https communication. Because of that, your browser might warn you that the page you are requesting is unsafe. In those specific circumstances and only for test and dev environments, it is safe to ignore this warning. If you want to solve this warning, you can install the certificate on your PC (see the link under "Files" in the log entries).

## The NavContainerHelper module
To support the use of containers, optional PowerShell scripts are available, which support setup of development environments. Use the `NavContainerHelper` to work with containers. On a Windows 10 or Windows Server 2016, start Powershell as an Administrator and type:

```install-module navcontainerhelper -force```

To see which functions are available in the NavContainerHelper module use the following command:

```Write-NavContainerHelperWelcomeText```

To get quickly get started, run the following command from the NavContainerHelper module:

```new-navcontainer -accept_eula -containerName test -imageName microsoft/bcsandbox```

The `NavContainerHelper` will create a folder on the C:\ drive called DEMO and will place all files underneath that folder. The DEMO folder will be shared to the container for transfer of files etc. If you do not specify a username and a password, it will ask for your password and use the current Windows username. If you specify your windows password, the container setup will use Windows Authentication integrated with the host. The `NavContainerHelper` will also create shortcuts on the desktop for the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Web client, a container prompt, and a container PowerShell prompt.

The `navcontainerhelper` module also allows you to add the `-includeCSide` switch in order to add the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Windows client and C/SIDE to the desktop and export all objects to a folder underneath C:\DEMO\Extensions for the object handling functions from the module to work.

## See Also
[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)    
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
