---
title: "Using Access Modifiers in AL"
description: "Describes how the AL access modifiers can be used in code."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Using Access Modifiers in AL

Access modifiers are used to set accessibility of tables, table fields, codeunits, and queries, which controls whether the object can be used from other code in your module or other modules. Setting access to `internal` is linked to the [JSON Files](devenv-json-files.md) setting `internalsVisibleTo`. 

> [!NOTE]  
> In AL access modifiers are primarily intended for designing APIs and *cannot* be used as a security boundary.

You set the object accessibility by using the [Access Property](properties/devenv-using-access-modifiers.md). If the `Access` property is not specified; default is `Public`. 

The access modifiers that are available in AL are:

|Access Modifier| Description  |
|---------------|------|
|`internal`|The object or field can be accessed only by code in the same module, but not from another module. <br>**Note:** This accessibility level is controlled by the `internalsVisibleTo` setting. For more information, see [JSON Files](devenv-json-files.md)|
|`local`|he field can be accessed only by code in the same table or table extension where the field is defined. <br>**Note:** Applies to tables fields only.|
|`protected`|The field can be accessed only by code in the same table or tableextensions of that table. <br>**Note:** Applies to table fields only.|
|`public`|The object or field can be accessed by any other code in the same module and in other modules that references it. <br>**Note:** This is the default value.|


> [!IMPORTANT]  
> Access modifiers are only taken into consideration at compile time. For example, at compile time, a table with `Access = Internal` cannot be used from other modules that do not have access to the internals of the module where the table is defined, but at runtime, any module can access the table by using reflection-based mechanisms such as `RecordRef`. Setting the object accessibility level as `Access = Internal;` *cannot* be used as a security boundary. Also see [JSON Files](devenv-json-files.md#appjson).


RecordRef/FieldRef can access tables/fields by id. 
	TransferFields can copy internal fields by id.
	The OnRun trigger can be run on internal codeunits with Codeunit.Run(1020)
	... 

<!-- design time validation -->

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Access Property](properties/devenv-access-property.md)