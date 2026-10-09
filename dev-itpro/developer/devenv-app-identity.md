---
title: Understand App Identity for AL Apps
description: Learn how app IDs, versions, names, publishers, and tenant scopes identify AL apps and affect upgrades, dependencies, and data continuity.
author: SusanneWindfeldPedersen
ms.date: 10/09/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Manage the identity of an AL app

Apps built using AL extend the functionality of [!INCLUDE[prod_short](../includes/prod_short.md)]. The `app.json` and `launch.json` files are generated automatically when you create an AL project. The `app.json` file contains information about the app, including its publisher and the minimum version of the base application that it requires. The `app.json` file is often called the *manifest*. It contains many project settings, but only some settings define the identity of the app.

> [!NOTE]
> With [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 2, `name` and `publisher` are no longer considered part of the app identity and can therefore be changed to reflect branding or acquisition, for example. If you change either `name` or `publisher`, increment `version`. If you're using workspaces with multiple projects and change the `name` or `publisher` of an extension in the workspace, update the dependencies in the `app.json` file with the new name and publisher or you might encounter issues with reference resolution. Learn more in [Working with multiple projects and project references](devenv-work-workspace-projects-references.md).

> [!IMPORTANT]
> In cases where the Application app is substituted with another application app, the `name` is still used as identification. Learn more in [The Microsoft_Application.app File](devenv-application-app-file.md).

|Setting|Example|Description|
|-------|------|-----|
|`id`   |`"id": "00001111-aaaa-2222-bbbb-3333cccc4444"`| The `id`, also known as the app ID. This GUID is generated automatically when the project is created. The app ID is also bound to how tables are named in [!INCLUDE[prod_short](../includes/prod_short.md)] and how the identity of an application is computed. Changing the app ID might have severe consequences, such as the app not functioning properly or data not being available.|
|`version`|`"version": "1.0.0.0"`| The version is used to distinguish between different iterations of your app. The version number should increase as you make changes to your app.|

For more settings, see [JSON files](devenv-json-files.md).

For apps published in the `Global` scope, such as Marketplace and first-party apps, the app ID identifies the app across versions. The app ID and version identify a published app version. The generated `.app` package also has its own package ID. The [!INCLUDE[prod_short](../includes/prod_short.md)] service uses these identifiers in different flows. To prevent issues, the app ID must remain the same after an app is uploaded to the service, and the version must only increase. Learn more in [Publish NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp).

For apps published in the `Tenant` scope, such as per-tenant extensions, the tenant ID is used together with the app ID and version to identify a published app version.

## When is it okay to change the ID of an app?

The AL Language extension automatically generates the `id` of an app when you create a new app or use the **AL: Generate manifest** command.

If you have copied the app or the manifest from another app, you must change the `id` before publishing it to the online service as a per-tenant extension or Marketplace app.

After the app has been published, you should only change the `id` if you intend to use the code base to develop a new app. You won't be able to upgrade from the app with the old `id` to the app with the new `id` because the system doesn't have knowledge about the correspondence.

If you have published your app as a per-tenant extension, but you're now considering publishing it to Marketplace, you must assign a new `id` to the Marketplace app, and ensure that it follows all the technical requirements for publishing to Marketplace. Learn more in [Moving between extension scopes](devenv-extension-moving-scope.md).

It's recommended to use a different `id` for the app that you publish from Visual Studio Code or to the container. Once you're satisfied with the quality of your app and ready to publish it to Marketplace, it's recommended to use a different `id`. If you don't follow this approach, the app that you have published from Visual Studio Code to a developer sandbox will be automatically unpublished if another user tries to install the Marketplace app. Learn more in [Moving between extension scopes](devenv-extension-moving-scope.md).

## When is it okay to change the name of an app?

If you're targeting only Business Central 2021 release wave 2 or later, the `name` of an app can be changed at any point also after it has been published. If the `name` is changed, the `version` must be incremented as well.

If you're targeting versions of Business Central earlier than 2021 release wave 2, then the `name` of an app can't be changed after it has been published.

## When is it okay to change the publisher of an app?

If you're targeting only Business Central 2021 release wave 2 or later, the `publisher` of an app can be changed at any point also after it's published. If the `publisher` is changed, the `version` must be incremented as well.

If you're targeting versions of Business Central earlier than 2021 release wave 2, then the `publisher` of an app can't be changed after it has been published.

## When is it okay to change the version of an app?

The `version` must be incremented anytime a new version of your app is uploaded to Marketplace or as a per-tenant extension. While developing it in Visual Studio Code, you can keep using the same version and iterate on your code.

> [!NOTE]
> In a Visual Studio Code workspace an app's `name`, `publisher`, and `version` are part of identifying a project and a project dependency. Therefore, if any of these properties change, it's recommended that you reload the workspace.

## Related information

[JSON files](devenv-json-files.md)  
[Publish NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp)  
[Working with multiple projects and project references](devenv-work-workspace-projects-references.md)  
