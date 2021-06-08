---
title: "IntegrationEvent Attribute"
description: "Specifies that the method is published as an integration type event."
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

# IntegrationEvent Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is published as an integration type event.


## Applies To

- Method



## Syntax
```
[IntegrationEvent(IncludeSender: Boolean, GlobalVarAccess: Boolean)]
```

### Parameters

*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.


*GlobalVarAccess*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether global variables in the object that contains the event publisher method are accessible to event subscriber methods that subscribe to the published event.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  