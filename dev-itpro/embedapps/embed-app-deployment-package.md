---
title: "Embed app deployment packages"
author: jswymer

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 10/01/2020
---

# Creating Deployment Packages for Embed Apps

This article describes how to deploy an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online service. To deploy an [!INCLUDE[embedapp](../developer/includes/embedapp.md)], you'll need a deployment package and your apps. The deployment package is a .zip file that contains components required for any Embed app. The apps are the individual extensions that make up your application. Apps are delivered as .app files.

## Preparing the Embed app code and data for deployment

At a high level, a deployment package consists of the following components: 

- ISV branding elements, like images, icons, names, and so on  
- An application database and tenant template databases
- A manifest-json file that provides additional metadata and deployment instructions

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online service runs exclusively in multi-tenant mode. Each customer environment is a separate database. So the deployment package has to include two databases, which are compiled into BACPAC format:  

- App.bacpac - includes the application database. The application database contains your application data, like permissions, entitlements, report layouts, and extensions.  
- Tenant.bacpac - includes the tenant template database, which contains initial tenant data.

The apps (extensions) which are used by your solution must be uploaded to the service by using the [App Management API](../administration/appmanagement/app-management-api.md). The apps may also be pre-published and pre-installed in the application and tenant template databases, but it isn't required. Instead, we recommend you to uninstall and unpublish all apps (without removing the data), just before you export the application and tenant template databases.  
 
Deployment routine will pull the apps that are uploaded via the App Management API. It will then publish and install the apps based on the instructions provided in the manifest.json file.  

### Using Docker

We strongly recommend you run [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Docker using the [NAVContainerHelper PowerShell module](https://github.com/Microsoft/navcontainerhelper) to prepare the BACPAC files. 

> [!IMPORTANT]
> You must only use the container images available in the  "mcr.microsoft.com/businesscentral/sandbox" container registry for your online deployments.

With the Docker container, you can:  

- Import your own objects and attach your own database and/or publish necessary extensions into the application database  
- Synchronize the schema of the tenant template database with the schema defined in the application  
- Ensure that all objects are compiled  
- Test your solution before creating the deployment package.

For more information about these and other things you can do, see [NAVContainerHelper PowerShell module](https://github.com/Microsoft/navcontainerhelper).

> [!IMPORTANT]
> If your Embed app uses a customized Base Application, you must create your own unique App ID and use it in the app.json file of your customized Base App. You must also change the Publisher property and the Application name to your own in the app.json file. You cannot use the original values of the Microsoft Base Application unless you've extracted all your customizations from that app. The System Application must not be customized and must be used as a dependency for your customized Base Application. Use the `Microsoft_Application.app` file to logically incapsulate all of the extensions making up your solution instead of referencing each extension separately, to allow other apps to refer to this solution via the `Microsoft_Application.app`. For more information about the Microsoft_Application.app, see [The Microsoft_Application.app File](../developer/devenv-application-app-file.md).

### .NET add-ins

If your solution uses custom .NET Server components (.NET add-ins), import components into the **Add-in** table in the application database.

> [!IMPORTANT]
> This option is being deprecated, so you need to refactor your code to remove custom .NET components as soon as possible (for example, using Azure Functions instead).  

### Application database

It's important that the application database contains Microsoft unmodified records in the following tables:  

- Membership Entitlement  
- Entitlement Set 
- Entitlement

No users can sign in to your service if these tables are empty.  

For more information about these tables, see [Business Central entitlements explained](https://cloudblogs.microsoft.com/dynamics365/it/2019/07/18/business-central-entitlements/).

The entitlements can be copied from the standard Business Central Demo Database available in sandbox Docker containers. Consult the documentation provided for the `Clean-BCContainerDatabase` and `New-BCContainer` commands included with the NAVContainerHelper PowerShell module. 

### Tenant database

You can include your own specific demonstration data and companies in the tenant template database. It can help ensure that the new sign-ups get up and running quicker. However, in the future, we recommend you to use RapidStart packages to populate the companies with the demo data.  
 
Once you compose and test your solution on Docker, you can export the application and tenant template databases. You export the database to BACPAC format by using the `Export-BCContainerDatabasesAsBacpac` command. This command is included in the NAVContainerHelper PowerShell module.  
 
We strongly recommend using this command for creating the BACPAC files you're planning to deploy to the Business Central service. To simplify exporting the data, the command also does a number of clean-up steps on the databases. It cleans up sessions, database connection, list of tenants, imported license, and more. It also verifies that the schemas of the application and tenant databases are synchronized, which is essential for deployment. We keep enhancing this command with more cleanup and validation steps as we discover BACPAC-related issues with deployments. So, remember to update the NAVContainerHelper PowerShell module for every new iteration.  
 
## Providing deployment instructions in the manifest.json 
 
The manifest.json file, supplied within the deployment package, contains important properties used by the deployment routine to configure the application version according to the Embed app ISV requirements.  
 
|Setting|Type|Description|
|----|----|-----------|
|manifestSchemaVersion |String, `<major>.<minor>` |Schema version of the manifest. Current manifest schema version is 3.0. |
| id |GUID |Unique ID of the Embed solution. Used for informational purposes, not used in the runtime. As a best practice it's recommended to use the Id of your main app in this field.|   
 | name |String |Short marketing name of the app. Used for informational purposes, not used in the runtime.  |
|description |String |Short marketing description of the app. Used for informational purposes, not used in the runtime. |
| publisher| String|Name of the ISV organization that owns the Embed app. Used for informational purposes, not used in the runtime.| 
| version| String. `<major>.<minor>.<build>.<revision>` |Version of the deployment package being uploaded. This version is displayed in the Application Version list in LCS, it has no other purpose or application in the runtime. Remember to update this version for every new deployment, so you can distinguish the deployments in the LCS UI.|  
| branding| Object |Object that contains paths to the branding elements of the ISV included with the deployment package. See the `"branding"` section below.|
| databases| Object |Object that contains paths to the application and tenant template BACPAC files of the ISV solution included with the deployment package. See the `"databases"` section below.|
| links| Object |Object that contains paths to various URLs to be used in the Business Central Web Client. See the `"links"` section below.|  
| apps| Array |Array that contains the list of apps and their dependencies, which are uploaded by the ISV via the App Management API. See the `"apps"` section below.|  


#### "branding"

||||
|----|----|-----------|
| productName| String  |Official marketing name of your Embed app. This name will be displayed in the title bar of the Business Central Web Client.  
| productNameShort| String  |Short version of Embed app marketing name. It's displayed in the areas of the UI where full Product Name can't be displayed. |
| marketingName| String  |Longer (full) marketing name of your Embed app. |
| images| Object | Object that contains paths to the branding images included with the package. See the `"images"` section below.| 

#### "images"

||||
|----|----|-----------|
| appleTouchIconPath| String |Format: PNG. Dimensions: 114x114  |
| faviconPath| String |Format: ICO. Dimensions 16x16, 32x32, 48x48 & 64x64. Used on the Browser tab and bookmark icon.|  
| headerPath| String  |Formats: PNG, GIF. Dimensions: 558x107. Displayed on "Minimal Layout" pages, like the Microsoft Office add-in sign-in; Authentication / Permission errors ("You don't have access to Business Central", "You've successfully signed out.") 
| splashLandscapePath| String |Formats: PNG, GIF. Dimensions: 2048x272. Splash screen on devices with large screen space, for example, full screen browser, tablet in landscape mode.  |
| splashPortraitPath| String  |Formats: PNG, GIF. Dimensions: 960x320. Splash screen on devices with limited screen space, for example, small browser, phones, tablets in portrait orientation. | 

#### "databases"

||||
|----|----|-----------|
| applicationBacpacPath| String  |Path to the application database (.bacpac) included with the deployment package. |
| tenantTemplateBacpacPath| String|Path to the tenant template database (.bacpac) included with the deployment package. |

#### "links"

||||
|----|----|-----------|
| baseHelpUrl| String  |Link to your online Help server or web page. |
| baseHelpSearchUrl| String |Link to your online Help server or web page.| 
| communityUrl| String |Link to your community blog  page. |
| feedbackUrl| String |Link to your product feedback  page.| 
| legalUrl| String|Link to your product legal and privacy terms.|
| signInHelpUrl| String|Link to your sign-in help URL. |
| comingSoonUrl| String |Link to your product announcements page. |
| blogUrl| String |Link to your product blog page.| 
| contactSalesUrl| String |Link to your sales page. |
 
#### "apps"

This section of the manifest.json file must list all the apps used by your solution and their dependencies. Even if the dependency app belongs to a different publisher, for example Microsoft, you must include it. This list will be used by the deployment routine to publish and install these apps to your service and for your environments.   

||||
|----|----|-----------| 
| id| String|Unique ID of the app. Use the same Id as listed in the app.json file.|  
| name| String |Name of the app. Use the same Name as listed in the app.json file.|  
| publisher| String|Name of the ISV organization that owns the app. Use the same Publisher as listed in the app.json file.| 
| initialVersion| String |Minimum required (and compatible) version of the app. The exact version of the app you specify must be uploaded via the App Management API. Either you upload the apps or publishers that own the apps do.|
| allowedUpdates| Enum |Allowed values: none, hotfix, minor, all. <br /><br />You can set up rules that determine which app version to use for the new sign-ups. You can also specify whether updating of the installed app is allowed. <ul><li>`"none"`: It won't be possible to apply any new versions to this app inline (only side by side).  Only the application version, which matches the specified initial version number exactly, will be used for the new signups.</li><li>`"hotfix"`: You allow hot fixing this app with newer hotfix versions (versions with higher build and revision versions). New signups will automatically get the latest available HF version of the app installed.</li><li>`"minor"`: Customers can view and install newer applicable minor (or hotfix) versions of the app via the Business Central Admin Center. New signups will automatically get the latest available hotfix version of the app installed, however the minor updates will not be automatically installed, they should be installed by the newly signed up customers using the Business Central Admin Center. </li><li>`"all"`: Customers can view and install all newer applicable versions of the app via the Business Central Admin Center. </li> </ul> |
| blockUninstall| Boolean |Allow or disallow the app to be uninstalled using the Extension Management page.|  
| publishOnly| Boolean |Specifies whether to only publish (`true`) that app to the service. Customers can then install it manually from the Extension Management page. If `false`, the app is automatically installed for all new environments and environments updated to this deployment. | 

### Sample manifest

Sample of the manifest.json file. 

```json
{   
  "manifestSchemaVersion":"3.0", 
  "id": "201e5067-99cc-4974-900a-b50bd4fbe777", 
  "name": "Fabrikam Rentals", 
  "description": "Harness the power of the most feature-rich office furniture rentals solution from Fabrikam.", 
  "publisher": "Fabrikam", 
  "version": "16.1.50043.50321", 
  "branding": { 
    "productName": "Fabrikam Rentals", 
    "productNameShort": "Rentals", 
    "marketingName": "Fabrikam Rentals", 
    "images": { 
      "appleTouchIconPath":  "branding/appletouch.ico", 
      "faviconPath":  "branding/favicon.ico", 
      "headerPath":  "branding/header.png",  
      "splashLandscapePath": "branding/web-wide.png", 
      "splashPortraitPath":  "branding/web-narrow.png" 
    } 
  }, 
  "databases": { 
    "applicationBacpacPath": "databases/app.bacpac", 
    "tenantTemplateBacpacPath": "databases/tenant.bacpac" 
  }, 
  "links": { 
    "baseHelpUrl": "https://help.fabrikam.com/help/", 
    "baseHelpSearchUrl": "https://help.fabrikam.com/help/", 
    "communityUrl": "https://fabrikam.com/au/contact", 
    "feedbackUrl": "https://fabrikam.com/au/contact", 
    "legalUrl": "https://fabrikam.com/au/legal", 
    "privacyUrl": "https://fabrikam.com/au/privacy", 
    "signInHelpUrl": "https://fabrikam.com/au/contact", 
    "comingSoonUrl": "https://go.microsoft.com/fwlink/?linkid=2047422", 
    "blogUrl": "https://go.microsoft.com/fwlink/?linkid=2076643", 
    "contactSalesUrl": "https://go.microsoft.com/fwlink/?linkid=828707" 
  }, 
  "apps":  [ 
                 { 
                     "id":  "63ca2fa4-4f03-4f2b-a480-172fef340d3f", 
                     "initialVersion":  "16.1.40074.41897", 
                     "name":  "System Application", 
                     "publisher":  "Microsoft", 
                     "allowedUpdates":"hotfix", 
                     "publishOnly":  false, 
                     "blockUninstall":  true 
                 }, 
                 { 
                     "id":  "201e5067-99cc-4974-900a-b50bd4fbe777", 
                     "initialVersion":  "16.1.50043.50321", 
                     "name":  "Fabrikam Rentals", 
                     "publisher":  "Fabrikam", 
                     "allowedUpdates":"minor", 
                     "publishOnly":  false, 
                     "blockUninstall":  true 
                 } 
             ] 
} 
 
```

## Preparing the deployment package 
 
Once you've all the components of the deployment package ready, you can package them into a .zip archive.  the archive content mustn't include any additional subfolders and must have the following structure: 
 
[FOLDER] branding/
  - favicon.ico 
  - splash.png (or .gif) 
  - splash_narrow.png (or .gif) 
  - header.png (or .gif) 

[FOLDER] databases/ 
  - app.bacpac 
  - tenant.bacpac

manifest.json 


## See Also

[Embed App Overview](../deployment/embed-app-overview.md)  
[Qualification and Onboarding](../deployment/embed-app-qualifications-onboarding.md)  
[Managing Embed Apps in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md)  
