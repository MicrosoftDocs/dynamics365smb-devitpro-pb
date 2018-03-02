---
title: "FunctionType Property (Test Codeunits)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 50c482bb-b49e-4a92-821c-3c26d963a4aa
caps.latest.revision: 15
manager: edupont
---
# FunctionType Property (Test Codeunits)
Sets the type of function in a test codeunit.  
  
## Applies To  
 C/AL functions on test codeunits. A test codeunit is codeunit that has the [SubType Property \(Codeunit\)](SubType-Property--Codeunit-.md) set to **Test**.  
  
## Property Value  
  
|Value|Description|  
|-----------|-----------------|  
|**Normal**|Acts as normal function.|  
|**Test**|Tests the application.|  
|**MessageHandler**|Handles MESSAGE functions.|  
|**ConfirmHandler**|Handles CONFIRM functions.|  
|**StrMenuHandler**|Handles STRMENU functions.|  
|**PageHandler**|Handles specific pages that are not run modally.|  
|**ModalPageHandler**|Handles specific pages that are run modally.|  
|**ReportHandler**|Handles specific reports.|  
|**RequestPageHandler**|Handles specific report request pages.|  
|**FilterPageHandler**|Handles specific filter pages for filtering tables.<br /><br /> For more information, see [Creating Filter Pages for Filtering Tables](Creating-Filter-Pages-for-Filtering-Tables.md)|  
|**HyperlinkHandler**|Handles specific hyperlinks.|  
|**SendNotificationHandler**|Handles specific [SEND](function-notificationsend.md) functions.|  
|**RecallNotificationHandler**|Handles [RECALL](function-notificationrecall.md) functions.|  
|**SessionSettingsHandler**|Handles [REREQUESTSESSIONUPDATE](requestsessionupdate-function-sessionsettings.md) functions.|  
  
## Remarks  
 You create test codeunits to test your application. A test codeunit can consist of one or more test functions, handler functions, and normal functions.  
  
-   You use test functions that include C/AL code that performs a test on an area of the application. For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).  
  
-   You use handler functions to automate tests by handling instances when user interaction is required by the code that is being tested by the test function. In these instances, the handler function is run instead of the requested user interface. The handler function should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. For example, a test function that has a **FunctionType** of MessageHandler handles MESSAGE function calls. If the code that is being tested calls the MESSAGE function, then the MessageHandler function that is declared for that test function is called instead of the MESSAGE function. You write code in the MessageHandler function to verify that the expected message is displayed by the MESSAGE function.  
  
    > [!NOTE]  
    >  The parameters of the functions that are being handled are passed as parameters to the handler functions. The value of the parameter can be changed by the handler function.  
  
     To set up handler function for use by a test function, you assign the handler function to the [HandlerFunctions Property](HandlerFunctions-Property.md) of the test function.  
  
     For more information, see [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  
  
-   You use normal functions to structure the test code by using the same design practices and principles as functions in other codeunits of the application.  
  
## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)   
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)