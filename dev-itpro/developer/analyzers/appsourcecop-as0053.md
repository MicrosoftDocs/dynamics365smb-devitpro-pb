---
title: "AppSourceCop Error AS0053"
description: "The compilation target of an application must be a value that is allowed in a multi-tenant SaaS environment."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0053
The compilation target of an application must be a value that is allowed in a multi-tenant SaaS environment

## Description
The compilation target of an application must be a value that is allowed in a multi-tenant SaaS environment.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

This rule validates that the manifest of your extension (app.json) specifies a compilation target that is allowed in a multi-tenant SaaS environment. For more information, see [JSON files](../devenv-json-files.md) and [Compilation Scope Overview](../devenv-compilation-scope-overview.md).

## How to fix this diagnostic?

You must set the value of `target` property in the manifest of your extension (app.json) to `Cloud`.

## Code example triggering the rule

The following manifest specifies `OnPrem` as compilation target and is then not allowed in a multi-tenant SaaS environment. 

```JSON
{
    "appId": "<some-guid>",
    "name": "MyApp",
    "publisher": "MyPublisher",
    "version": "1.0.0.0",
    "target": "OnPrem"
}
```

## Code example not triggering the rule

The following manifest specifies `Cloud` as compilation target and is allowed in a multi-tenant SaaS environment. 

```JSON
{
    "appId": "<some-guid>",
    "name": "MyApp",
    "publisher": "MyPublisher",
    "version": "1.0.0.0",
    "target": "Cloud"
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  