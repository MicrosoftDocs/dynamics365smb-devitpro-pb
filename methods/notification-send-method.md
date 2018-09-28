---
title: "Send Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Send Method
Sends the notification to the client, where it will display in the UI.

## Syntax
```
[Ok := ]  Notification.Send()
```

## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the notification was recalled; otherwise **false**  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)