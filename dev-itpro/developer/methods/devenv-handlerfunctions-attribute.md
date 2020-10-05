---
title: "HandlerFunctions Attribute"
description: "The HandlerFunctions attribute in AL for Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# HandlerFunctions Attribute

Specifies the handler methods that are used by the test method.  
  
## Applies to

AL test methods on test codeunits. A test method is a method that has the [Test Attribute](devenv-test-attribute.md) declared. 

## Syntax

```
[HandlerFunctions('HandlerName1, [HandlerName2, ...]]
```

### Arguments  
*HandlerNames*  
Type: Text  
  
The names of the handler methods used by the test method.
  
> [!NOTE]  
> If the test method uses more than one handler method, then you should separate the handler method names by a comma.  
  
## Remarks  
You use test codeunits and test methods to test your application. A handler method allows you to automate tests by handling instances when user interaction is required by the code that is being tested. In these instances, the test method calls the handler method, which is run instead of the user interface.  
  
The following is some important information about handler methods:  
  
- To be a handler method, the method must have set to one of the attributes: [MessageHandler](devenv-messagehandler-attribute.md), [ConfirmHandler](devenv-confirmhandler-attribute.md), [StrMenuHandler](devenv-strmenuhandler-attribute.md), [PageHandler](devenv-pagehandler-attribute.md), [ModalPageHandler](devenv-modalpagehandler-attribute.md), [ReportHandler](devenv-reporthandler-attribute.md), [RequestPageHandler](devenv-requestpagehandler-attribute.md), [SendNotificationHandler](devenv-sendnotificationhandler-attribute.md), [HyperLinkHandler](devenv-hyperlinkhandler-attribute.md),[RecallNotificationHandler](devenv-recallnotificationhandler-attribute.md), [SessionSettingsHandler](devenv-sessionsettingshandler-attribute.md) or [FilterPageHandler](devenv-filterpagehandler-attribute.md).  
  
- A test method can only call handler methods that are defined in the same test codeunit as the test method.  
  
- A test method can call **MessageHandler**, **ConfirmHandler**, and **StrMenuHandler** type handlers only once. It can call **PageHandler**, **ModalPageHandler**, **ReportHandler**, **RequestPageHandler**, or **FilterPageHandler** type handlers multiple times but only once per application object ID.  
  
- Every handler method that you enter in the **HandlerFunctions** attribute must be called at least once in the test method. If you execute a test method that has a handler method listed that is not called, then the test fails.  
  
<!-- For more information, see [Testing the Application](Testing-the-Application.md) and [How to: Create Handler Methods](../methods/devenv-How-to-Create-Handler-Methods.md).  
-->

## Example

```
[Test]
[HandlerFunctions('SendNotificationHandler')]
procedure MyTestFunction();
begin
    ...
end
```

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Properties](../properties/devenv-properties.md)  
[Method Attributes](devenv-method-attributes.md)  
<!-- 
[Testing the Application](Testing-the-Application.md)   
[How to: Create Test Codeunits and Test Methods](../methods/devenv-How-to-Create-Test-Codeunits-and-Test-Methods.md)  [How to: Create Handler Methods](../methods/devenv-How-to-Create-Handler-Methods.md)   
[Walkthrough: Testing Purchase Invoice Discounts](Walkthrough-Testing-Purchase-Invoice-Discounts.md) 
-->