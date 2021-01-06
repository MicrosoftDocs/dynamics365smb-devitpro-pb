---
title: "Notification.GetData Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Notification.GetData Method
> **Version**: _Available from runtime version 1.0._

Retrieves data that was passed to a notification instance as specified by a SetData method call.


## Syntax
```
Value :=   Notification.GetData(Name: String)
```
## Parameters
*Notification*
&emsp;Type: [Notification](notification-data-type.md)
An instance of the [Notification](notification-data-type.md) data type.

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the data item that is specified by the SetData method call.  


## Return Value
*Value*
&emsp;Type: [String](../string/string-data-type.md)
The data retrieved


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
You use the [SetData Method (Notification)](../../methods-auto/notification/notification-setdata-method.md) and GetData methods for transferring data in a notification. The methods are typically needed for handling actions on the notification. The [SetData Method (Notification)](../../methods-auto/notification/notification-setdata-method.md) method is called from the source of the notification, while the GetData method is called from the action code.

For more information and a detailed example, see [Notifications](../../devenv-notifications-developing.md).

##  Example
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
MyNotification.GetData('ID');
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)