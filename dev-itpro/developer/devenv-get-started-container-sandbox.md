---
title: Get started with the container sandbox development environment
description: Overview of the getting started with the container-based development.
author: SusanneWindfeldPedersen
ms.date: 10/08/2024
ms.topic: conceptual
ms.author: jswymer
ms.collection: get-started
ms.reviewer: solsen
---

# Get started with the container sandbox development environment

[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] offers a container-based image environment that enables access to the AL development environment. In the following sections, you can read about the local-hosted container sandbox.

> [!TIP]
> [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] also offers an online sandbox. For more information, see [Sandbox Environments for Dynamics 365 Business Central Development](devenv-sandbox-overview.md).

## Set up a local-hosted container sandbox

Local hosting requires that your computer is running Windows Desktop, Windows Server 2016, or Windows Server 2019, and you install and configure Docker before setting up the container sandbox.

### Prerequisite: install Docker

If not already done, install Docker.

To install and configure Docker, choose the version of Docker that is appropriate for the host operating system:

- For Windows Desktop, use [Docker Desktop on Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows). For more information, see [Install instructions](/virtualization/windowscontainers/quick-start/quick-start-windows-10).
- For Windows Server, use [Docker Enterprise Edition](https://hub.docker.com/editions/enterprise/docker-ee-server-windows). For more information, see [Install instructions](/virtualization/windowscontainers/quick-start/quick-start-windows-server).

### Set up a Docker container sandbox using BCContainerHelper

To set up a Docker container sandbox using an existing sandbox environment, see [Running a Container-Based Development Environment](devenv-running-container-development.md).

### <a name="VSCode"></a>Set up Visual Studio Code

After the container sandbox is set up, you must set up Visual Studio Code for extension development. To do this, you need the values for `Dev. Server`,  `Dev. ServerInstance`, and `Files` parameters that you retrieved from the Windows PowerShell ISE console when you ran the **CreateBCSandbox.ps1** script. 

1. In Visual Studio Code, go to **Extensions**, and install the AL Language extension from the Marketplace.
    You now have the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] enabled.
2. In Visual Studio Code, select <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and then choose **AL Go!**.
3. Choose where to create the project, and then choose the **Your own server** option.
4. Open the generated `launch.json` file, update the `"server"` setting with the value of the `Dev. Server` parameter and the `"serverInstance"` setting with the value of the `Dev. ServerInstance` to reflect the container you created. For example:

    ```
    "server": "http://mybc",
    "serverInstance": "BC",
    "authentication": "Windows",
    ```
5. Save the launch.json file.

You have now set up Visual Studio Code with the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)].


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
Web Client          : https://MyBCapp2/NAV/
Dev. Server         : https://MyBCapp2
Dev. ServerInstance : NAV

Files:
https://MyBCapp2:8080/al-0.15.18566.vsix

Initialization took 116 seconds
Ready for connections!
Reading CustomSettings.config from MyBCapp2
Creating Desktop Shortcuts for MyBCapp2
-->


## Related information

[Running a container-based development environment](devenv-running-container-development.md)  
[Working with sandboxes and entitlements](devenv-work-sandbox-entitlements.md)  
[Sandbox environments for Dynamics 365 Business Central development](devenv-sandbox-overview.md)  
[AL development environment](devenv-reference-overview.md)  
