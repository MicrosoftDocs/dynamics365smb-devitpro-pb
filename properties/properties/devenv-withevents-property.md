---
title: "WithEvents Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a25ffc9f-d2f1-4f60-8c54-85f21afb8854
caps.latest.revision: 8
author: SusanneWindfeldPedersen
ms.author: solsen
---

# WithEvents Property

Sets whether a DotNet variable subscribes to the events published by a .NET Framework type.  
  
## Applies to  

Variables of the **DotNet** data type.  

## Syntax

```AL
[WithEvents]
timer: DotNet MyTimer;
```

## Remarks

You can only subscribe to events that are emitted by global variables of the .NET type marked with the WithEvents property. For all the global variables that are marked with this property, the compiler will expose the events available on the type as triggers on the variable. The syntax for declaring these triggers is {VariableName}::{EventName}(...ParameterList), but IntelliSense will offer suggestions for the event name and autocomplete the parameter list.

<!--  
## See Also  
 [Automation Data Type](../datatypes/devenv-automation-data-type.md) 
 -->

## See Also

[Properties](devenv-properties.md)