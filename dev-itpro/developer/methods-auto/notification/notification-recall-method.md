---
title: "Notification.Recall Method"
description: "Recall a sent notification."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Notification.Recall Method
> **Version**: _Available or changed with runtime version 1.0._

Recall a sent notification.


## Syntax
```
[Ok := ]  Notification.Recall()
```

## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if it succeeds in sending a recall request to the client; otherwise **false**. The same notification can be recalled more than once, without failing. Also, a notification can be recalled successfully even if it hasn't been sent.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

<!--
If you omit this optional return value and if the notification cannot be recalled, then a run-time error occurs that states that the notification cannot be recalled. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even if the notification is not recalled.-->

## Remarks

A typical reason that the RECALL method returns **false** is a failure in the communication with the client. Another reason could be that the code tries to recall a notification for which there is no instance.

## Example

The following code creates a notification and sends it if NewBalance is greater than the credit limit. If it is lower than the credit limit, it recalls the notification.

```al
MyNotification.ID := '00000000-0000-0000-0000-000000000001';
IF NewBalance > Rec. "Credit Limit" then begin
  MyNotification.Message := 'The customer's current balance exceeds their credit limit.';
  MyNotification.Scope := NotificationScope::LocalScope;
  MyNotification.AddAction('Fix it.', 50001, 'FixCustomerCreditLimit');
  MyNotification.SetData('CustomerNo.', Rec."No.");
  MyNotification.Send;
end else
  MyNotification.Recall;
```

## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)