---
title: "Notification.Send Method"
description: "Sends the notification to the client, where it will display in the UI."
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
# Notification.Send Method
> **Version**: _Available or changed with runtime version 1.0._

Sends the notification to the client, where it will display in the UI.


## Syntax
```AL
[Ok := ]  Notification.Send()
```

## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the notification was sent; otherwise **false** If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The Send method displays the content of the notification that is specified by the [Message Method](../../methods-auto/notification/notification-message-method.md).

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

##  Example
The following code creates a notification and sends it to the client in the local scope.

```al
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.Send;
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)