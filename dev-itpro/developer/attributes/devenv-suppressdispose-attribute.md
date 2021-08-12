---
title: "SuppressDispose Attribute"
description: "Specifies if a Microsoft .NET Framework object that is defined by a DotNet variable is disposed when it goes out of scope."
ms.author: solsen
ms.custom: na
ms.date: 07/13/2021
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

# SuppressDispose Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies if a Microsoft .NET Framework object that is defined by a DotNet variable is disposed when it goes out of scope.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Applies To

- Variable


## Syntax

```AL
[SuppressDispose]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **SuppressDispose** attribute applies to local variables of the **DotNet** data type.  

When a local .NET Framework object is disposed, it cannot be assigned outside the scope of its local function. If you want to assign the local **DotNet** variable to a global AL or .NET.

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  