---
title: "PerTenantExtensionCop Error PTE0009"
description: "The properties 'helpBaseUrl' and 'supportedLocales' are reserved for translation apps."
ms.author: solsen
ms.custom: na
ms.date: 02/07/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PerTenantExtensionCop Error PTE0009
This app.json property must not be used for per-tenant extensions.

## Description
The properties 'helpBaseUrl' and 'supportedLocales' are reserved for translation apps.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

This rule validates that the manifest of your extension (app.json) does not specify the properties `helpBaseUrl` and `supportLocales`.
For more information, see [JSON files](../devenv-json-files.md) and [Working with Translation Files](../devenv-work-with-translation-files.md).

## How to fix this diagnostic?

You must remove the properties `helpBaseUrl` and `supportLocales` from the manifest of your extension (app.json).

## Code example triggering the rule

The following manifest specifies the properties `helpBaseUrl` and `supportLocales` and is then not valid.

```JSON
{
    "appId": "<some-guid>",
    "name": "MyApp",
    "publisher": "MyPublisher",
    "version": "1.0.0.0",
    "helpBaseUrl": "<some-url>",
    "supportedLocales": [ "en-US" ]
}
```

## Code example not triggering the rule

The following manifest does not specifies the properties `helpBaseUrl` and `supportLocales` and is valid.

```JSON
{
    "appId": "<some-guid>",
    "name": "MyApp",
    "publisher": "MyPublisher",
    "version": "1.0.0.0"
}
```


## See Also  
[PerTenantExtensionCop Analyzer](pertenantextensioncop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  