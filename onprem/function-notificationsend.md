---
title: "SEND Function (Notification)"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# SEND Function (Notification)
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
The SEND function displays the content of the notification that is specified by the [MESSAGE function](function-notificationmessage.md).

For more information and a detailed example, see [Notifications](notifications-developing.md).

##  Example
The following code creates a notification and sends it to the client in the local scope.
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SEND;
```

## See Also  
[MESSAGE Function (Notification)](function-notificationmessage.md)  
[SCOPE Function(Notification)](function-notificationscope.md)  
[Notifications](notifications-developing.md)
