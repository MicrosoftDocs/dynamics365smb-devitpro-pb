---
title: "The Microsoft_Application.app File"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# The Microsoft_Application.app File

The Microsoft_Application.app file is included with [!INCLUDE[prod_short](includes/prod_short.md)] and is located in the `\Applications\Application\Source` folder. The `Microsoft_Application.app` file logically encapsulates all of the extensions making up a solution, for example, version `16.0.0.0` of the base and system application package files, and it provides a convenient way to define and refer to this solution identity. 

> [!NOTE]  
> In previous versions the references to base and system application were stated explicitly under `dependencies` in the `app.json` file of the extension. Instead you must now use the `Application` version property in the `app.json` file. For more information, see [JSON Files](devenv-json-files.md).

The file name of the reference is `Microsoft_Application.app` and in the app.json file of the application package file, the name is `Application`. For code-customized base applications that have their own appId, the `Microsoft_Application.app` file can be modified to reference the appId of the code-customized base applications instead. This allows any extensions that are dependent on the `Application` to resolve to the custom appId. 

> [!NOTE]  
> The partner who redefines the application must ensure that extensions that are dependent on the `Application` compile and work. This can be ensured, for example, by not introducing any breaking changes.

> [!IMPORTANT]  
> If you have modified the `Microsoft_Application.app` file, you can rename the file name, and change information about the `publisher`, but it is important to keep `"name": "Application"` in the extension, which is what is being checked for in terms of symbols references. It is also important to keep the `propagateDependencies` set to `true`. The `version` must be set to the version of the Microsoft base application with which it is compatible.

## Changing the app.json file for a code-customized base application

The `app.json` file of the `Microsoft_Application.app` file looks like the following example for [!INCLUDE[prod_short](includes/prod_short.md)] version 15.3.

```json
{
    "id":  "c1335042-3002-4257-bf8a-75c898ccb1b8",
    "name":  "Application",
    "publisher":  "Microsoft",
    "version":  "15.3.40074.40254",
    "propagateDependencies":  true,
    "logo":  "ExtensionLogo.png",
    "privacyStatement":  "https://go.microsoft.com/fwlink/?LinkId=724009",
    "EULA":  "https://go.microsoft.com/fwlink/?linkid=2009120",
    "help":  "https://go.microsoft.com/fwlink/?linkid=2104024",
    "url":  "https://go.microsoft.com/fwlink/?LinkId=724011",
    "dependencies":  [
                         {
                             "appId":  "437dbf0e-84ff-417a-965d-ed2bb9650972",
                             "name":  "Base Application",
                             "publisher":  "Microsoft",
                             "version":  "15.3.0.0"
                         },
                         {
                             "appId":  "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
                             "name":  "System Application",
                             "publisher":  "Microsoft",
                             "version":  "15.3.0.0"
                         }
                     ],
    "screenshots":  [

                    ],
    "platform":  "15.0.0.0",
    "showMyCode":  true,
    "brief":  "Application (W1)"
}

```
If you have a code-customized base application, the file can be edited to reflect the dependency to this instead. To do so, update the `"dependencies": []` section and change the `"appId":  "437dbf0e-84ff-417a-965d-ed2bb9650972"` to the `appId` of your code-customized base application. You can update the `"name"` and `"publisher"` information to match too.

```json
...
"dependencies":  [
                         {
                             "appId":  "<appId of the code-customized base app>",
                             "name":  "Customized Base Application",
                             "publisher":  "PartnerSolutions",
                             "version":  "15.3.0.0"
                         },
                         ...
                     ],
...
```

## Uptaking the Application app

The Application app logically encapsulates apps making up a solution (such as Base Application and System Application), and provides an abstraction to protect the AppSource and PTE extensions running on top of that solution from not being able to resolve dependencies to these apps.

When using it, future refactoring of the referenced solution; like extracting some areas into separate apps, or changes to the identities of the apps which comprise the solution, will not be forcing all other dependent apps to change or add new apps to their dependencies, as these dependencies will be resolved implicitly via the reference to the Application app. 

Additionally, it is meant to simplify the on-premises upgrade scenarios, when customizations are extracted from the Base Application into extensions. And finally it makes it possible to make the same apps available not only to the [!INCLUDE[prod_short](includes/prod_short.md)] customers, but also to the customers of the rich, vertical solutions called Embed Apps, which are also running in the [!INCLUDE[prod_short](includes/prod_short.md)] service. 

To enable these benefits, all you need to do, as an AppSource or PTE app owner, is to add the `"application"` property in the `app.json` file of your app and provide the minimum Microsoft Base Application version that this app is compatible with. For more information, see [JSON Files](devenv-json-files.md). Also, you need to remove the direct dependencies to the Base Application and System Application from the `app.json` file. See the following example:

```json
{
    "id":  "e5645aaf-74be-453a-ab50-2e34ec3ee53c",
    "name":  "Fabrikam Gadgets Management",
    "publisher":  "Fabrikam",
    "version":  "15.3.41056.29085",
    "logo":  "ExtensionLogo.png",
    "privacyStatement":  "https://go.microsoft.com/fwlink/?LinkId=724009",
    "EULA":  "https://go.microsoft.com/fwlink/?linkid=2009120",
    "help":  "https://go.microsoft.com/fwlink/?linkid=2104024",
    "url":  "https://go.microsoft.com/fwlink/?LinkId=724011",
    "application": "15.3.0.0",
    "dependencies":  [
                     ],
    "screenshots":  [

                    ],
    "platform":  "15.0.0.0",
    "showMyCode":  true,
    "brief":  "Fabrikam Gadgets Mgt."
}

```

> [!IMPORTANT]  
> Soon up-taking the Application app will also be a mandatory requirement for AppSource apps, enforced by the AppSource technical validation. Thus it is highly recommended to change the existing AppSource apps at first convenience, for example with your next planned app update, and adopt the `"application"` property for all new AppSource apps. We also recommend up-taking the Application app for the customized Base Applications on-premise, and per-tenant-extensions (PTEs) that you use in the [!INCLUDE[prod_short](includes/prod_short.md)] online environments.


## See Also

[JSON Files](devenv-json-files.md)  
[Install an Update](../upgrade/upgrading-cumulative-update-v15.md)  
