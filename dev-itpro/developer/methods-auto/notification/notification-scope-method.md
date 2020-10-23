---
title: "Notification.Scope Method"
ms.author: solsen
ms.custom: na
ms.date: 10/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Notification.Scope Method
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

*Scope*  
&emsp;Type: [NotificationScope](../notificationscope/notificationscope-option.md)  
The scope in which the notification appears in the client  


## Return Value
*Scope*  
&emsp;Type: [NotificationScope](../notificationscope/notificationscope-option.md)  
The scope of the current notification.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

##  Example
The following code creates a notification and sends it in the local scope.
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SEND;
```

## Remarks
The data that is specified by the SETDATA method can be retrieved by the [GETDATA Method](../../methods/devenv-getdata-method-notification.md). The SETDATA and GETDATA methods are typically used for actions with actions on the notification. The SETDATA method is called from the source is the notification, while the GETDATA method is called from the action code.

You can use multiple SETDATA method calls to specify different data items. The data remains available for the life of the notification instance. The data is cleared once the notification instance has been dismissed or an action is taken.

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

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
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)