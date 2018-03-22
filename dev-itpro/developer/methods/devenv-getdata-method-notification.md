---
title: "GETDATA Method (Notification)"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: SusanneWindfeldPedersen
ms.service: dynamics365-financials
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETDATA Method (Notification)
Retrieves data that was passed to a notification instance as specified by a [SETDATA Method](devenv-setdata-method-notification.md) call.

```
Value := GETDATA(Name)
```

## Parameters
*Name*

Type: Type: Code or text

The name of the data item that is specified by the SETDATA method call.

## Remarks
You use the SETDATA and GETDATA methods for transferring data in a notification. The methods are typically needed for handling actions on the notification. The SETDATA method is called from the source of the notification, while the GETDATA method is called from the action code.

For more information and a detailed example, see [Notifications](../devenv-notifications-developing.md).

##  Example
The following code sets the data for a notification:
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SETDATA('Created',FORMAT(CURRENTDATETIME,0,9));
MyNotification.SETDATA('ID',FORMAT(CREATEGUID,0,9));
MyNotification.ADDACTION('Action 1',CODEUNIT::"Action Handler",'RunAction1');
MyNotification.ADDACTION('Action 2',CODEUNIT::"Action Handler",'RunAction2');
MyNotification.SEND;
```
The following code gets the data for a notification:

```
MyNotification.GETDATA('Created');
MyNotification.GETDATA('ID');
```

## See Also  
[SCOPE Method(Notification)](devenv-scope-method-notification.md)  
[SEND Method (Notification)](devenv-send-method-notification.md)  
[Notifications](../devenv-notifications-developing.md)
