---
title: "MESSAGE Method (Notification)"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: SusanneWindfeldPedersen
ms.service: dynamics365-financials
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MESSAGE Method (Notification)
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
The MESSAGE method defines the notification. You use the [SEND Method](devenv-send-method-notification.md) to send the notification to the client, where it will be displayed.

For more information and a detailed example, see [Notifications](../devenv-notifications-developing.md).

##  Example
The following code creates a notification and sends it in the local scope.
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SEND;
```

## See Also  
[SCOPE Method(Notification)](devenv-scope-method-notification.md)  
[SEND Method (Notification)](devenv-send-method-notification.md)  
[Notifications](../devenv-notifications-developing.md)
