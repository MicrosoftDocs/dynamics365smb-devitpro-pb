---
title: Running a container-based development environment"
description: Overview of how to run a container-based development.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/04/2023
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
---

# Running a container-based development environment

[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] is available as artifacts for running on Docker on a Windows system with Docker installed.

## Install and configure Docker

Install Docker and configure it for Windows Containers.

1. Choose the version of Docker that is appropriate for the host operating system.

    - For Windows Desktop, use [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) - (option to qualify for free SKU - license may be required).
    - For Windows Server, use [Mirantis Container Runtime](https://docs.mirantis.com/mcr/23.0/overview.html) - (option to qualify for free SKU - license may be required).
    - An alternative is to use Docker Engine, which is open source and community-driven. For more information, see [Docker and Business Central](https://freddysblog.com/2021/10/30/docker-and-business-central/).
        
2. For Windows Desktop, switch Docker to use Windows containers. By default Docker uses Linux containers.

    To switch to Windows containers, in the Taskbar, right-click the Docker icon ![Docker](media/docker-icon.png "Docker icon"), and then select **Switch to Windows Containers**. For more information, see [Switch between Windows and Linux containers](https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers).

> [!NOTE]
> You can run [!INCLUDE [prod_short](includes/prod_short.md)] on Docker using Docker commands, or you can use the BCContainerHelper PowerShell module. The BCContainerHelper module removes a lot of the complexity of running Docker.

## Set up Business Central using the BCContainerHelper PowerShell module

To support the use of containers, optional PowerShell scripts are available, which support setup of development environments. Use the `BCContainerHelper` to work with containers. On a Windows Desktop, Windows Server 2016 or Windows server 2019 machine, **start PowerShell as an Administrator** and type:

```install-module BCContainerHelper -force```

To see which functions are available in the BCContainerHelper module use the following command:

```Write-BCContainerHelperWelcomeText```

To get started quickly, run the following command from the BCContainerHelper module:

```
$artifactUrl = Get-BcArtifactUrl -type sandbox -country us -select Latest
New-BCContainer -accept_eula -containerName mysandbox -artifactUrl $artifactUrl
```

> [!NOTE]  
> If you want to try out the Insider builds of Business Central, you can access these by specifying `NextMajor` or `NextMinor` to the select parameter on `Get-BcArtifactUrl`. You also need to add `-accept_insiderEula` in order to get Insider builds.

The `BCContainerHelper` creates a folder on the C:\ drive called *bcartifacts.cache* for caching artifacts. It also creates a folder under C:\ProgramData called BCContainerHelper and places all working files underneath that folder. The C:\ProgramData\BCContainerHelper folder is shared to the container for transfer of files etc. If you don't specify a username and a password, it asks for your password and uses the current Windows username. If you specify your windows password, the container setup uses Windows Authentication integrated with the host. The `BCContainerHelper` also creates shortcuts on the desktop for the [!INCLUDE [prod_short](includes/prod_short.md)] web client, a container prompt, and a container PowerShell prompt.

### Issues setting up Business Central containers?

If you encounter issues setting up Business Central containers, there are a few things you can try before creating an issue on GitHub.

1. Make sure you are running the latest version of [Docker](https://www.docker.com/products/docker-desktop/) and the latest version of the [BcContainerHelper module](https://www.powershellgallery.com/packages/BcContainerHelper).
2. If the container fails during creation?
   - Check that you have enough memory (Business Central containers will use at least 6GB) and enough disk space (artifacts and container images uses ~15GB)
   - You can try to add `-isolation hyperv` to your `New-BcContainer` command to see whether Hyper-V isolation will solve the problem.
3. If the container is created, but you can't navigate to the container in a browser?
   - You can try to include the `-updateHosts` parameter on your `New-BcContainer`. This will add an entry in your hosts file for the container.
   - You can try to use Username/Password authentication instead of Windows authentication adding `-auth UserPassword -credential (Get-Credential)` to your `New-BcContainer` command.
4. Try the most basic New-BcContainer command with the suggested arguments from this article to check whether the problem stems from advanced usage. 
5. Remember to include the full output of your New-BcContainer command when creating an issue on GitHub.

### Engage with us on GitHub - BcContainerHelper

[!INCLUDE[BcContainerHelper_github](../includes/include-bccontainer-helper-github.md)]

## After setup

After starting the Docker container, you see log entries similar to the following example:

```
Initializing...
Starting Container
Hostname is b8c6941bb168
...
Container IP Address: 192.168.57.195
Container Hostname  : mysandbox
Container Dns Name  : mysandbox
Web Client          : http://mysandbox/BC/?tenant=default
Dev. Server         : http://mysandbox
Dev. ServerInstance : BC
Dev. Server Tenant  : default
Setting mysandbox-default to 127.0.0.1 in container hosts file

Files:
http://mysandbox:8080/ALLanguage.vsix

Initialization took 66 seconds
Ready for connections!
```

At this point, you can open your browser and type in the web client URL from the log. You're prompted to sign in with the Admin Username/Password that is shown.

> [!NOTE]  
> The container image uses a so called self-signed certificate for HTTPS communication. Because of that, your browser might warn you that the page you are requesting is unsafe. In those specific circumstances, and only for test and development environments, it is safe to ignore this warning. If you want to resolve this warning, you can install the certificate on your PC. For more information, see the link under **Files** in the log entries.


## See also

[Get Started with AL](devenv-get-started.md)  
[Get started with the Container Sandbox Development Environment](devenv-get-started-container-sandbox.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)  
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
