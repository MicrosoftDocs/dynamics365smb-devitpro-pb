---
title: "HandlerIsOptional Property"
ms.custom: na
ms.date: 23/01/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# HandlerIsOptional Property
Sets whether the notification handler function is optional.  
  
## Applies To  
C/AL test functions that have the [FunctionType](FunctionType-Property--Test-Codeunits-.md) set to **SendNotificationHandler** or **RecallNotificationHandler**.  
  
## Property Value  
**Yes** if handler function is optional; otherwise, **No**. The default value is **No**.

## Remarks  
The **HandlerIsOptional** property determines how a **SendNotificationHandler** or **RecallNotificationHandler** handler behaves when testing notifications that are sent or recalled in a test function (by a [SEND function](function-notificationsend.md) call or [RECALL function](function-notificationrecall.md) call, respectively). You are not required to have a notification handler, even if a notification is sent or recalled from the test code. The following table provides an overview of the behavior if you use a notification handler: 

|Test function code|HandlerIsOptional=Yes|HandlerIsOptional=No|
|------------------|---------------------|--------------------|
|Sends/recalls a notification|Handler gets called; test succeeds|Handler gets called; test succeeds|
|Does not send/recall a notification|Handler is not called; test succeeds|Handler is not called; test fails.|

This behavior differs from other handler types, like **MessageHandler** and **ConfirmHandler**. With these types, a test will fail if there is no corresponding handler for a UI function call or if there is a handler but no UI function call. 

The **HandlerIsOptional** property gives you more control over how you want to test notifications. For example, if you wanted to test for unwanted notifications, you could set the **HandlerIsOptional** property to **Yes**, then add a **SendNotificationHandler** handler that throws an error explicitly from C/AL code. In this case, if a notification is sent, you will get the error; otherwise, the handler is not called, and the everything is good. 
  
## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)   
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)  
 [Notifications](notifications-developing.md)  
