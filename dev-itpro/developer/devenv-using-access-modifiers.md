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

Access modifiers are used to set accessibility of tables, table fields, codeunits, and queries, which controls whether the object can be used from other code in your module or other modules.

> [!NOTE]  
> In AL access modifiers are primarily intended for designing APIs and cannot be used as a security boundary.

The [Access Property](properties/devenv-using-access-modifiers.md) must be used to set this accessibility. If the `Access` property is not specified, the default is `Public`. The access modifiers that are available are:

internal
local
protected
public

Depending on the 


	
RecordRef/FieldRef can access tables/fields by id. 
	TransferFields can copy internal fields by id.
	The OnRun trigger can be run on internal codeunits with Codeunit.Run(1020)
	... 

<!-- design time validation -->

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Access Property](properties/devenv-access-property.md)