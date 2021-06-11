---
title: "RecallNotificationHandler Attribute"
description: "Specifies that the method is a RecallNotificationHandler method, which handles Recall statements."
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

# RecallNotificationHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a RecallNotificationHandler method, which handles Recall statements.


## Applies To

- Method

> [!NOTE]
> The **RecallNotificationHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[RecallNotificationHandler([HandlerIsOptional: Boolean])]
procedure RecallNotificationHandler(var TheNotification: Notification) : Boolean;
```

### Arguments
*[Optional] HandlerIsOptional*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the notification handler method is optional.


*TheNotification*  
&emsp;Type: [Notification](../methods-auto/notification/notification-data-type.md)  
Holds the actual notification.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **RecallNotificationHandler** method is called when a notification is recalled from the code.

For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)