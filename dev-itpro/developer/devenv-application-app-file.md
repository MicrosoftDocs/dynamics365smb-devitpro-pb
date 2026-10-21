---
title: The Microsoft_Application.app File
description: Learn how the Application app groups Business Central solution dependencies and how to reference it from extensions or a code-customized base application.
ms.author: solsen
ms.date: 01/16/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# The Microsoft_Application.app file

The `Microsoft_Application_<version>.app` file groups the application dependencies that make up a [!INCLUDE[prod_short](includes/prod_short.md)] solution. Extensions can reference this solution through the `application` property in `app.json` instead of declaring separate dependencies on its application packages.

The file is included with [!INCLUDE[prod_short](includes/prod_short.md)] in the `\Applications\Application\Source` folder. Its manifest name is `Application`, even though the package file name includes a publisher and version.

For code-customized base applications, an Application app can reference the customized Base Application instead of the Microsoft Base Application. Extensions that use the `application` property can then resolve their dependencies through that Application app.

> [!NOTE]
> The partner who customizes the application must ensure that dependent extensions compile and work. Resolving dependencies doesn't guarantee compatibility with changed application code.

> [!IMPORTANT]
> Give the customized Application app its own app ID and publisher. Keep `"name": "Application"` and `"propagateDependencies": true`. Set its version to the Microsoft Base Application version with which the solution is compatible. The Application app's own ID must be distinct from the ID of its Base Application dependency.

## Customize the Application app manifest

The Microsoft Application app references the System Application, Business Foundation, and Base Application. The following example shows the relevant manifest settings.

The examples use `29.0.0.0` as an illustrative target version, not as a requirement for every extension. Use the versions and app IDs from your target application packages. The GUIDs and the `BusinessFoundationAppId` placeholder are example values.

```json
{
    "id": "00001111-aaaa-2222-bbbb-3333cccc4444",
    "name": "Application",
    "publisher": "Microsoft",
    "version": "29.0.0.0",
    "propagateDependencies": true,
    "dependencies": [
        {
            "id": "11112222-bbbb-3333-cccc-4444dddd5555",
            "name": "Base Application",
            "publisher": "Microsoft",
            "version": "29.0.0.0"
        },
        {
            "id": "22223333-cccc-4444-dddd-5555eeee6666",
            "name": "System Application",
            "publisher": "Microsoft",
            "version": "29.0.0.0"
        },
        {
            "id": "<BusinessFoundationAppId>",
            "name": "Business Foundation",
            "publisher": "Microsoft",
            "version": "29.0.0.0"
        }
    ]
}
```

To reference a code-customized base application, change the Base Application dependency's `id`, `name`, `publisher`, and `version` to match that application's manifest. Keep the other dependencies required by your solution. The following example shows a customized Application app.

```json
{
    "id": "00001111-aaaa-2222-bbbb-3333cccc4444",
    "name": "Application",
    "publisher": "Fabrikam",
    "version": "29.0.0.0",
    "propagateDependencies": true,
    "dependencies": [
        {
            "id": "11112222-bbbb-3333-cccc-4444dddd5555",
            "name": "Customized Base Application",
            "publisher": "Fabrikam",
            "version": "29.0.0.0"
        },
        {
            "id": "22223333-cccc-4444-dddd-5555eeee6666",
            "name": "System Application",
            "publisher": "Microsoft",
            "version": "29.0.0.0"
        },
        {
            "id": "<BusinessFoundationAppId>",
            "name": "Business Foundation",
            "publisher": "Microsoft",
            "version": "29.0.0.0"
        }
    ]
}
```

## Reference the Application app from an extension

Use the `application` property to specify the minimum application version that your extension supports. Remove direct dependencies on the Microsoft Base Application and System Application from `dependencies`. Learn more about manifest settings in [JSON files](devenv-json-files.md).

The Application app propagates its dependencies to your extension. This abstraction reduces the dependency changes needed when a solution moves functionality between application packages. It can also support code-customized on-premises applications and Embed App solutions, provided that those solutions remain compatible with your extension.

Your extension's own version is separate from its minimum application version, as shown in this example.

```json
{
    "id": "00001111-aaaa-2222-bbbb-3333cccc4444",
    "name": "Fabrikam Gadgets Management",
    "publisher": "Fabrikam",
    "version": "1.0.0.0",
    "application": "29.0.0.0",
    "dependencies": []
}
```

> [!IMPORTANT]
> Marketplace apps must specify the `application` property. AppSourceCop reports AS0100 when the property is missing for runtime 4.3 or later. It reports AS0085 when an app declares explicit dependencies on the Microsoft Base Application or System Application. Learn more in [AppSourceCop rule AS0100](analyzers/appsourcecop-as0100.md) and [AppSourceCop rule AS0085](analyzers/appsourcecop-as0085.md).

## Related information

[JSON files](devenv-json-files.md)  
[AppSourceCop rule AS0100](analyzers/appsourcecop-as0100.md)  
[AppSourceCop rule AS0085](analyzers/appsourcecop-as0085.md)  
[Install an update](../upgrade/upgrading-cumulative-update-v15.md)  
[Understand app identity for AL apps](devenv-app-identity.md)  
