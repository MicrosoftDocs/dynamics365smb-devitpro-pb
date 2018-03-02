---
title: "MESSAGE Function (Notification)"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# MESSAGE Function (Notification)
Specifies the content of the notification.

```
[CurrMESSAGE := ]MESSAGE([NewMESSAGE])
```

## Parameters
*NewMESSAGE*

Type: Type: Code or text

The text string that you want to display for the notification. The string can be a text constant that is enabled for multilanguage functionality.

## Return Value
*CurrMESSAGE*

Type: Code or text

The content of the current notification.

## Remarks
The MESSAGE function defines the notification. You use the [SEND function](function-notificationsend.md) to send the notification to the client, where it will be displayed.

For more information and a detailed example, see [Notifications](notifications-developing.md).

##  Example
The following code creates a notification and sends it in the local scope.
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SEND;
```

## See Also  
[SCOPE Function(Notification)](function-notificationscope.md)  
[SEND Function (Notification)](function-notificationsend.md)  
[Notifications](notifications-developing.md)
