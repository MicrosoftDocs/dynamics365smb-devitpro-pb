---
title: "Overview of the Application"
description: "This article provides an overview of the modules in the Application, and information about how you can use them."
author: bholtorf
ms.topic: overview
ms.author: bholtorf
ms.date: 01/08/2024
ms.collection:
  - bap-ai-copilot
ms.reviewer: bholtorf
---

# Overview of the Application

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

The business central application code is being refactored from a single monolythic application into smaller applications (layers) which in turn are built from small modules which handle a single functionality or feature.

The System Application layer contains modules that provide ERP agnostic functionality. These are mostly tecnical features which any application needs.
The Business Foundation layer contains modules that provide ERP related functionality that applies to all or none of the application domains.

As we continue to modernize the application code more modules and layers will be added. For an overview of system and application reference documentation, see [System and Base Application Reference for Dynamics 365 Business Central](/dynamics365/business-central/application).

> [!Note]
> The modules in the System Application and Business Foundation represent a significant change in what's happening under the hood in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. We are aware that the changes we have made will introduce breaking changes, so we have made a list of those that we know about, which includes suggestions for solutions. To view the breaking changes list, see [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md).<br><br>We will continue to enhance the System Application in future releases. If you find something you think we should add, visit our [Dynamics 365 Application Ideas](https://aka.ms/bcideas) page. If you want us to improve something, go to the [BCApps](https://github.com/microsoft/BCApps) repository and submit a pull request for it.



<!--## Example - Enhancing a Module


FREDDYK: THIS IS NO LONGER THE WAY TO DO THIS


This example shows how to...

1. Start by pulling the latest Docker image. For more information, see [Freddy's Blog](https://freddysblog.com/2019/07/31/preview-of-dynamics-365-business-central-2019-release-wave-2/).

```
docker pull bcprivate.azurecr.io/bcsandbox-master:base-ltsc2019
```

2. Create a Docker container using your favorite PowerShell script. Be sure to add the useCleanDatabase parameter. For example:

```
$credential = New-Object System.Management.Automation.PSCredential -argumentList "admin", (ConvertTo-SecureString -String "P@ssword1" -AsPlainText -Force)
$imageName = "bcprivate.azurecr.io/bcsandbox-master:base-ltsc2019"
$licensePath = "C:\..\l.flf" #put actual path to your license
$containerName = "BC"

New-BCContainer -accept_eula `

                -updateHosts `

                -containerName $containerName `

                -auth NavUserPassword -Credential $credential `

                -imageName  $imageName `

                -licenseFile $licensePath `

                -doNotExportObjectsToText `

                -includeAL `

                -useCleanDatabase `

                -memoryLimit 16g `
```

  > [!Note]
  > The container will start as a process, and the output will display in the PowerShell output window. Make a note of the URL for the web client. You will need that later.

3. Uninstall and unpublish the System Application.

```
UnPublish-BCContainerApp -containerName $containerName `

  -appName "System Application" `

  -unInstall `

  -doNotSaveData
```

4. In Visual Studio Code, run the **AL:Go!** command to create a new AL Project, and then choose **4.0** as the **Target Platform**.

  > [!Note]  
  > The alProjectFolder must be in a location that is shared with the container. For example, a folder in C:\ProgramData\BCContainerHelper will work.

5. When your project is created, follow these steps:

    1. Update launch.json – Update the **Server** and **Server Instance** parameters with values from the PowerShell output.
    2. Delete the **HelloWorld.al** and **app.json** files.

6. Get the latest code for the System Application from our GitHub repository at [BCApps](https://github.com/microsoft/BCApps). In GitHub, choose the **Clone** or **Download** buttons, and then **Download ZIP**. Open the downloaded archive and copy the content of the \BCApps-main\src\System Application\App folder to your AL project.

You now have the latest version of the System Application, and you can download symbols and make enhancements. When you're done, package the System Application without publishing it.

7. Switch back to PowerShell and run the following cmdlet to publish and install a new version of the app:

```
Publish-BCContainerApp -containerName $containerName `

-appFile "C:\ProgramData\BCContainerHelper\AL\DemoSolution\Microsoft_System Application_15.0.0.0.app" `

-skipVerification `

-sync `

-syncMode ForceSync `

-install
```
8. You can share your enhancements with others. For more information, see [Git Going with Extensions](https://community.dynamics.com/business/b/businesscentraldevitpro/posts/quot-git-quot-going-with-extensions). The only difference in the guidance is that you must use a container instead of a cloud sandbox.  -->

## See also
[BCApps](https://github.com/microsoft/BCApps)  
[BCApps reference documentation](https://microsoft.github.io/BCApps/#reference-documentation)
