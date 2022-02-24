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

### Identity requirements

- Changing the App ID 
  - This means that the data won't be available anymore, see below.
  - This means that dependent extensions will need to be updated to use the new App ID in their `app.json` file.
- Changing the name, publisher, or version to make sure that there is no PTE and an AppSource with same name, publisher, and version.

### AppSource requirements

- Changing the ID of all objects to be in the AppSource range. PTEs are using a different range.
- Use affixes, except for PTEs, they are not required to use affixes.
- Full list:  
  - [Technical Validation Checklist](devenv-checklist-submission.md)
  - [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md)
    
<!-- the same extension cannot be installed as a pte and global on an env. Object name will collied -->

> [!NOTE]  
> If you want to move the data by having the two apps installed side-by-side, then you must ensure that the two apps (AppSource and PTE) can be installed side-by-side. For this, they must not share any object names nor IDs.  
> All dependent extensions will have to be updated to use the new App ID in their `app.json` file and to reference the objects defined in the extension by their new name and object ID.


## Moving a DEV extension to AppSource

Scenario: You are done developing a new offer or a new version of an existing offer and are now ready to make it available for all your customers in SaaS.

> []  
> When publishing to AppSource, it is recommended to enable the AppSourceCop analyzer. For more information, see [AppSourceCop](analyzers/appsourcecop.md).

### Identity requirements

- Changing the version of the app before submitting to AppSource.
- Or, unpublishing the DEV extension before submitting to AppSource.

### AppSource requirements

- Make sure that the ID of all objects to be in the AppSource range (DEVs don't have range limitation)
- Use affixes (DEVs are not required to use affixes)
- Full list:
  - [Technical Validation Checklist](devenv-checklist-submission.md)
  - [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md)


## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[Extension Types and Scope](devenv-extension-types-and-scope.md)