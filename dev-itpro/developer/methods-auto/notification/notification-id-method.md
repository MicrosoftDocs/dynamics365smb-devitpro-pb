---
title: "Notification.Id([Guid]) Method"
description: "Specifies the identifier for a notification."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Notification.Id([Guid]) Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies the identifier for a notification.


## Syntax
```AL
[Id := ]  Notification.Id([Id: Guid])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

*[Optional] Id*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
  


## Return Value
*[Optional] Id*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
If left unassigned the notification will be assigned an ID when the Send method is called. For more information, see [Send Method (Notification)](../../methods-auto/notification/notification-send-method.md).

##  Example
The following code creates a notification and sends it if NewBalance is greater than the credit limit. If it is lower than the credit limit, it recalls the notification.

The example uses a pre-defined ID so that the notification can be recalled.

```al
MyNotification.ID := '00000000-0000-0000-0000-000000000001';
IF NewBallance > Rec. "Credit Limit" THEN begin
  MyNotification.Message := 'The customer's current balance exceeds their credit limit.';
  MyNotification.Scope := NotificationScope::LocalScope;
  MyNotification.AddAction('Fix it.', 50001, 'FixCustomerCreditLimit');
  MyNotification.SetData('CustomerNo.', Rec."No.");
  MyNotification.Send;
END ELSE
  MyNotification.Recall;
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)