---
title: "Overview of the System Application"
description: "This topic provides an overview of the modules in the System Application, as well as information about how you can use them."
author: bholtorf
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
ms.author: bholtorf
ms.date: 10/01/2021
---

# Overview of the System Application

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

The System Application contains modules that interact with the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] platform and online ecosystem to support the business logic in the Base Application. If you are developing extensions or add-ons for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you will probably need to use one or more of the objects in the modules.

This topic provides an overview of the modules in the System Application.

For an overview of system application reference documentation, see [Module System Application](/dynamics365/business-central/application/reference/system%20application/).

> [!Note]
> The modules in the System Application represent a significant change in what's happening under the hood in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. We are aware that the changes we have made will introduce breaking changes, so we have made a list of those that we know about, which includes suggestions for solutions. To view the breaking changes list, see [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md).<br><br>We will continue to enhance the System Application in future releases. If you find something you think we should add, visit our [Dynamics 365 Application Ideas](https://aka.ms/bcideas) page. If you want us to improve something, go to the [BCApps](https://github.com/microsoft/BCApps) repository and submit a pull request for it.

## Overview of the Modules in the System Application
The list of modules is growing continuously. The following table lists and describes the modules that are available now.

|Module name|Description|Link to module|
|----|----|----|
|Advanced Settings|The modules exposes advanced settings page and related integration events.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Advanced%20Settings)|
|AI||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/AI)|
|Auto Format|This module provides methods for formatting the appearance of decimal data types in fields on tables, reports, and pages.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Auto%20Format)|
|Azure AD Graph|This module provides functionality for retrieving user and tenant information from Microsoft Entra.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20AD%20Graph)|
|Azure AD Licensing|Provides a way to access information about the subscribed SKUs and the corresponding service plans. It uses two collections: one that stores the subscribed SKUs and the other that stores the corresponding service plans of the SKU that we currently point to in the collection. ResetSubscribedSKU and ResetServicePlans will set the enumerators to the initial position. Use NextSubscribedSKU to advance the enumerator to the next subscribed SKU in the collection and NextServicePlan to advance to the next service plan of the SKU that the enumerator currently points to. |[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20AD%20Licensing)|
|Azure AD Plan|This module provides methods for retrieving and managing user plans in Microsoft Entra as well as configuring the permissions users will get when assigned a plan. The Plan and User Plan tables are marked as internal, so you must use the methods provided in this module to query them.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20AD%20Plan)|
|Azure AD Tenant|This module provides methods for retrieving information about the Microsoft Entra tenant.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20AD%20Tenant)|
|Azure AD User|This module provides functionality for retrieving and updating user information from Microsoft Entra.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20AD%20User)|
|Azure AD User Management|This module provides functionality for managing Microsoft Entra users.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20AD%20User%20Management)|
|Azure Blob Services API|Provides functionality to work with storage accounts, containers and blobs from Azure Blob Storage Services.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Blob%20Services%20API)|
|Azure Function||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Function)|
|Azure Key Vault|This module exposes functionality to extract secret values from Azure key vault.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Key%20Vault)|
|Azure Storage Services Authorization|This module provides functionality for authenticating to the [Azure Storage Services REST API](https://go.microsoft.com/fwlink/?linkid=2211412).|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Storage%20Services%20Authorization)|
|Barcode|This module exposes functionality to encode barcodes.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Barcode)|
|Base64 Convert|The module provides functionality to convert the text to and from base 64. It may be used for dealing with large XML files, pictures etc.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Base64%20Convert)|
|BLOB Storage|Provides a way to store various kinds of data. It consists of the TempBlob container to store BLOB data in-memory, the Persistent BLOB Management interface for storing BLOB data between sessions, and the TempBlob List interface for storing sequences of variables, each of which stores BLOB data. Potential uses are storing images, very long texts, PDF files, and so on.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/BLOB%20Storage)|
|Business Chart||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Business%20Chart)|
|Camera and Media Interaction|Contains functionality that enables users to interact with a camera or media.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Camera%20and%20Media%20Interaction)|
|Caption Class|Defines how the CaptionClass property displays captions for pages and tables. You can define rules for how captions display.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Caption%20Class)|
|Client Type Management|This module is to allow testing of functionality that relies on a client type other than the one that the test is executed on.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Client%20Type%20Management)|
|Confirm Management|Contains helper methods that either display a confirm dialog when logic is run, or suppresses it if UI is not allowed, such as background sessions or webservice calls.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Confirm%20Management)|
|Cryptography Management|Provides helper functions for encryption and hashing. |[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Cryptography%20Management)|
|Cues and KPIs|This module provides setup pages and interface methods to manage cues in Business Central.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Cues%20and%20KPIs)|
|Customer Experience Survey|This module exposes functionality to connect to CES (Customer Experience Surveys).|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Customer%20Experience%20Survey)|
|Data Administration||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Data%20Administration)|
|Data Archive|Provides an API that lets you add archiving to any app object that needs to archive data before deleting it. |[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Data%20Archive)|
|Data Classification|This module provides functionality for handling data classification for objects that might contain sensitive information.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Data%20Classification)|
|Data Compression|The purpose of this module is to provide ability to create, update, read and dispose a binary data compression archive.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Data%20Compression)|
|Date and Time||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Date%20and%20Time)|
|Date-Time Dialog|The modules consists of a page to enter date or date-time values.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Date-Time%20Dialog)||Default Role Center|The modules exposes functionality to define default role center.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Default%20Role%20Center)|
|Device|This module allows you to access information such as the name, MAC address, type, and state for all devices that are connected to Business Central.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Device)|
|Document Sharing|Enable document sharing flows through a valid document service|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Document%20Sharing)|
|DotNet Aliases|This module defines aliases for the most common DotNet types used in Business Central. As aliases are inherited through dependencies declared in the app.json, any alias defined here does not need to be declared elsewhere.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/DotNet%20Aliases)|
|Edit in Excel|This module provides an API for the Edit in Excel functionality in Business Central.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Edit%20in%20Excel)|
|Email|Provides an API that lets you connect email accounts to Business Central so that people can send messages without having to open their email application. The email module consists of the following main entities:|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Email)|
|Encoding|Provides helper functions to encode data|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Encoding)|
|Entity Text|This contains functionality to enable rich text content for entities.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Entity%20Text)|
|Environment Cleanup|Provides events in order to be able to clean up data when copying an environment.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Environment%20Cleanup)|
|Environment Information|Contains helper methods for getting information about the tenant and general settings, such as determining whether this is a production or sandbox environment, or deployed as an online or on-premises version, and so on.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Environment%20Information)|
|Extension Management|This module provides the tools needed to manage an extension.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Extension%20Management)|
|Feature Key|Contains the page that enables a user to pick which new features to use.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Feature%20Key)|
|Field Selection|Provides a page where you can look up and select one or more fields from one or more tables. For example, this is useful when you want to set up a KPI on a Role Center.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Field%20Selection)|
|Filter Tokens|This module enhances filtering by enabling users to enter additional filter tokens. |[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Filter%20Tokens)|
|Geolocation|Contains functionality that retrieves data about the geographical location of a client device.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Geolocation)|
|Guided Experience|# Public Objects|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Guided%20Experience)|
|Headlines|This module provides methods for constructing headlines on Role Centers.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Headlines)|
|Image|This module provides an API for working with images in Business Central. The module provide some basic for manipulating images. For example, you might want images to always display in a certain width and height, so we've added the ability to do things like resize and crop images. |[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Image)|
|Language|Changes the language for Windows and applications, and converts language codes to language IDs, and vice versa. The Language table is a subset of Windows languages. You can add languages, and edit translations and descriptions in the list.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Language)|
|Math|Provides constants and static methods for trigonometric, logarithmic, and other common mathematical functions.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Math)|
|Navigation Bar Subscribers|Collection of the default subscribers to system events and corresponding overridable integration events for the Navigation Bar.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Navigation%20Bar%20Subscribers)|
|OAuth|This module contains supporting tools for authenticating via OAuth 1.0 authorization protocol.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/OAuth)|
|OAuth2|This module contains tools that support authentication through Microsoft Entra ID using OAuth 2.0 authorization protocols.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/OAuth2)|
|OAuthClientAddIn|# Introduction|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/OAuthClientAddIn)|
|Object Selection|The module provides a page to select application objects.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Object%20Selection)|
|Page Action Provider|This module contains functionality for providing home items and the associated view actions for user's current role center page.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Page%20Action%20Provider)|
|Page Summary Provider|This contains functionality for providing summary data for a given page. Depending on the given page, the returned summary data can be of different types (Caption, Brick fields, Dropdown fields, First N fields, etc.)|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Page%20Summary%20Provider)|
|Password|This module introduces a dialog for the user to enter a password.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Password)|
|Performance Profiler||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Performance%20Profiler)|
|Permission Sets||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Permission%20Sets)|
|Printer Management|Contains functionality that enables a user to manage printers.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Printer%20Management)|
|Privacy Notice|This module provides a simple way handle privacy notices.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Privacy%20Notice)|
|Record Link Management|Helper functions on RecordLinks.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Record%20Link%20Management)|
|Record Reference||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Record%20Reference)|
|Record Selection||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Record%20Selection)|
|Recurrence Schedule|This module provides methods for scheduling the recurrence of an event. Recurrence can be daily, weekly, monthly or yearly. The module also determine when the next occurrence will happen.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Recurrence%20Schedule)|
|Regex|This module provides an interface, that lets you use regular expresssions.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Regex)|
|Rest Client||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Rest%20Client)|
|Retention Policy|Administrators can define retention policies to specify how frequently they want Business Central to delete outdated data in tables that contain log entries and archived records. For example, cleaning up log entries can make it easier to work with the data that's actually relevant. Policies can include all data in the tables that is past the expiration date, or you can add filter criteria that will include only certain expired data in the policy.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Retention%20Policy)|
|Satisfaction Survey|This module provides methods for presenting a satisfaction survey to users.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Satisfaction%20Survey)|
|Secrets|This module contains secret providers. Use this module to do the following:|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Secrets)|
|Security Groups||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Security%20Groups)|
|Server Settings|This module provides methods for retrieving server configuration settings.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Server%20Settings)|
|SharePoint|Provides functions to interact with SharePoint REST API|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/SharePoint)|
|SharePoint Authorization|This module provides functionality for authenticating to the SharePoint REST API.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/SharePoint%20Authorization)|
|SmartList Designer Subscribers|Collection of the default subscribers to system events and corresponding overridable integration events for the SmartList Designer.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/SmartList%20Designer%20Subscribers)|
|System Initialization|This module contains functionality for initializing the application.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/System%20Initialization)|
|System Permissions||[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/System%20Permissions)|
|Table Information|The Table Information page shows information about database tables. The page contains the following fields:|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Table%20Information)|
|Telemetry|Provides functionality for emitting telemetry about feature usage and uptake.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Telemetry)|
|Tenant License State|This module provides methods for retrieving the current state of the tenant license, and the start and end dates of the license.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Tenant%20License%20State)|
|Time Zone Selection|Exposes ability for selecting and displaying time zones.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Time%20Zone%20Selection)|
|Translation|# Introduction|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Translation)|
|Upgrade Tags|This module provides functionality for ensuring that the upgrade code is run only one time.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Upgrade%20Tags)|
|URI|This module provides functionality to work with URIs.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/URI)|
|User Login Times|This module provides functionality for keeping track of when users sign in.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/User%20Login%20Times)|
|User Permissions|The modules exposes functionality to check and alter User Permission sets.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/User%20Permissions)|
|User Selection|Provides a page where you look up and select one or more registered users. For example, this is useful for assigning a person to things like documents, processes, or items.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/User%20Selection)|
|User Settings|Stores and exposes user-specific settings such as assigned roles, preferred language and time-zone.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/User%20Settings)|
|Video|This module provides functionality to add, look up, and select product videos.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Video)|
|Web Service Management|This module provides the tools needed to manage web services.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Web%20Service%20Management)|
|Word Templates|Use Word templates to create documents that incorporate data from Business Central using mail merge. For example, mail merge is a great way to personalize bulk communications with business partners by letter or email.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Word%20Templates)|
|XML Validation|Use the module to validate XML-formatted strings against XML schemas.|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/XML%20Validation)||XmlWriter|Provides helper functions to create XML as Big Text with System.Xml.XmlTextWriter|[Link](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/XmlWriter)|

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

## See Also
[BCApps](https://github.com/microsoft/BCApps)
