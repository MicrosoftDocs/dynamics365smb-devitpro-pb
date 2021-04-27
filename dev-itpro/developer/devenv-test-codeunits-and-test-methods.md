---
title: Test Codeunits and Test Methods
description: This topic describes how to create test codeunits and how to create test methods in the test codeunits. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: blrobl
---

# Creating Test Codeunits and Test Methods
In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you can create test codeunits and create test methods in the test codeunits.  

Test codeunits are codeunits that have the [SubType Property](properties/devenv-subtype-codeunit-property.md) set to **Test**. You write tests as Al code in the methods inside of the test codeunits. There are three types of methods that you can add in a test codeunit: test, handler, and normal. Each method type is used for a specific purpose and behaves differently. When a test codeunit runs, it runs the **OnRun** trigger, and then runs each test method in the codeunit.

By default, each test method runs in a separate database transaction, but you can use the [TransactionModel Property](./properties/devenv-properties.md) on test methods and the [TestIsolation Property](properties/devenv-testisolation-property.md) on test runner codeunits to control the transactional behavior. 

The results of a test codeunit and of the individual test methods are displayed in a message window, but you can use the [OnAfterTestRun Trigger](triggers/codeunit/devenv-onaftertestrun-codeunit-trigger.md) on a test runner codeunit to capture the results. The outcome of a test method is either SUCCESS or FAILURE. If any error is raised by either the code that is being tested or the test code, then the global outcome of the test codeunit is FAILURE and the error is included in the results log file.  

The difference between a normal codeunit and a test codeunit is their execution at runtime. When a normal codeunit is run, if one of its methods fails, then the codeunit is terminated. When a test codeunit is run, even if the outcome of one test method is FAILURE, the next test methods are still run.  

The methods in a test codeunit can be one of the following types:  

|Type|Description|
|-------|-----------|
|Test method|You use test methods that include AL code that tests the business logic in the application, where each method covers a transaction. You declare the [Test Attribute](methods/devenv-test-attribute.md) on the method.|
|Handler method|You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. You declare a handler type attribute on the method. For more information, see [Creating Handler Methods](devenv-creating-handler-methods.md) |
|Normal method|You use normal methods to structure the test code by using the same design practices and principles as methods in other codeunits of the application. You declare the [Normal Attribute](methods/devenv-normal-attribute.md) on the method.||

## See Also  
 [Testing the Application](devenv-Testing-Application.md)