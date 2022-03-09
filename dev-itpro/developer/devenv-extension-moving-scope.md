---
title: "Moving Between Extension Scopes"
description: "Describes how an extension in one scope can be moved into another scope in Business Central."
ms.custom: na
ms.author: solsen
ms.date: 02/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# Moving Between Extension Scopes

This topic describes the different options you have for moving an app from one scope to another.

For a definition of the different extension types and their scope, see [Extension Types and Scope](devenv-extension-types-and-scope.md).

## Moving a PTE to AppSource

**Scenario:** You have deployed your extension for selected customers as a PTE and are now aiming at covering more markets by deploying it as an AppSource app.

### Identity requirements for moving a PTE to AppSource

- It is not possible to deploy an AppSource app and a PTE with the same `id`. You must then change the `id` of the extension before uploading it to AppSource. This means that the data won't be available anymore for environments that had the PTE installed and are now using the AppSource app. Dependent extensions will also need to be updated to use the new app ID in their `app.json` file.

- Due to some current limitations in our service, it is not possible to have an AppSource app and a PTE extension with the same `name`, `publisher`, and `version`. You must then change the `name`, `publisher`, or `version` of the app before uploading it to AppSource.

### Additional requirements for moving a PTE to AppSource

- AppSource apps and PTEs are using different ID ranges. You must then change the ID of all the objects in your extension. For more information, see [Object Ranges](devenv-object-ranges.md).

- AppSource apps are required to use affixes for their object names, while PTEs do not have any affix usage requirements. You might then have to rename all the objects in your extension to use affixes. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../compliance/apptest-prefix-suffix.md).

- You can find the full list of requirements for AppSource apps here:  
  - [Technical Validation Checklist](devenv-checklist-submission.md)
  - [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md)
    
<!-- the same extension cannot be installed as a pte and global on an env. Object name will collied -->

### Other information moving a PTE to AppSource

- If you want to move the data by having the two apps (PTE and AppSource app) installed side-by-side, then you must ensure that the two apps can be installed side-by-side. For this, they must not share any object names nor IDs. You can then define another PTE depending on both apps that would take care of moving the data.

- All dependent extensions will have to be updated to use the new `App ID` in their `app.json` file and to reference the objects defined in the extension by their new name and object ID.


## Moving a DEV extension to AppSource

**Scenario:** You are done developing a new offer or a new version of an existing offer and are now ready to make it available for all your customers in SaaS.

### Identity requirements for moving a DEV extension to AppSource

- It is not possible to deploy an AppSource app and a PTE with the same `id`. You must then change the `id` of the extension before uploading it to AppSource. This means that the data won't be available anymore for environments that had the PTE installed and are now using the AppSource app. Dependent extensions will also need to be updated to use the new app ID in their `app.json` file.

- Due to some current limitations in our service, it is not possible to have an AppSource app and a PTE extension with the same `name`, `publisher`, and `version`. You must then change the `name`, `publisher`, or `version` of the app before uploading it to AppSource.

> [!NOTE]  
> Alternatively, you can also uninstall and unpublish the DEV extension with this app `id` from your sandboxes environment. Make sure to select the option to delete the extension data and extension schema when uninstalling the extension.

### Additional requirements for moving a DEV extension to AppSource

- AppSource apps must use a specific ID range, while DEV extensions do not have any ID range limitation. You might then have to change the ID of all the objects in your extension. For more information, see [Object Ranges](devenv-object-ranges.md).

- AppSource apps are required to use affixes for their object names, while DEV extensions do not have any affix usage requirements. You might then have to rename all the objects in your extension to use affixes. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../compliance/apptest-prefix-suffix.md) 

- You can find the full list of requirements for AppSource apps here:  
  - [Technical Validation Checklist](devenv-checklist-submission.md)
  - [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md)


## Publishing an AppSource app as a DEV extension

**Scenario:** Showing a preview of an app to a customer or developing the next version of the app.

Publishing an AppSource app to a sandbox environment as DEV extension is common scenario when you want to show a previews of your app to a customer or during active development.

### Identity requirements for publishing an AppSource app as a DEV extension

- DEV extensions should have a different app `id` because there might be other global apps published to your service and they will collide. If you do not change the app `id`, the app that you have published from Visual Studio Code to a developer sandbox will be automatically unpublished from your environment if another user tries to install the AppSource app in their environment.

### Additional requirements for publishing an AppSource app as a DEV extension

- If you haven't changed the app `id` of the AppSource app in your DEV extension, to prevent publishing the DEV extension if another AppSource app depends on that particular AppSource app. If you want to achieve such functionality the whole chain of dependencies should be published as DEV extensions with different app `id`.

## Publishing a PTE as a DEV extension

**Scenario:** Showing a preview of an app to a customer or developing the next version of the app.

### Identity requirements for publishing a PTE as a DEV extension

No specific identity requirements.

### Additional requirements for publishing a PTE as a DEV extension

No specific requirements.

## Moving a DEV extension to a PTE

**Scenario:** Deploying your app to a production environment.

### Identity requirements for moving a DEV extension to a PTE

No specific identity requirements.

### Additional requirements for moving a DEV extension to a PTE

You can find the full list of requirements for PTE in the documentation for the [PerTenantExtensionCop Analyzer](analyzers/pertenantextensioncop.md).

## Moving an AppSource app to a PTE

**Scenario:** Reducing the availability of your app to select customers.

### Identity requirements for moving an AppSource app to a PTE

- It is not possible to deploy an AppSource app and a PTE with the same `id`. You must then change the `id` of the extension before uploading it the PTE. This means that the data won't be available anymore for environments that had the PTE installed and are now using the AppSource app. Dependent extensions will also need to be updated to use the new app ID in their `app.json` file.

- If you wish to deprecate the offer in AppSource, see [Discontinuing an AppSource app](devenv-app-discontinue.md).

### Additional requirements for moving an AppSource app to a PTE

- AppSource apps and PTEs are using different ID ranges. You must then change the ID of all the objects in your extension. For more information, see [Object Ranges](devenv-object-ranges.md).

- In order to avoid potential name conflicts if the AppSource app and the PTE are installed side-by-side, it is recommend to change the name of all the objects in your extension.

- You can find the full list of requirements for PTE in the documentation for the [PerTenantExtensionCop Analyzer](analyzers/pertenantextensioncop.md).

### Other information moving an AppSource app to a PTE

- Even if you stop distributing the offer in Partner Center, the app still exists in [!INCLUDE[prod_short](../includes/prod_short.md)] and the App ID remains reserved for it. It then cannot be attributed to the PTE.

- If you want to move the data by having the two apps (PTE and AppSource app) installed side-by-side, then you must ensure that the two apps can be installed side-by-side. For this, they must not share any object names nor IDs. You can then define another PTE depending on both apps that would take care of moving the data.

- All dependent extensions will have to be updated to use the new app `id` in their `app.json` file and to reference the objects defined in the extension by their new name and object ID.


## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[Extension Types and Scope](devenv-extension-types-and-scope.md)