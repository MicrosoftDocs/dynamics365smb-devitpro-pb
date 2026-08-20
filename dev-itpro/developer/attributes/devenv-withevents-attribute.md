---
title: "WithEvents attribute"
description: "Sets whether a DotNet variable subscribes to the events published by a .NET Framework type."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# WithEvents attribute
> **Version**: _Available or changed with runtime version 1.0._

Sets whether a DotNet variable subscribes to the events published by a .NET Framework type.

> [!NOTE]
> This attribute is supported only in Business Central on-premises.

## Applies to

- Variable


## Syntax

```AL
[WithEvents]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can subscribe only to events exposed by global `DotNet` variables marked with `[WithEvents]`. For each marked variable, the compiler exposes the type's events as triggers on the variable. Declare the triggers by using the `{VariableName}::{EventName}(...ParameterList)` syntax. IntelliSense suggests event names and fills in the parameter list.

## Related information

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
