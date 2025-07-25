---
title: App identity
description: Describes what makes up the app identity of an app for Business Central.
author: SusanneWindfeldPedersen
ms.date: 05/03/2024
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# App identity

Apps built using AL extend the functionality of [!INCLUDE[prod_short](../includes/prod_short.md)]. The `app.json` file is, together with the `launch.json` file, automatically generated when you create a new AL project. The `app.json` file contains information about the app that you're building, such as publisher information and specifies the minimum version of base application objects that the extension is built on. Often the `app.json` file is referred to as the *manifest*. The `app.json` file contains numerous project settings, but a few of them constitutes the actual identity of the app that you're creating.

> [!NOTE]  
> With [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 2, `name` and `publisher` are no longer considered part of the app identity and can therefore be changed to reflect branding or acquisition, for example. If the `name` and/or `publisher` information is changed, the `version` must also be incremented. If you're using workspaces with multiple projects and change the `name` or `publisher` of an extension in the workspace, the dependencies in the app.json file must be updated with the new name and publisher or you might encounter issues with reference resolution. Learn more in [Working with multiple projects and project references](devenv-work-workspace-projects-references.md).

> [!IMPORTANT]  
> In cases where the Application app is substituted with another application app, the `name` is still used as identification. Learn more in [The Microsoft_Application.app File](devenv-application-app-file.md).

|Setting|Example|Description|
|-------|------|-----|
|`id`   |`"id": "ef4dabfc-1de7-4d90-b948-4a9c2933d794"`| The `id`, also known as the app ID. This is a GUID, which is autogenerated when the project is created. The app ID is also bound to how tables are named in [!INCLUDE[prod_short](../includes/prod_short.md)] and how the identity of an application is computed. Changing the app ID might have severe consequences, such as the app not functioning properly, or data not being available.|
|`version`|`"version": "1.0.0.0"`| The version is used to distinguish between different iterations of your app. The version number should increase as you make changes to your app.|

For more settings, see [JSON files](devenv-json-files.md).

For apps published in the `Global` scope, see [Publish NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp), such as AppSource and first party applications, the `id` and the `version` identify a unique application package. The [!INCLUDE[prod_short](../includes/prod_short.md)] service uses these tuples to refer to apps in different flows. To prevent issues, it's *required* that the `id` remains the same after an app is uploaded to the [!INCLUDE[prod_short](../includes/prod_short.md)] service, and that you only increment the `version`.

For apps published in the `Tenant` scope, see [Publish NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp), such as per-tenant customizations, in addition to the `id` and `version`, the `tenant ID` is also used to uniquely identify an app.

## When is it okay to change the ID of an app?

The `id` of an app is automatically generated by the AL Language extension when you create a new app or if you use the **AL: Generate manifest** command. 

If you have copied the app or the manifest from another app, you must change the `id` before publishing it to the online service as a per-tenant extension or AppSource app.

After the app has been published, you should only change the `id` if you intend to use the code base to develop a new app. You won't be able to upgrade from the app with the old `id` to the app with the new `id` because the system doesn't have knowledge about the correspondence.

If you have published your app as a per-tenant extension, but you're now considering publishing it to AppSource, you must assign a new `id` to the AppSource app, and ensure that it follows all the technical requirements for publishing to AppSource. Learn more in [Moving between extension scopes](devenv-extension-moving-scope.md).

It's recommended to use a different `id` for the app that you publish from Visual Studio Code or to the container. Once you're satisfied with the quality of your app and ready to publish it to AppSource, it's recommended to use a different `id`. If you don't follow this approach, the app that you have published from Visual Studio Code to a developer sandbox will be automatically unpublished if another user tries to install the AppSource app. Learn more in [Moving between extension scopes](devenv-extension-moving-scope.md).

## When is it okay to change the name of an app?

If you're targeting only Business Central 2021 release wave 2 or later, the `name` of an app can be changed at any point also after it has been published. If the `name` is changed, the `version` must be incremented as well.

If you're targeting versions of Business Central earlier than 2021 release wave 2, then the `name` of an app can't be changed after it has been published.

## When is it okay to change the publisher of an app?

If you're targeting only Business Central 2021 release wave 2 or later, the `publisher` of an app can be changed at any point also after it's published. If the `publisher` is changed, the `version` must be incremented as well.

If you're targeting versions of Business Central earlier than 2021 release wave 2, then the `publisher` of an app can't be changed after it has been published.

## When is it okay to change the version of an app?

The `version` must be incremented anytime a new version of your app is uploaded to AppSource or as a per-tenant extension. While developing it in Visual Studio Code, you can keep using the same version and iterate on your code.

> [!NOTE]  
> In a Visual Studio Code workspace an app's `name`, `publisher`, and `version` are part of identifying a project and a project dependency. Therefore, if any of these properties change, it's recommended that you reload the workspace.
 
## Related information

[JSON files](devenv-json-files.md)  
[Publish NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp)  
[Working with multiple projects and project references](devenv-work-workspace-projects-references.md)  
