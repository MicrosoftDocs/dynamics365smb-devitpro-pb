---
title: "SCOPE Method (Notification)"
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

# SCOPE Method (Notification)
Specifies the context in which the notification appears in the client.

```
[CurrSCOPE := ]SCOPE([NewSCOPE])
```

## Parameters
*NewSCOPE*

Type: NotificationScope

The parameter has the following values:

|  Value  |  Description  |
|---------|---------------|
|LocalScope |The notification appears in context of the user's current task, on the page the user is currently working on. This is the default value.|
|GlobalScope |The notifications are not directly related to the user's current task. **Note:**  GlobalScope is currently not supported, so do not use this value.|

## Return Value
*CurrSCOPE*

Type: NotificationScope

The scope of the current notification.

## Remarks

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
[Multilanguage Development](../devenv-multilanguage-development.md)
