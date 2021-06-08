---
title: "InternalEvent Attribute"
description: "Specifies that the method is published as an internal event. It can only be subscribed to from within the same module."
ms.author: solsen
ms.custom: na
ms.date: 06/08/2021
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

# InternalEvent Attribute
> **Version**: _Available or changed with runtime version 4.0._

Specifies that the method is published as an internal event. It can only be subscribed to from within the same module.

## Applies To

- Method



## Syntax
```
[InternalEvent(IncludeSender: Boolean)]
```

### Parameters

*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies that the firing instance of the object is available as a parameter to subscribers of that event.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  