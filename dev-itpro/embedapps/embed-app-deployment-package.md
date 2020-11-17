---
title: "Embed app deployment packages"
description: Learn about how to deploy a Business Central Embed app to the Online service
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

To deploy an [!INCLUDE[embedapp](../developer/includes/embedapp.md)], you'll need a deployment package and your apps. This article describes how to create a deployment package for an [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. 

The apps are the individual extensions that make up your application. Apps are delivered as .app files, which you upload to the App Repository via the App Management API. For information about this task, see [App Management API](../administration/appmanagement/app-management-overview.md).

Once you've created the deployment package and uploaded your apps, you then upload the deployment package to a registered project in Microsoft Lifecycle Services.

## Deployment package overview

Creating a deployment package prepares the Embed app code and data for deployment on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online service. The deployment package is a .zip file that contains components required for any Embed app.  

At a high level, a deployment package consists of the following components: 

- ISV branding elements, like images, icons, names, and so on  
- An application database and tenant template databases as BACPAC files
- A manifest-json file that provides additional metadata and deployment instructions

The deployment package has the following structure:

```
[FOLDER] branding/
  - favicon.ico 
  - splash.png (or .gif) 
  - splash_narrow.png (or .gif) 
  - header.png (or .gif) 

[FOLDER] databases/ 
  - app.bacpac 
  - tenant.bacpac

manifest.json
```

The following sections explain how to build the deployment package.

## Creating the database BACPACs using Docker

We strongly recommend you run [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Docker using the [NAVContainerHelper PowerShell module](https://github.com/Microsoft/navcontainerhelper) to prepare the BACPAC files. 

> [!IMPORTANT]
> You must only use the container images available in the "mcr.microsoft.com/businesscentral/sandbox" container registry for your online deployments.

With the Docker container, you can:  

- Attach your own database and publish necessary extensions into the application database  
- Synchronize the schema of the tenant template database with the schema defined in the application  
- Ensure that all objects are compiled  
- Test your solution before creating the deployment package.

For more information about these and other things you can do, see [NAVContainerHelper PowerShell module](https://github.com/Microsoft/navcontainerhelper).

### About the databases

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online service runs exclusively in multi-tenant mode. Each customer environment is a separate database, but sharing the same application. So the deployment package has to include two databases, which are compiled into BACPAC format:  

- App.bacpac - includes the application database. The application database contains your application data, like permissions, entitlements, report layouts, and so on.  
- Tenant.bacpac - includes the tenant template database, which may also contain initial tenant data.

#### Requirements for the application database

|Requirement|Condition|Description|
|----|----|-----------|
|Running on a supported [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform| Always|The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform is updated monthly. You're responsible for updating the Embed App to operate with the updated version of Business Central. The Embed App must run on a supported build (platform) of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], namely, the current version of Business Central or one of the two immediately preceding versions. The immediately preceding versions can be both minor and major versions of Business Central. Earlier versions of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform are out of support and can't be used for Embed app deployments. |
| Unique Base Application ID, Name, and Publisher|If any change is applied to the Microsoft Base Application objects| Create and assign your own unique App ID for it in the app.json file. Also, change the Publisher property and the Application name to your own in the app.json file. You can't use the original values of the Microsoft Base Application unless you've extracted all your customizations from that app into your own app(s). |
| Use System Application | Always| Your Embed app must be built on top of the Microsoft System Application. The System Application must not be customized and must be used as a dependency for your customized or non-customized Base Application. |
| Use `Microsoft_Application.app` file| If you use customized Base Application | Use `Microsoft_Application.app` to encapsulate references to your own customized Base Application, instead of referencing that app as a direct dependency in each extension separately. This will also allow other apps (like AppSource apps) to refer to your solution via the `Microsoft_Application.app`. For more information about the `Microsoft_Application.app`, see [The Microsoft_Application.app File](../developer/devenv-application-app-file.md).|
| Solution prefix or suffix| Always | Register a prefix or suffix to be used by your solution. Apply the prefix or suffix to all objects, while you're still preparing your apps on-premise. The prefix or suffix must be used for all your app objects and also for your tables, controls, fields, actions, and groups that remain inside of Microsoft's Base Application. There's no need to apply this prefix or suffix to Microsoft objects and fields in the customized Base Application. <br /><br /> Fore more information about requesting and using prefixes and suffixes, see [Benefits and Guidelines for using a Prefix or Suffix](../compliance/apptest-prefix-suffix.md). <br /><br /> Once your apps are deployed to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service, it won't be possible to rename fields and objects, because it would be a breaking change. Breaking changes aren't permitted in the online version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. While still preparing your apps on-prem, you can use the [Sync-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) with `-Force` parameter to add prefix or suffix to your objects and fields. |
| Entitlements | Always | It's important that the application database also contains Microsoft unmodified records in the following tables: </li><li>Membership Entitlement</li><li>Entitlement Set</li><li>Entitlement<br /><br />No users can sign in to your service if these tables are empty. You can't add new records or modify existing records in these tables. For more information about these tables, see [Business Central entitlements explained](https://cloudblogs.microsoft.com/dynamics365/it/2019/07/18/business-central-entitlements/).<br /><br />The entitlements can be copied from the standard Business Central Demo Database available in sandbox Docker containers. Make sure you update the entitlements when you uptake a new version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. Consult the entitlements documentation and parameters provided for the `Clean-BCContainerDatabase` and `New-BCContainer` commands included with the NAVContainerHelper PowerShell module. |
| Permissions | Always | The application database must contain Microsoft unmodified records in the following tables:  </li><li>Permission Set</li><li>Permission<br /><br />You can't modify the existing records in these tables. If you need to add your own permission sets and permissions for the objects used by your own solution, include these with your extension instead. For more information, see [Exporting Permission Sets](../developer/devenv-export-permission-sets.md).<br /><br />Don't include customer-specific permission sets and permissions in your database, these permissions must be added within the customer environment instead. For more information, see [how to create or modify a permission set](/dynamics365/business-central/ui-define-granular-permissions#to-create-or-modify-a-permission-set) in the Business Central Application help.|
| Custom .NET add-ins | If your solution uses custom .NET Server components (.NET add-ins)| Import components into the **Add-in** table in the application database. You register the control add-ins, import and manage the files by using the New-NAVAddin cmdlet, Set-NAVAddin cmdlet, Get-NAVAddin, or Remove-NAVAddin cmdlets from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].<br /><br /> **IMPORTANT** Using custom .NET Server components option is being deprecated. So refactor your code to remove custom .NET components as soon as you can. For example, use Azure Functions instead.|

#### Requirements to the tenant template database

While you are testing your Embed app solution in a Docker container, you can publish and install all the apps you need for your customers. When you're done testing, we recommend you to uninstall (including removing the data) and unpublish all apps, including Microsoft apps, before you export the application and tenant template databases.

Instead of keeping the apps pre-published and pre-installed in your databases, they must be uploaded to the service by using the [App Management API](../administration/appmanagement/app-management-api.md) and listed in the `[apps]` section of the `manifest.json` file. This way the apps will be automatically published and installed later, during deployment, following the list you provide in the `manifest.json` file that you include with your deployment package. 

We recommend you to use RapidStart packages to populate the new companies with the demo data or initial setup data.  

## Exporting application and tenant databases

You export the databases to BACPAC format by using the `Export-BCContainerDatabasesAsBacpac` command from the [NAVContainerHelper PowerShell module](https://github.com/Microsoft/navcontainerhelper).  
 
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

|Setting|Type|Description|
|----|----|-----------|
| productName| String  |Official marketing name of your Embed app. This name will be displayed in the title bar of the Business Central Web Client.  
| productNameShort| String  |Short version of Embed app marketing name. It's displayed in the areas of the UI where full Product Name can't be displayed. |
| marketingName| String  |Longer (full) marketing name of your Embed app. |
| images| Object | Object that contains paths to the branding images included with the package. See the `"images"` section below.| 

#### "images"

|Setting|Type|Description|
|----|----|-----------|
| appleTouchIconPath| String |Format: PNG. Dimensions: 114x114  |
| faviconPath| String |Format: ICO. Dimensions 16x16, 32x32, 48x48 & 64x64. Used on the Browser tab and bookmark icon.|  
| headerPath| String  |Formats: PNG, GIF. Dimensions: 558x107. Displayed on "Minimal Layout" pages, like the Microsoft Office add-in sign-in; Authentication / Permission errors ("You don't have access to Business Central", "You've successfully signed out.") 
| splashLandscapePath| String |Formats: PNG, GIF. Dimensions: 2048x272. Splash screen on devices with large screen space, for example, full screen browser, tablet in landscape mode.  |
| splashPortraitPath| String  |Formats: PNG, GIF. Dimensions: 960x320. Splash screen on devices with limited screen space, for example, small browser, phones, tablets in portrait orientation. | 

#### "databases"

|Setting|Type|Description|
|----|----|-----------|
| applicationBacpacPath| String  |Path to the application database (.bacpac) included with the deployment package. |
| tenantTemplateBacpacPath| String|Path to the tenant template database (.bacpac) included with the deployment package. |

#### "links"

|Setting|Type|Description|
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

|Setting|Type|Description|
|----|----|-----------| 
| id| String|Unique ID of the app. Use the same Id as listed in the app.json file.|  
| name| String |Name of the app. Use the same Name as listed in the app.json file.|  
| publisher| String|Name of the ISV organization that owns the app. Use the same Publisher as listed in the app.json file.| 
| initialVersion| String |Minimum required and compatible version of the app. <br /><br />If `"allowedUpdates"` is set to `"none"`, then the exact version of the app you specify must be available in the App Repository. In this case, a full initial version number must be specified. <br /><br />For other `"allowedUpdates"` values, it's enough that an app with a higher or equal [build].[revision] part of the version is available in the App Repository. You don't need to specify a full version number -- [major].[minor] and [major].[minor].[revision] are also accepted. This applies to the App versions uploaded either by you or by other publishers who own the apps.|
| allowedUpdates| Enum |Allowed values: none, hotfix, minor, all. <br /><br />You can set up rules that determine which app version to use for the new signups. You can also specify whether updating of the installed app is allowed.<ul><li>`"none"`: It won't be possible to apply any new versions to this app inline (only side by side).  Only the application version that exactly matches the specified initial version number will be used for the new signups.</li><li>`"hotfix"`: You allow hot fixing this app with newer hotfix versions, that is, versions with a higher build and revision numbers than in the `"initialVersion"`, but with the same major and minor version. New signups and environments you upgrade to this deployment will automatically get the latest available hotfix version of the app installed.</li><li>`"minor"`: Customers can view and install newer applicable minor (or hotfix) versions of the app via the Business Central Administration Center. New signups and environments that you upgrade to this deployment will automatically get the latest available hotfix version of the app installed. Minor updates won't be automatically installed. They must be installed by the newly signed-up customers using the Business Central Administration Center. </li><li>`"all"`: Customers can view and install all newer applicable versions of the app via the Business Central Administration Center. New signups and environments that you upgrade to this deployment will automatically get the latest available hotfix version of the app installed.</li></ul> |
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
                     "initialVersion":  "16.1", 
                     "name":  "System Application", 
                     "publisher":  "Microsoft", 
                     "allowedUpdates":"hotfix", 
                     "publishOnly":  false, 
                     "blockUninstall":  true 
                 },
                 { 
                     "id":  "201e5067-99cc-4974-900a-b50bd4fbe777", 
                     "initialVersion":  "16.1.5", 
                     "name":  "Fabrikam Rentals Add-on", 
                     "publisher":  "Fabrikam", 
                     "allowedUpdates":"minor", 
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

## Creating the deployment package zip file

After you have all the components of the deployment package ready, you can package them into a .zip archive. The deployment package (.zip) can't include any additional subfolders and files and must have the following structure:

```
[FOLDER] branding/
  - favicon.ico 
  - splash.png (or .gif) 
  - splash_narrow.png (or .gif) 
  - header.png (or .gif) 

[FOLDER] databases/ 
  - app.bacpac 
  - tenant.bacpac

manifest.json
```

Now, you can deploy your package to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online service. See [Managing Embed Apps in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md) for more information. 

## See Also

[Embed App Overview](../deployment/embed-app-overview.md)  
[Qualification and Onboarding](../deployment/embed-app-qualifications-onboarding.md)  
[Managing Embed Apps in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md)  
