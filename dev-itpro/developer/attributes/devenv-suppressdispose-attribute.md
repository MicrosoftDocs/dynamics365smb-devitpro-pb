---
title: "SuppressDispose attribute"
description: "Specifies if a Microsoft .NET Framework object that is defined by a DotNet variable is disposed when it goes out of scope."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# SuppressDispose attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies if a Microsoft .NET Framework object that is defined by a DotNet variable is disposed when it goes out of scope.

> [!NOTE]
> This attribute is supported only in Business Central on-premises.

## Applies to

- Variable


## Syntax

```AL
[SuppressDispose]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `SuppressDispose` attribute applies to local variables of the `DotNet` data type.

Add `[SuppressDispose]` when the runtime must not call `Dispose` after the local variable goes out of scope. For example, use the attribute when external .NET code retains the object beyond the local variable's scope. Assigning the object to another AL `DotNet` variable doesn't require the attribute because the runtime tracks AL references to the object.

## Related information

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
