---
title: "MethodType Property (Test Codeunits)"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 50c482bb-b49e-4a92-821c-3c26d963a4aa
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# MethodType Property (Test Codeunits)
Sets the type of method in a test codeunit.  
  
## Applies To  
 AL methods on test codeunits. A test codeunit is codeunit that has the [SubType Property (Codeunit)](devenv-subtype-property-codeunit.md) set to **Test**.  
  
## Property Value  
  
|Value|Description|  
|-----------|-----------------|  
|**Normal**|Acts as normal method.|  
|**Test**|Tests the application.|  
|**MessageHandler**|Handles MESSAGE methods.|  
|**ConfirmHandler**|Handles CONFIRM methods.|  
|**StrMenuHandler**|Handles STRMENU methods.|  
|**PageHandler**|Handles specific pages that are not run modally.|  
|**ModalPageHandler**|Handles specific pages that are run modally.|  
|**ReportHandler**|Handles specific reports.|  
|**RequestPageHandler**|Handles specific report request pages.|  
|**FilterPageHandler**|Handles specific filter pages for filtering tables.<br /><br /> <!--For more information, see [Creating Filter Pages for Filtering Tables](../devenv-creating-filter-pages-for-filtering-tables.md)-->|  
|**HyperlinkHandler**|Handles specific hyperlinks.|  
  
## Remarks  
 You create test codeunits to test your application. A test codeunit can consist of one or more test methods, handler methods, and normal methods.  
  
-   You use test methods that include AL code that performs a test on an area of the application. <!-- For more information, see [How to: Create Test Codeunits and Test Methods](../methods/devenv-how-to-create-test-codeunits-and-test-methods.md).  -->
  
-   You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. For example, a test method that has a **MethodType** of MessageHandler handles MESSAGE method calls. If the code that is being tested calls the MESSAGE method, then the MessageHandler method that is declared for that test method is called instead of the MESSAGE method. You write code in the MessageHandler method to verify that the expected message is displayed by the MESSAGE method.  
  
    > [!NOTE]  
    >  The parameters of the methods that are being handled are passed as parameters to the handler methods. The value of the parameter can be changed by the handler method.  
  
     To set up handler method for use by a test method, you assign the handler method to the [HandlerMethods Property](devenv-handlermethods-property.md) of the test method.  
  
     <!-- For more information, see [How to: Create Handler Methods](../devenv-how-to-create-handler-methods.md).  -->
  
-   You use normal methods to structure the test code by using the same design practices and principles as methods in other codeunits of the application.  

<!--  
## See Also  
 [Testing the Application](../devenv-Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Methods](../methods/how-to-create-test-codeunits-and-test-methods.md)   
 [How to: Create Handler Methods](../methods/devenv-How-to-create-handler-methods.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough-Testing-Purchase-Invoice-Discounts.md)
 -->