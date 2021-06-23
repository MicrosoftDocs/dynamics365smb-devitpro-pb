---
title: "Notification.Message Method"
description: "Specifies the content of the notification."
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
# Notification.Message Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies the content of the notification.


## Syntax
```AL
[Message := ]  Notification.Message([Message: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

*[Optional] Message*  
&emsp;Type: [String](../string/string-data-type.md)  
Displays a text string in a message window.  


## Return Value
*[Optional] Message*  
&emsp;Type: [String](../string/string-data-type.md)  
The message
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks
The Message method defines the notification. You use the [Send Method (Notification)](../../methods-auto/notification/notification-send-method.md) to send the notification to the client, where it will be displayed.

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

##  Example
The following code creates a notification and sends it in the local scope.
```
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.Send;
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)