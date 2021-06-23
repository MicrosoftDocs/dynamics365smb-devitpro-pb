---
title: "WithEvents Attribute"
description: "Sets whether a DotNet variable subscribes to the events published by a ."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# WithEvents Attribute
> **Version**: _Available or changed with runtime version 1.0._

Sets whether a DotNet variable subscribes to the events published by a .NET Framework type.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Applies To

- Variable


## Syntax

```AL
[WithEvents]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can only subscribe to events that are emitted by global variables of the .NET type marked with the WithEvents property. For all the global variables that are marked with this property, the compiler will expose the events available on the type as triggers on the variable. The syntax for declaring these triggers is {VariableName}::{EventName}(...ParameterList), but IntelliSense will offer suggestions for the event name and autocomplete the parameter list.

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  