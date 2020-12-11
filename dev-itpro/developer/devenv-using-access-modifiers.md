---
title: "Using Access Modifiers in AL"
description: "Describes how the AL access modifiers can be used in code."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/20/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Using Access Modifiers in AL

Access modifiers are used to set accessibility of tables, table fields, codeunits, and queries, which controls whether the object can be used from other code in your module or other modules. Access modifiers in AL are designed to create solid APIs, by limiting the symbols that dependant modules can take a reference on. Limiting the API surface can hide implementation details and allow for later refactoring of code without breaking external code.

You set the object accessibility by using the [Access Property](properties/devenv-access-property.md). If the `Access` property is not specified; default is `Public`. 

> [!NOTE]  
> In AL access modifiers are primarily intended for designing APIs and *cannot* be used as a security boundary.

## Access modifiers 

The access modifiers that are available in AL are:

|Access Modifier| Description  |
|---------------|------|
|`internal`|The object or field can be accessed only by code in the same module, but not from another module. <br>**Note:** This accessibility level is controlled by the `internalsVisibleTo` setting. For more information, see [JSON Files](devenv-json-files.md)|
|`local`|The field can be accessed only by code in the same table or table extension where the field is defined. <br>**Note:** Applies to tables fields only.|
|`protected`|The field can be accessed only by code in the same table or tableextensions of that table. <br>**Note:** Applies to table fields only.|
|`public`|The object or field can be accessed by any other code in the same module and in other modules that references it. <br>**Note:** This is the default value.|

Setting access to `internal` is linked to the [JSON Files](devenv-json-files.md) setting `internalsVisibleTo`. 

> [!IMPORTANT]  
> Access modifiers are only taken into consideration at compile time. For example, at compile time, a table with `Access = Internal` cannot be used from other modules that do not have access to the internals of the module where the table is defined, but at runtime, any module can access the table by using reflection-based mechanisms such as `RecordRef`, or `TransferFields`. And the `OnRun` trigger can be run on `internal` codeunits by using `Codeunit.Run`. Setting the object accessibility level as `Access = Internal;` *cannot* be used as a security boundary. Also see [JSON Files](devenv-json-files.md#Appjson).

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Access Property](properties/devenv-access-property.md)
