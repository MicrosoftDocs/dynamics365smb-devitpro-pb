---
title: "EventSubscriber Attribute"
description: "Specifies the event to which the method subscribes."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# EventSubscriber Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the event to which the method subscribes.


## Applies To

- Method

> [!NOTE]
> The EventSubscriber attribute can only be set inside codeunits.

## Syntax

```
[EventSubscriber(ObjectType: ObjectType, ObjectId: Integer, EventName: Text, ElementName: Text, SkipOnMissingLicense: Boolean, SkipOnMissingPermission: Boolean)]
```

### Parameters
*ObjectType*  
&emsp;Type: [ObjectType](../methods-auto/objecttype/objecttype-option.md)  
Specifies the type of object that publishes the event to subscribe to.


*ObjectId*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the object that that publishes the event to subscribe to.


*EventName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the name of method that publishes the event in the object that is specified by the ObjectId parameter.


*ElementName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the table field that the trigger event pertains to.


*SkipOnMissingLicense*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies what happens to the event subscriber method call when the Dynamics 365 Business Central license of the user account that is running the current session does not include the codeunit that contains the subscriber method.


*SkipOnMissingPermission*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies what happens to the subscriber method call when the user account that is running the current session does not have permission to the codeunit that contains the event subscriber method.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  