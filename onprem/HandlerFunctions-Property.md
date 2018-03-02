---
title: "HandlerFunctions Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f5d1b271-5b27-498b-9a0b-af0166f6412b
caps.latest.revision: 14
manager: edupont
---
# HandlerFunctions Property
Specifies the handler functions that are used by the test function.  
  
## Applies To  
 C/AL test functions on test codeunits. A test function is a function that has the [FunctionType Property \(Test Codeunits\)](FunctionType-Property--Test-Codeunits-.md) set to **Test**.  
  
## Property Value  
 The handler function name as specified on the **Functions** tab of **the C/AL Global** window for the test codeunit.  
  
> [!NOTE]  
>  If the test function uses more than one handler function, then you should separate the handler function names by a comma.  
  
## Remarks  
 You use test codeunits and test functions to test your application. A handler function allows you to automate tests by handling instances when user interaction is required by the code that is being tested. In these instances, the test function calls the handler function, which is run instead of the user interface.  
  
 The following is some important information about handler functions:  
  
-   To be a handler function, the [FunctionType Property \(Test Codeunits\)](FunctionType-Property--Test-Codeunits-.md) must set to one of the handler types: MessageHandler, ConfirmHandler, StrMenuHandler, PageHandler, ModalPageHandler, ReportHandler, RequestPageHandler, or FilterPageHandler.  
  
-   A test function can only call handler functions that are defined in the same test codeunit as the test function.  
  
-   A test function can call MessageHandler, ConfirmHandler, and StrMenuHandler type handlers only once. It can call PageHandler, ModalPageHandler, ReportHandler, RequestPageHandler, or FilterPageHandler type handlers multiple times but only once per application object ID.  
  
-   Every handler function that you enter in the **HandlerFunctions** property must be called at least once in the test function. If you execute a test function that has a handler function listed that is not called, then the test fails.  
  
 For more information, see [Testing the Application](Testing-the-Application.md) and [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  
  
## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)   
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)