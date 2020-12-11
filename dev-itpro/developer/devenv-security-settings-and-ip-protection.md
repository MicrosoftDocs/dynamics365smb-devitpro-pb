---
title: "Security Setting and IP Protection"
description: This topic explains how to set the security setting and IP protection against downloading or debugging into extension to see the source code.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/19/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Security Setting and IP Protection
When developing an extension, your code is by default protected against downloading or debugging. Read below about the security setting and adding Intellectual Property (IP) protection against downloading or debugging into an extension to see the source code in the extensions.

The extension development package provides a pre-configured setting for IP protection against viewing or downloading the code of the extensions. However, this setting can also be controlled in the manifest; the `app.json` file.

## IP protection setting
When you start a new project, an `app.json` file is generated automatically, which contains the information about the extension that you are building on. The `app.json` file contains a setting called `showMyCode`, which controls whether it is possible to debug into the extension, when that extension is taken as a dependency. The default value of this property is set to **false**. This means that debugging into an extension or going to definition to view the code is not allowed. For a more refined setting, you can specify the `NonDebuggable` attribute on methods and variables. For more information, see [NonDebuggable Attribute](methods/devenv-nondebuggable-attribute.md). 

`showMyCode` does not apply to [Profiles](devenv-profile-object.md), [Page Customizations](devenv-page-customization-object.md) and [Views](devenv-views.md), because these objects cannot define any custom logic in procedures or triggers. The code for Profiles, Page Customizations, and Views defined in an extension with `showMyCode` set to **false** can then still be accessed and copied using [Designer](devenv-inclient-designer.md).

> [!NOTE]  
> The `showMyCode` setting is not visible in the `app.json` file when it is generated. If you want to change the value, you must add the setting as shown in the code snippet below.

> [!NOTE]  
> Even though `showMyCode` is set to **false**, you will still be able to view that code if an extension is deployed through Visual Studio Code, as opposed to deploying using a cmdlet or via AppSource.

## Changing the IP protection setting
If you want to allow debugging into an extension to view the source code, you can add the `showMyCode` property in the `app.json` file and set the property value to **true**. For example, if a developer develops extension A and he or someone else on the team develops extension B, and B depends on A, then debugging B will only step into the code for A if a method from A is called and if the `ShowMyCode` flag is set to **true** in the app.json for extension A as shown in the example below:

```json
"showMyCode": true
```

By adding this setting, you *enable debugging* into an extension to view the source code when that extension is set as a dependency. 

## See Also  
[JSON Files](devenv-json-files.md)  
[AL Development Environment](devenv-reference-overview.md)  
[NonDebuggable Attribute](methods/devenv-nondebuggable-attribute.md)  