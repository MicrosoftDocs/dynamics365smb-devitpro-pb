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
> The RecallNotificationHandler attribute can only be set inside codeunits with the **SubType property** set to Test.

## Syntax

```
[RecallNotificationHandler([HandlerIsOptional: Boolean])]
procedure RecallNotificationHandler(var TheNotification: Notification) : Boolean;
```

### Parameters
*[Optional] HandlerIsOptional*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the notification handler method is optional.


*TheNotification*  
&emsp;Type: [Notification](../methods-auto/notification/notification-data-type.md)  
Holds the actual notification.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  