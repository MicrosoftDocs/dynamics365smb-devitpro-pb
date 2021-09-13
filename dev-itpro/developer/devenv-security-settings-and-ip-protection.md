---
title: "Security Setting and Resource Exposure Policy"
description: This topic explains how to set the security and resource exposure policy against downloading or debugging into extension to see the source code.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Security Setting and Resource Exposure Policy

When developing an extension, your code is by default protected against downloading or debugging. Read below about the security setting and adding Intellectual Property (IP) protection against downloading or debugging into an extension to see the source code in the extensions.

The extension development package provides a pre-configured setting for protection against viewing or downloading the code of the extensions. However, this setting can also be controlled in the manifest; the `app.json` file.

## Resource Exposure Policy

> [!NOTE]  
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 2, the `ShowMyCode` setting has been replaced by the `resourceExposurePolicy` setting which offers a richer access control. The `ShowMyCode` will be deprecated in a future release and cannot be used together with the `resourceExposurePolicy` setting. If `ShowMyCode` is set, default values for `resourceExposurePolicy` will be applied (`false`).

When you start a new project, an `app.json` file is generated automatically, which contains the information about the extension that you are building on. In the `app.json` file you can specify a setting called `resourceExposurePolicy` that defines the accessibility of the resources and source code during different operations. `resourceExposurePolicy` specifies the following list of options: `allowDebugging`, `allowDownloadingSource`, and `includeSourceInSymbolFile`. Each of these properties define the specific areas in which the source code of an extension can be accessed. All of the options are by default set to `false` which means that by default no dependent extension can debug or download the source code of your extension. The syntax of the `resourceExposurePolicy` setting is the following:

```al
`"resourceExposurePolicy": {"allowDebugging": <boolean>, "allowDownloadingSource": <boolean>, "includeSourceInSymbolFile": <boolean>}`
```

> [!NOTE]  
> The `resourceExposurePolicy` setting is not visible in the `app.json` file when it is generated. If you want to change the default value from `false`, you must add the setting as shown in the syntax example above.

### allowDebugging

To allow debugging into your extension, when the extension is taken as a dependency, you must set the `allowDebugging` flag to `true`, otherwise debugging and Go to Definition to view the code is now allowed. For a more refined setting, you can specify the `NonDebuggable` attribute on methods and variables. For more information, see [NonDebuggable Attribute](attributes/devenv-nondebuggable-attribute.md).

> [!NOTE]  
> `allowDebugging` does not apply to [Profiles](devenv-profile-object.md), [Page Customizations](devenv-page-customization-object.md) and [Views](devenv-views.md), because these objects cannot define any custom logic in procedures or triggers. The code for Profiles, Page Customizations, and Views defined in an extension with `allowDebugging` set to **false** can still be accessed and copied using [Designer](devenv-inclient-designer.md).

> [!NOTE]  
> Even though `allowDebugging` is set to **false**, you will still be able to view that code if an extension is deployed through Visual Studio Code, as opposed to deploying using a cmdlet or via AppSource.


#### Changing the allow debugging setting

If you want to allow debugging into your extension to view the source code, you can add the `allowDebugging` property in the `app.json` file and set the property value to **true**. For example, if a developer develops extension A and he or someone else on the team develops extension B, and B depends on A, then debugging B will only step into the code for A if a method from A is called and if the `allowDebugging` flag is set to **true** in the app.json for extension A as shown in the example below:

```json
`"resourceExposurePolicy": {"allowDebugging": true}`
```

By adding this setting, you *enable debugging* into an extension to view the source code when that extension is set as a dependency.


### allowDownloadingSource

When this is set to `true` in the `app.json` file of extension A, the source code of extension A can be downloaded, for example, from the **Download Source** option in the **Extension Management** page in [!INCLUDE[prod_short](includes/prod_short.md)].

### includeSourceInSymbolFile

When this is set to `true` in the `app.json` file of extension A, the downloaded symbol file in Visual Studio Code using the **Downloading Symbols** functionality, contains symbols and the source code of extension A.


## See Also

[JSON Files](devenv-json-files.md)  
[AL Development Environment](devenv-reference-overview.md)  
[NonDebuggable Attribute](attributes/devenv-nondebuggable-attribute.md)  