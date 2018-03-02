---
title: "ADDACTION Function (Notification)"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# ADDACTION Function (Notification)
Specifies an action for the notification.

```
ADDACTION(Caption, CodeunitID, FunctionName)
```

## Parameters
*Caption*

Type: Type: Code or text

The text string that appears as the caption of the action in the notification UI. The string can be a text constant that is enabled for multilanguage functionality.

*CodeunitID*

Type: Integer

The ID of the codeunit to run when the action is initiated from the notification UI. The codeunit should contain at least one global function to be called by the notification action. The global function must have a Notification data type parameter for accepting the notification object.

*FunctionName*

Type: Type: Code or text

The name of the function in the codeunit, which is specified by the *CodeunitID* parameter, that you want to run for the action.

## Remarks
An action provides a way for you to add an interactive notification that enables users to respond to or take action on the notification. The function that is called by the action contains logic that you want to run for the action.

For more information and a detailed example, see [Notifications](notifications-developing.md).

##  Example
The following code creates two actions for a notification. The actions call the **RunAction1** and **RunAction2** functions in the codeunit **Action Handler**.

```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.ADDACTION('Action 1',CODEUNIT::"Action Handler",'RunAction1');
MyNotification.ADDACTION('Action 2',CODEUNIT::"Action Handler",'RunAction2');
MyNotification.SEND;
```
To handle the actions, the **Action Handler** codeunit has two global functions that have a **Notification** data type parameter:
```
PROCEDURE RunAction1@1(MyNotification@1000 : Notification);
BEGIN
    MESSAGE('This is RunAction1');
END;

PROCEDURE RunAction2@2(MyNotification@1000 : Notification);
BEGIN
 MESSAGE('This is RunAction2');
END;
```

## See Also
[SCOPE Function(Notification)](function-notificationscope.md)  
[SEND Function (Notification)](function-notificationsend.md)  
[Notifications](notifications-developing.md)
