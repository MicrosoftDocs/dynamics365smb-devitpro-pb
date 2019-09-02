---
title: "Overview of the System Application"
description: "This topic provides an overview of the modules in the System Application, and provides information about how you can use them."
author: bholtorf
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: bholtorf
ms.date: 09/02/2019
---

# Overview of the System Application
The System Application contains modules that contain low-level support functionality and frameworks. The System Application interfaces to the Business Central platform and online ecosystem to provide the functions that the business logic in the Base Application needs.

## Overview of the Modules in the System Application
The list of modules is growing continuously. The following table lists and describes the modules that are available now. For more details about each module, and to get a look at the code, visit our [ALAppExtensions](https://github.com/microsoft/ALAppExtensions) repository on GitHub.

|Module|Description|
|----|----|
|Encryption Management|Contains the capabilities for encryption and hashing.|
|Object Selection|Look up page for all of the application objects, including objects from installed extensions.|
|Extension Management|Provides the tools needed to manage an extension.|
|Server Settings|Exposes methods that get settings from the server configuration file.|
|Headlines|Helps with constructing the text for headlines.|
|User Log-In Times|Keeps track of when users sign in.|
|DotNet Aliases|Defines aliases for .NET classes.|
|Data Compression|Compresses and uncompresses data in a binary format.|
|Translation|Gets and stores language translations.|
|Language|Changes the language for Windows and applications.|
|Record Link Management|Provides helper functions for RecordLinks.|
|Confirm Management|Determines whether a confirm dialog displays when logic is run.|
|Recurrence Schedule|Calculates when the next event will occur.|
|Password Dialog|Sets and verifies passwords.|
|BLOB Storage|Stores and manages data in a binary format.|
|Field Selection|Looks up fields.|
|Azure AD User|Retrieves and updates a user from the Azure AD Graph API.|
|Azure AD Graph|Interface for the Azure AD Graph API.|
|Azure AD Licensing|Access information about the subscribed SKUs and the corresponding service plans.|
|Video|Looks up and plays videos.|
|Azure Key Vault|Stores Azure Key Vault secrets for deployments.|
|Satisfaction Survey|Shows a satisfaction survey.|
|Environment Information|Contains helper methods for getting information about the tenant and general settings.|
|User Selection|Looks up and selects registered users.|
|Tenant License State|Retrieves the current state of the tenant license.|
|Date-Time Dialog|Provides helper functions for entering date-time values.|
|Default Role Center|Supports the default RoleCenter selection.|
|Caption Class|Defines how the CaptionClass property displays captions.|
|Client Type Management|Allows testing of code that relies on different types of clients.|
|Auto Format|Formats the appearance decimal data types.|
|System Initialization|Runs non-business logic on user log-ins.|
|Filter Tokens|Provides helper functions to manage filter texts.|
|Manual Setup|Contains functions and events used by manual setup pages.|
|Data Classification|Handles data classification for objects that might contain sensitive information.|


## Example - Enhancing a Module
<!--This example shows how to... -->

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
UnPublish-NavContainerApp -containerName $containerName ` 

  -appName "System Application" ` 

  -unInstall ` 

  -doNotSaveData 
```

4. In Visual Studio Code, run the **AL:Go!** command to create a new AL Project, and then choose **4.0** as the **Target Platform**.
  
  > [!Note]
  > The alProjectFolder must be in a location that is shared with the container. For example, a folder in C:\ProgramData\NavContainerHelper will work.

5. When your project is created, follow these steps:  
  
  a. Update launch.json – update the Server and Server Instance parameters with values from the PowerShell output. 
  b. Delete the HelloWorld.al and app.json files. 

6. Get the latest code for the System Application from our GitHub repository at [AlAppExtensions](https://github.com/microsoft/ALAppExtensions). In GitHub, choose the **Clone** or **Download** buttons, and then **Download ZIP**. Open the downloaded archive and copy the content of the \ALAppExtensions-master\Modules\System folder to your AL project.

You now have the latest version of the System Application, and you can download symbols and make enhancements. When you’re done, package the System Application without publishing it. 

7. Switch back to PowerShell and run the following cmdlet to publish and install a new version of the app: 

```
Publish-NavContainerApp -containerName $containerName ` 

-appFile "C:\ProgramData\NavContainerHelper\AL\DemoSolution\Microsoft_System Application_15.0.0.0.app" ` 

-skipVerification ` 

-sync ` 

-syncMode ForceSync ` 

-install
```
8. You can share your enhancements with others. For more information, see [Git Going with Extensions](https://community.dynamics.com/business/b/businesscentraldevitpro/posts/quot-git-quot-going-with-extensions). The only difference in the guidance is that you must use a container instead of a cloud sandbox.  



## See Also