---
title: "SEND Method (Notification)"
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

# SEND Method (Notification)
Sends the notification to the client, where it will display in the UI.

```
[Ok := ]SEND
```
## Return Value
*Value*

Type: Code or text

**true** if the notification was sent; otherwise, **false**.

If you omit this optional return value and if the notification cannot be sent, then a run-time error occurs that states that the notification cannot be sent. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even though the notification is not sent.

## Remarks
The SEND method displays the content of the notification that is specified by the [MESSAGE Method](devenv-message-method-notification.md).

For more information and a detailed example, see [Notifications](../devenv-notifications-developing.md).

##  Example
The following code creates a notification and sends it to the client in the local scope.
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SEND;
```

## See Also  
[MESSAGE Method (Notification)](devenv-message-method-notification.md)  
[SCOPE Method(Notification)](devenv-scope-method-notification.md)  
[Notifications](../devenv-notifications-developing.md)
