---
title: "Moving Between Extension Scopes"
description: ""
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

Scenario: You have deployed your extension for selected customers as a PTE and are now aiming at covering more markets by deploying it as an AppSource app.

### Identity requirements for the PTE

- Changing the App ID 
  - This means that the data won't be available anymore, see below.
  - This means that dependent extensions will need to be updated to use the new app ID in their `app.json` file.
- Changing the name, publisher, or version to make sure that there is no PTE and an AppSource with same name, publisher, and version.

### AppSource requirements for the PTE to become an AppSource app

- Changing the ID of all objects to be in the AppSource range. PTEs are using a different range.
- Use affixes, except for PTEs, they are not required to use affixes.
- Full list:  
  - [Technical Validation Checklist](devenv-checklist-submission.md)
  - [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md)
    
<!-- the same extension cannot be installed as a pte and global on an env. Object name will collied -->

### Other information about the PTE

> If you want to move the data by having the two apps installed side-by-side, then you must ensure that the two apps (AppSource and PTE) can be installed side-by-side. For this, they must not share any object names nor IDs.  
> All dependent extensions will have to be updated to use the new App ID in their `app.json` file and to reference the objects defined in the extension by their new name and object ID.


## Moving a DEV extension to AppSource

Scenario: You are done developing a new offer or a new version of an existing offer and are now ready to make it available for all your customers in SaaS.

> [!NOTE]  
> When publishing to AppSource, it is recommended to enable the AppSourceCop analyzer. For more information, see [AppSourceCop](analyzers/appsourcecop.md).

### Identity requirements for the DEV extension

- Changing the version of the app before submitting to AppSource.
- Or, unpublishing the DEV extension before submitting to AppSource.

### AppSource requirements for the DEV extension to become an AppSource app

- Make sure that the ID of all objects to be in the AppSource range (DEVs don't have range limitation)
- Use affixes (DEVs are not required to use affixes)
- Full list:
  - [Technical Validation Checklist](devenv-checklist-submission.md)
  - [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md)


## Publishing an AppSource app as a DEV extension

Scenario: Showing a preview of an app to a customer or developing the next version of the app.

Publishing an AppSource app to a sandbox environment as DEV extension is common scenario when you want to show a previews of your app to a customer or during active development.

There are few requirements that every AL developer should have in mind when publishing an AppSource app as a DEV extension.

- DEV extensions should have different IDs because there might be other global apps published to your service and they will collide.
- A DEV extension cannot replace an AppSource app if another AppSource app depends on that particular AppSource app. If you want to achieve such functionality the whole chain of dependencies should be published as non-global apps (PTE or DEV).  
    > [!IMPORTANT]  
    > It is highly recommended to not try to replace an AppSource app.

DEV extensions, as the name presumes, are used for development purposes and this is the reason why you can control their lifecycle (publish, install, upgrade, and more). Many AL developers use DEV extensions to test their global apps and we highly advise them to not use the same app ID as their (future) AppSource app. Testing scenarios might include replacing one or more AppSource apps in your chain of dependencies with DEV extensions, however every AL developer should have in mind that the system doesn't allow replacement of AppSource app with DEV extension if another AppSource app depend on the first AppSource app. 

### Identity requirements for the AppSource app to become a DEV extension

There are no specific identity requirements.

## Moving a DEV extension to a PTE

Scenario: Deploying your app to a production environment.

### Identity requirements for moving a DEV extension to a PTE

No specific identity requirements.

### PTE requirements for moving the DEV extension

Enabling the [PerTenantExtensionCop Analyzer](analyzers/pertenantextensioncop.md).

## Moving an AppSource app as PTE

Scenario: Reducing the availability of your app to select customers.

### Identity requirements for moving an AppSource app to a PTE

- Changing the App ID
  - This means that the data won't be available anymore (see below)
  - This means that dependent extensions will need to be updated to use the new App ID in their `app.json` file.
  - If deprecating the offer, see [Discontinuing an AppSource app](devenv-app-discontinue.md).

### PTE requirements for moving the AppSource app

- Changing the ID of all objects to be in the PTE range (AppSource apps are using a different range)
- [PerTenantExtensionCop Analyzer](analyzers/pertenantextensioncop.md)

### Other information about the AppSource app

- Even if you stop distributing the offer in Partner Center, the app still exists in Business Central and the App ID remains reserved for it. It then cannot be attributed to the PTE.
- If you want to move the data by having the two apps installed side-by-side, then you must ensure that the two apps (AppSource and PTE) can be installed side-by-side. For this, they must not share any object names nor IDs.
- All dependent extensions will have to be updated to use the new App ID in their app.json and to reference the objects defined in the extension by their new Name / Object ID.


## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[Extension Types and Scope](devenv-extension-types-and-scope.md)