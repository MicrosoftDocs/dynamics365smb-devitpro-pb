---
title: "Get started with the Container Sandbox Development Environment"
description: "Overview of the getting started with the container-based development."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Get started with the Container Sandbox Development Environment
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] offers a container-based image environment that enables access to the AL development environment. 

You set up a container sandbox by running the **Container Sandbox Environment** page from [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. You will have to decide whether you want an Azure-hosted or locally hosted container sandbox. See the next section for details.

> [!TIP]
> [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] also offers an online sandbox. For more information, see [Sandbox Environments for Dynamics 365 Business Central Development](devenv-sandbox-overview.md).

## <a name="AzureVsLocal"></a>Choosing an Azure-hosted or local-hosted container sandbox
When you set up the container sandbox, you can choose to host the sandbox on Microsoft Azure or on a local computer. Both environments offer the same capabilities and use Docker to provide the infrastructure for the container-based application. The difference is:

- With Azure hosting, Docker is installed and configured for you. However, Azure hosting requires that you sign up for an Azure subscription, and additional costs may be incurred for each container sandbox.
- Local hosting requires that your computer is running Windows 10, Windows Server 2016, or Windows Server 2019, and you install and configure Docker before setting up the container sandbox.

## Set up an Azure-hosted container sandbox
1. If you you do not already have one, sign up for an Azure subscription.

    To get a free subscription and read more information, see [https://azure.microsoft.com](https://azure.microsoft.com).

2. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], choose the ![Lightbulb that opens the Tell Me feature](../media/search_small.png "Tell me what you want to do") icon, enter **Container Sandbox Environment**, and then select the relevant link.
3. Choose **Host in Azure**. If prompted, enter the user name and password of your Azure subscription. 

    The Azure portal opens to display a custom deployment form. 
4. Fill out the required fields on the form, and then select **Purchase**.

> [!NOTE]  
> You must set the **Accept Eula** setting to **Yes** in order to continue.


## Set up a local-hosted container sandbox

1. If not already done, install Docker.

    To install and configure Docker, choose the version of Docker that is appropriate for the host operating system:

    - For Windows 10, use [Docker Community Edition]( https://hub.docker.com/editions/community/docker-ce-desktop-windows).
        For more information, see [Install instructions](/virtualization/windowscontainers/quick-start/quick-start-windows-10).
    - For Windows Server, use [Docker Enterprise Edition](https://hub.docker.com/editions/enterprise/docker-ee-server-windows).
        For more information, see [Install instructions](/virtualization/windowscontainers/quick-start/quick-start-windows-server).

2. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], choose the ![Lightbulb that opens the Tell Me feature](../media/search_small.png "Tell me what you want to do") icon, enter **SANDBOX ENVIRONMENT (CONTAINER)**, and then select the relevant link.
3. Choose **Host Locally**.
4. Save the **CreateBCSandbox.ps1** file to your computer.
5. Run Windows PowerShell ISE as an administrator.
6. Open the **CreateBCSandbox.ps1** file.
7. Set the `$containername = ''` variable to the name that you want to give the container, for example `$containername = 'mybc'`.

    This name is only used internally in your envirorment for identification purposes.
8. Set the `$accept_eula = ''` variable to `'$true'`.
9. Press F5 to run the script.

    The console pane displays the progress of the script. When the script has completed successfully, information like the following will display:
    ```
    ...
    Container IP Address: 172.22.147.63
    Container Hostname  : mybc
    Container Dns Name  : mybc
    Web Client          : http://mybc/BC/
    Dev. Server         : http://mybc
    Dev. ServerInstance : BC

    Files:
    http://test:8080/ALLanguage.vsix

    Initialization took 116 seconds
    Ready for connections!
    Reading CustomSettings.config from mybc
    Creating Desktop Shortcuts for mybc
    ```

10. Write down or copy the following parameter/values from the console: `Dev. Server`,  `Dev. ServerInstance`, and `Files`. You will need this information later to [set up Visual Studio Code for extension development](#VSCode).

You now have a container sandbox set up on your computer. The following shortcuts have been added to your desktop:

- **\<Container name\> Web Client** - opens the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] for the your application in the container.
- **\<Container name\> PowerShell Prompt** - opens a Windows PowerShell prompt in the container. This gives you access to the [!INCLUDE[navnowg_md](includes/navnow_md.md)] (/powershell/business-central/overview), which you can run against the container sandbox environment. 
- **\<Container name\>Command Prompt**  - opens a Windows command prompt in the container.


For more information about working with a container sandbox, see [Running a Container-Based Development Environment](devenv-running-container-development.md).

### <a name="VSCode"></a>Set up Visual Studio Code
After the container sandbox is set up, you must set up Visual Studio Code for extension development. To do this, you need the values for `Dev. Server`,  `Dev. ServerInstance`, and `Files` parameters that you retrieved from the Windows PowerShell ISE console when you ran the **CreateBCSandbox.ps1** script. 

1. In Visual Studio Code, go to **Extensions**, and install the AL Language extension from the Marketplace.
    You now have the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] enabled.
2. In Visual Studio Code, press **Ctrl+Shift+P** and then choose **AL Go!**.
3. Choose where to create the project, and then choose the **Your own server** option.
4. Open the generated `launch.json` file, update the `"server"` setting with the value of the `Dev. Server` parameter and the `"serverInstance"` setting with the value of the `Dev. ServerInstance` to reflect the container you just created. For example:

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


## See Also
[Running a Container-Based Development Environment](devenv-running-container-development.md)  
[Working with Sandboxes and Entitlements](devenv-work-sandbox-entitlements.md)  
[Sandbox Environments for Dynamics 365 Business Central Development](devenv-sandbox-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
