---
title: "RunOnClient attribute"
description: "Sets whether a .NET object that is defined by a variable is run on the Business Central Web client or Dynamics 365 Business Central service."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# RunOnClient attribute
> **Version**: _Available or changed with runtime version 1.0._

Sets whether a .NET object that is defined by a variable is run on the Business Central Web client or Dynamics 365 Business Central service.

> [!NOTE]
> This attribute is supported only in Business Central on-premises.

## Applies to

- Variable


## Syntax

```AL
[RunOnClient]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `RunOnClient` attribute applies to variables of the `DotNet` data type and is supported only in Business Central on-premises.

When you add `[RunOnClient]`, supported client API providers are routed to the web client instead of Business Central Server. Use the attribute with client APIs that provide device capabilities, such as the camera or location. Arbitrary .NET objects can't be instantiated on the web client.

The attribute is part of .NET interoperability in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. .NET interoperability lets AL code call methods and properties in a .NET assembly by defining a variable for a class in that assembly.

## Example

For an example of the `RunOnClient` attribute, see [Implement the camera in AL](../devenv-implement-camera-al.md#example).

## Related information
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
