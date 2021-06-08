---
title: "Notification.Scope Method"
description: "Specifies the context in which the notification appears in the client."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Notification.Scope Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies the context in which the notification appears in the client.


## Syntax
```
[Scope := ]  Notification.Scope([Scope: NotificationScope])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

*[Optional] Scope*  
&emsp;Type: [NotificationScope](../notificationscope/notificationscope-option.md)  
The scope in which the notification appears in the client  


## Return Value
*[Optional] Scope*  
&emsp;Type: [NotificationScope](../notificationscope/notificationscope-option.md)  
The scope of the current notification.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 1

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

##  Example 1

The following code creates a notification and sends it in the local scope.

```al
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.Send;
```

## Remarks 2
The data that is specified by the SetData method can be retrieved by the [GetData Method](../library.md). The SetData and GetData methods are typically used for actions with actions on the notification. The SetData method is called from the source is the notification, while the GetData method is called from the action code.

You can use multiple SetData method calls to specify different data items. The data remains available for the life of the notification instance. The data is cleared once the notification instance has been dismissed or an action is taken.

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

##  Example 2

The following code sets the data for a notification:

```al
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.SetData('Created',Format(CurrentDateTime,0,9));
MyNotification.SetData('ID',Format(CreateGUID,0,9));
MyNotification.AddAction('Action 1',CodeUnit::"Action Handler",'RunAction1');
MyNotification.AddAction('Action 2',CodeUnit::"Action Handler",'RunAction2');
MyNotification.Send;
```
The following code gets the data for a notification:

```al
MyNotification.GetData('Created');
MyNotification.GetData('ID');''
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)''