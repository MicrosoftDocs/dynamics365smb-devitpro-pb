---
title: "Notification.Id Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Notification.Id Method
Specifies the identifier for a notification.


## Syntax
```
[Id := ]  Notification.Id([Id: Guid])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

*Id*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
  


## Return Value
*Id*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
If left unassigned the notification will be assigned an ID when the SEND method is called. For more information, see [SEND Method (Notification)](../../methods-auto/notification/notification-send-method.md).

##  Example
The following code creates a notification and sends it if NewBalance is greater than the credit limit. If it is lower than the credit limit, it recalls the notification.

The example uses a pre-defined ID so that the notification can be recalled.

```
MyNotification.ID := '00000000-0000-0000-0000-000000000001';
IF NewBallance > Rec. "Credit Limit" THEN BEGIN
  MyNotification.MESSAGE := 'The customer's current balance exceeds their credit limit.';
  MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
  MyNotification.ADDACTION('Fix it.', 50001, 'FixCustomerCreditLimit');
  MyNotification.SETDATA('CustomerNo.', Rec."No.");
  MyNotification.SEND;
END ELSE
  MyNotification.RECALL;
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)