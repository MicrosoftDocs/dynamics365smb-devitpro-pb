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
ms.date: 10/01/2020
---

# Overview of the System Application
The System Application contains modules that interact with the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] platform and online ecosystem to support the business logic in the Base Application. If you are developing extensions or add-ons for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you will probably need to use one or more of the objects in the modules. 

This topic provides an overview of the modules in the System Application. For more details about each module, and to get a look at the code, choose the **ReadMe** link for the module to visit our [ALAppExtensions](https://github.com/microsoft/ALAppExtensions) repository on GitHub.

> [!Note]
> The modules in the System Application represent a significant change in what's happening under the hood in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. We are aware that the changes we have made will introduce breaking changes, so we have made a list of those that we know about, which includes suggestions for solutions. To view the breaking changes list, see [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md).<br><br>We will continue to enhance the System Application in future releases. If you find something you think we should add, visit our [Dynamics 365 Application Ideas](https://aka.ms/bcideas) page. If you want us to improve something, go to the [ALAppExtensions](https://github.com/microsoft/ALAppExtensions) repository and submit a pull request for it.  

## Overview of the Modules in the System Application
The list of modules is growing continuously. The following table lists and describes the modules that are available now. 

|Module|Description|Link to ReadMe|
|----|----|----|
|Assisted Setup|Contains all pages that are used by assisted setup guides.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Assisted%20Setup/README.md)|
|Auto Format|Formats the appearance decimal data types.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Auto%20Format/README.md)|
|Azure AD Graph|Interface for the Azure AD Graph API.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20AD%20Graph/README.md)|
|Azure AD Licensing|Access information about the subscribed SKUs and the corresponding service plans.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20AD%20Licensing/README.md)|
|Azure AD Plan|Provides methods for retrieving and managing user plans in Azure Active Directory.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20AD%20Plan/README.md)|
|Azure AD Tenant|Retrieves information about the Azure Active Directory tenant.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20AD%20Tenant/README.md)|
|Azure AD User Management|Provides functionality for managing Azure Active Directory users.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20AD%20User%20Management/README.md)|
|Azure AD User|Retrieves and updates a user from the Azure AD Graph API.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20AD%20User/README.md)|
|Azure Key Vault|Stores Azure Key Vault secrets for deployments.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Azure%20Key%20Vault/README.md)|
|BLOB Storage|Stores and manages data in a binary format.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/BLOB%20Storage/README.md)|
|Base64 Convert|Converts text and from base 64.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Base64%20Convert/README.md)|
|Caption Class|Defines how the CaptionClass property displays captions.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Caption%20Class/README.md)|
|Client Type Management|Allows testing of code that relies on different types of clients.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Client%20Type%20Management/README.md)|
|Confirm Management|Determines whether a confirm dialog displays when logic is run.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Confirm%20Management/README.md)|
|Cryptography Management|Contains the capabilities for encryption and hashing.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Cryptography%20Management/README.md)|
|Cues and KPIs|Provides setup pages and interface methods to manage cues.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Cues%20and%20KPIs/README.md)|
|Data Classification|Handles data classification for objects that might contain sensitive information.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Data%20Classification/README.md)|
|Data Compression|Compresses and uncompresses data in a binary format.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Data%20Compression/README.md)|
|Date-Time Dialog|Provides helper functions for entering date-time values.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Date-Time%20Dialog/README.md)|
|Default Role Center|Supports the default RoleCenter selection.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Default%20Role%20Center/README.md)|
|DotNet Aliases|Defines aliases for .NET classes.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/DotNet%20Aliases/README.md)|
|Environment Information|Contains helper methods for getting information about the tenant and general settings.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Environment%20Information/README.md)|
|Extension Management|Provides the tools needed to manage an extension.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Extension%20Management/README.md)|
|Field Selection|Looks up fields.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Field%20Selection/README.md)|
|Filter Tokens|Provides helper functions to manage filter texts.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Filter%20Tokens/README.md)|
|Headlines|Helps with constructing the text for headlines.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Headlines/README.md)|
|Language|Changes the language for Windows and applications.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Language/README.md)|
|Manual Setup|Contains functions and events used by manual setup pages.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Manual%20Setup/README.md)|
|Math|Provides constants and static methods for trigonometric, logarithmic, and other common mathematical functions.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Math/README.md)|
|Object Selection|Look up page for all of the application objects, including objects from installed extensions.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Object%20Selection/README.md)|
|Password Dialog|Sets and verifies passwords.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Password%20Dialog/README.md)|
|Printer Management|Contains functionality that enables a user to manage printers.|[ReadMe](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/System/Printer%20Management)|
|Record Link Management|Provides helper functions for RecordLinks.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Record%20Link%20Management/README.md)|
|Recurrence Schedule|Calculates when the next event will occur.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Recurrence%20Schedule/README.md)|
|Satisfaction Survey|Shows a satisfaction survey.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Satisfaction%20Survey/README.md)|
|Secrets|Contains secret providers for reading secrets from the key vault that is specified by an extension or from other secret providers.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Secrets/README.md)|
|Server Settings|Exposes methods that get settings from the server configuration file.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Server%20Settings/README.md)|
|System Initialization|Runs non-business logic on user log-ins.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/System%20Initialization/README.md)|
|Tenant License State|Retrieves the current state of the tenant license.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Tenant%20License%20State/README.md)|
|Translation|Gets and stores language translations.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Translation/README.md)|
|Upgrade Tags|Provides functionality for ensuring that the upgrade code is run only one time.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Upgrade%20Tags/README.md)|
|User Log-In Times|Keeps track of when users sign in.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/User%20Login%20Times/README.md)|
|User Permissions|Exposes functionality to check and alter User Permission sets.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/User%20Permissions/README.md)|
|User Selection|Looks up and selects registered users.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/User%20Selection/README.md)|
|Video|Looks up and plays videos.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Video/README.md)|
|Web Service Management|Provides the tools needed to manage web services.|[ReadMe](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Web%20Service%20Management/README.md)|





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

6. Get the latest code for the System Application from our GitHub repository at [AlAppExtensions](https://github.com/microsoft/ALAppExtensions). In GitHub, choose the **Clone** or **Download** buttons, and then **Download ZIP**. Open the downloaded archive and copy the content of the \ALAppExtensions-master\Modules\System folder to your AL project.

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

## See Also
[ALAppExtensions](https://github.com/microsoft/ALAppExtensions)