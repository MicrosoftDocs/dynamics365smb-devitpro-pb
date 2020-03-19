---
title: "HandlerFunctions Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: f5d1b271-5b27-498b-9a0b-af0166f6412b
caps.latest.revision: 14
author: SusanneWindfeldPedersen
---

 # HandlerFunctions Property
Specifies the handler methods that are used by the test method.  
  
## Applies To  
AL test methods on test codeunits. A test method is a method that has the [MethodType Property (Test Codeunits)](devenv-methodtype-property-test-codeunits.md) set to **Test**.  
   
## Property Value  
The handler method name.  
  
> [!NOTE]  
>  If the test method uses more than one handler method, then you should separate the handler method names by a comma.  
  
## Remarks  
You use test codeunits and test methods to test your application. A handler method allows you to automate tests by handling instances when user interaction is required by the code that is being tested. In these instances, the test method calls the handler method, which is run instead of the user interface.  
  
The following is some important information about handler methods:  

<!--  this method is deprecated
-   To be a handler method, the [MethodType Property (Test Codeunits)](devenv-methodtype-property-test-codeunits.md) must set to one of the handler types: [MessageHandler](devenv-methodtype-property-test-codeunits.md), [ConfirmHandler](devenv-methodtype-property-test-codeunits.md), [StrMenuHandler](devenv-methodtype-property-test-codeunits.md), [PageHandler](devenv-methodtype-property-test-codeunits.md), [ModalPageHandler](devenv-methodtype-property-test-codeunits.md), [ReportHandler](devenv-methodtype-property-test-codeunits.md), [RequestPageHandler](devenv-methodtype-property-test-codeunits.md), or [FilterPageHandler](devenv-methodtype-property-test-codeunits.md).  -->
  
-   A test method can only call handler methods that are defined in the same test codeunit as the test method.  
  
-   A test method can call MessageHandler, ConfirmHandler, and StrMenuHandler type handlers only once. It can call PageHandler, ModalPageHandler, ReportHandler, RequestPageHandler, or FilterPageHandler type handlers multiple times but only once per application object ID.  
  
-   Every handler method that you enter in the **HandlerFunctions** property must be called at least once in the test method. If you execute a test method that has a handler method listed that is not called, then the test fails.  
  
<!-- For more information, see [Testing the Application](Testing-the-Application.md) and [How to: Create Handler Methods](../methods/devenv-How-to-Create-Handler-Methods.md).  
-->
## See Also  
[Properties](devenv-properties.md)  
[AL Methods](../methods/devenv-al-method-reference.md)  
<!-- 
[Testing the Application](Testing-the-Application.md)   
[How to: Create Test Codeunits and Test Methods](../methods/devenv-How-to-Create-Test-Codeunits-and-Test-Methods.md)  [How to: Create Handler Methods](../methods/devenv-How-to-Create-Handler-Methods.md)   
[Walkthrough: Testing Purchase Invoice Discounts](Walkthrough-Testing-Purchase-Invoice-Discounts.md) 
-->