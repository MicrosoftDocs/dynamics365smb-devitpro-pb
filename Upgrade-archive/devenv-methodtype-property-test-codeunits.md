---
title: "MethodType Property (Test Codeunits)"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 50c482bb-b49e-4a92-821c-3c26d963a4aa
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# MethodType Property (Test Codeunits)
Sets the type of method in a test codeunit.  
  
## Applies To  
 AL methods on test codeunits. A test codeunit is codeunit that has the [SubType Property (Codeunit)](devenv-subtype-property-codeunit.md) set to **Test**.  
  
## Property Value  
  
|Value|Syntax example|Purpose|  
|-----------|-----------------|--------|    
|**MessageHandler**|<br>`[MessageHandler]` </br> `procedure MessageHandler(Msg : Text[1024]);`|This handler is called when a message function is invoked in the code. The parameter type, **Text**,  contains the text of the function.|  
|**ConfirmHandler**|<br>`[ConfirmHandler]` </br> `procedure ConfirmHandlerNo(Question: Text[1024]; var Reply: Boolean);`|This handler is called when a confirm function is invoked in the code. The parameter type, **Text**,  contains the text of the function and the parameter **Reply** if the response to confirm is *yes* or *no*.|  
|**StrMenuHandler**|<br>`[StrMenuHandler]` </br> `procedure StrMenuHandler(Option: Text[1024]; var Choice: Integer; Instruction: Text[1024]);`|This handler is called when a StrMenu function is invoked in code. The parameter type, **Text**,  contains the text of the function and **Choice** is the option chosen in the StrMenu. **Options** is the list of the different option values and **Instruction** is the leading text.|  
|**PageHandler**|<br>`[PageHandler]` </br> `procedure MappingPageHandler(var MappingPage: TestPage 1214);`|This handler is called when a non-modal page is invoked in the code. **TestPage** is the specific page in this case.|
|**ModalPageHandler**|<br>`[ModalPageHandler]` </br> `procedure DevSelectedObjectPageHandler(var DevSelectedObjects: TestPage 89015);`|This handler is called when a modal page is invoked in the code. **TestPage** is the specific page in this case.|  
|**RequestPageHandler**|<br>`[RequestPageHandler]` </br> `procedure SalesInvoiceReportRequestPageHandler(var SalesInvoice: TestRequestPage 206);`|This handler is called when a report is invoked in the code.  **TestRequestPage** refers to the specific report ID.| 
|**FilterPageHandler**|<br>`[FilterPageHandler]` </br> `procedure CustomerFilterHandler(var RecRef: RecordRef) : Boolean;`|This handler is called when a filter page is invoked in the code. **RecRef** holds the record of the filter page.| 
|**ReportHandler**|<br>`[ReportHandler]` </br> `procedure VendorListReportHandler(var VendorList: Report 301);`|This handler is called when a report is invoked in the code. **Report** is the specific report in this case.|  
|**HyperlinkHandler**|<br>`[HyperlinkHandler]` </br> `procedure HyperlinkHandler(MessageTxt: Text[1024]);`|This handler is called when a hyperlink is invoked in the code. **Text** contains the actual hyperlink.|  
|**SendNotificationHandler**|<br>`[SendNotificationHandler]` </br> `procedure SendNotificationHandler(var Notification: Notification) : Boolean;`|This handler is called when a notification is raised from the code. **Notification** holds the actual notification.|
|**RecallNotificationHandler**|<br>`[RecallNotificationHandler]` </br> `procedure RecallNotificationHandler(var Notification: Notification): Boolean;`|This handler is called when a notification is recalled from the code. **Notification** holds the actual notification.|
|**SessionSettingsHandler**|<br>`[SessionSettingsHandler]` </br> `procedure SessionSettingsHandler(var TestSessionSettings: SessionSettings) : Boolean;`|This handler is called when SessionSetting is updated.  The parameter type, **SessionSettings**, holds the new settings.|
  
## Remarks  
 You create test codeunits to test your application. A test codeunit can consist of one or more test methods, handler methods, and normal methods.  
  
-   You use test methods that include AL code that performs a test on an area of the application. <!-- For more information, see [How to: Create Test Codeunits and Test Methods](../methods/devenv-how-to-create-test-codeunits-and-test-methods.md).  -->
  
-   You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. For example, a test method that has a **MethodType** of MessageHandler handles MESSAGE method calls. If the code that is being tested calls the MESSAGE method, then the MessageHandler method that is declared for that test method is called instead of the MESSAGE method. You write code in the MessageHandler method to verify that the expected message is displayed by the MESSAGE method.  
  
    > [!NOTE]  
    >  The parameters of the methods that are being handled are passed as parameters to the handler methods. The value of the parameter can be changed by the handler method.  
  
     To set up handler method for use by a test method, you assign the handler method to the [HandlerFunctions Property](devenv-handlermethods-property.md) of the test method.  
  
     <!-- For more information, see [How to: Create Handler Methods](../devenv-how-to-create-handler-methods.md).  -->
  
-   You use normal methods to structure the test code by using the same design practices and principles as methods in other codeunits of the application.  

## See Also  
[Properties](devenv-properties.md)  
[AL Methods](../methods/devenv-al-method-reference.md)  

<!--  
## See Also  
 [Testing the Application](../devenv-Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Methods](../methods/how-to-create-test-codeunits-and-test-methods.md)   
 [How to: Create Handler Methods](../methods/devenv-How-to-create-handler-methods.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough-Testing-Purchase-Invoice-Discounts.md)
 -->