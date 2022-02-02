---
title: "PerTenantExtensionCop Error PTE0005"
description: "'Internal' is a reserved usage for the 'target' property."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
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
# PerTenantExtensionCop Error PTE0005
Property 'target' has invalid value.

## Description
'Internal' is a reserved usage for the 'target' property.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

This rule validates that the manifest of your extension (app.json) specifies a compilation target that is allowed in a multi-tenant SaaS environment,
For more information, see [JSON files](../devenv-json-files.md) and [Compilation Scope Overview](../devenv-compilation-scope-overview.md).

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

The following manifest specifies `Cloud` as compilation target and is then allowed in a multi-tenant SaaS environment. 

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
[PerTenantExtensionCop Analyzer](pertenantextensioncop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  