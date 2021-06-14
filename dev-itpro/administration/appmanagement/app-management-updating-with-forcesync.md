---
title: "Updating an App Version by Using ForceSync"
description: Learn how to synchronize a new app version that includes breaking changes.
author: jswymer
ms.custom: na
ms.date: 06/10/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Upgrading an App by Using ForceSync

This article provides guidelines for using ForceSync option to upgrade an app to a version that introduces breaking changes.

## Overview

When you upgrade an app to a new version, the database is synchronized with any schema changes introduced by the new app version. Under normal operation, if the app introduces any breaking changes, like removing a field or changing its data type, the synchronization will fail, preventing the upgrade. However, the service includes a property called `syncMode` that you can set to `"ForceSync"`, which will apply the breaking changes. If you're familiar with Business Central on-premises, this operation is similar to using the [Sync-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) with `-mode ForceSync` parameter.

This property only works with side-by-side upgrades using [Microsoft Lifecycle Services](https://lcs.dynamics.com/v2) (LCS). You can't use it for breaking changes in a hotfix pushed from App Management API. So make sure you plan your changes when preparing new minor or major upgrades.

> [!IMPORTANT]
> Use this option with caution. When you use the `syncMode = "ForceSync"`, it applies breaking changes forcefully, typically deleting the data in the objects that have new schema. It can also break other apps that run on top of your objects. Before using this option in production, test it on both on-premises and online (using Sandboxes). It's also recommended that you export a BACPAC of your production environment from the Business Central admin center before the upgrade.

## Upgrade an app version using ForceSync

1. Using the App Management API, upload a new app version as usual.

    For more information, see [App Management API - Upload Version](app-management-api.md#upload-version). 
2. In [Microsoft Lifecycle Services](https://lcs.dynamics.com/v2), create a new deployment that will use new app version.
3. Using Windows PowerShell, issue PATCH request, like the following example, to change the `syncMode` property on the app version:

   ```powershell
   $version = 'target_version'
   $url = https://apps.businesscentral.dynamics.com/v1.3/apps/$appID/countries/$country/versions/$version
   $body = @{   
     syncMode = "ForceSync"
   } 

   Invoke-WebRequest -Uri $url -Headers $headers -Body (ConvertTo-Json $body) -Method Patch
   ```

   Replace `target_version` with the new version of your app, for example, 18.0.23456.21212. 

4. In LCS, upgrade an environment from the old version to the new version. The new app version will be upgraded using ForceSync.

You can always switch to the normal sync mode for an app issuing another PATCH request that sets the `syncMode` to `"Sync"`:

```
{
"syncMode": "Sync"
}
```

## See Also

[App Management API](app-management-api.md)  
[Manage Apps in the Business Central Administration Center](../tenant-admin-center-manage-apps.md)   
