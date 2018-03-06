---
title: "ID Function (Notification)"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# ID Function (Notification)
Specifies the identifier for a notification.

```
[CurrID := ] MyNotification.ID
```
## Return Value
*Value*  
The unique identifier for the notification.

## Remarks
If left unassigned the notification will be assigned an ID when the SEND method is called. For more information, see [SEND Function (Notification)](function-notificationsend.md).

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
[SEND Function (Notification)](function-notificationsend.md)  
[RECALL Function (Notification)](function-notificationrecall.md)  
[MESSAGE Function (Notification)](function-notificationmessage.md)  
[SCOPE Function (Notification)](function-notificationscope.md)  
[Notifications](notifications-developing.md)
