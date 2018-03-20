---
title: "SubType Property (Codeunit)"
ms.custom: na
ms.date: 06/15/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c31be95f-e083-4d87-84e4-27b2373349d6
caps.latest.revision: 13
author: SusanneWindfeldPedersen
---

 

# SubType Property (Codeunit)
Sets the codeunit to method as a normal, test, test runner, or upgrade codeunit.  
  
## Applies To  
Codeunits  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Normal**|A normal codeunit. This is the default setting.|  
|**Test**|A test codeunit includes AL methods that test the application. <!-- For more information, see [How to: Create Test Codeunits and Test Methods](../devenv-how-to-create-test-codeunits-and-test-methods.md).-->|  
|**TestRunner**|A test runner codeunit manages the execution of one or more test codeunits. <!-- For more information, see [How to: Create a Test Runner Codeunit](../devenv-how-to-create-a-test-runner-codeunit.md).-->|  
|**Upgrade**|An upgrade codeunit includes AL methods for synchronizing changes to a table definition in an application with the business data table in SQL Server and migrating existing data. <!-- For more information, see [Upgrade Codeunits](../devenv-upgrade-codeunits.md).-->|  
  
## Remarks  
You can create test codeunits and test runner codeunits to test your application.  
  
You write test methods as AL code in the test codeunits. When a test codeunit runs, it executes the OnRun method and then executes each test method in the codeunit, records the outcome in a log, and displays the results in a message window. The continuation of the test method run is dependent on successful run of the OnRun method. The difference between a normal codeunit and a test codeunit is their execution at run time. When a normal codeunit is run, if one of its methods fails, then the codeunit is terminated. When a test codeunit is run, if a method fails, then the method is terminated, but the codeunit continues to run the remaining methods.  
  
A test runner codeunit runs the test codeunits that are programmed to run from its OnRun trigger. When a test runner codeunit runs, it does the following:  
  
-   Calls the [OnBeforeTestRun Trigger](../triggers/devenv-onbeforetestrun-trigger.md) before each test codeunit, and the OnRun method and test method is executed.  
  
-   Calls the [OnAfterTestRun Trigger](../triggers/devenv-onaftertestrun-trigger.md) after each test code unit, and the OnRun method and test method is executed.  
  
-   Indicates that a test method has failed if it invokes the user interface.  
<!-- 
For more information, see [Testing the Application](Testing-the-Application.md).  
-->  
## See Also  
[Properties](devenv-properties.md)  
[Codeunit Properties](devenv-codeunit-properties.md)  
[Subtype Blob Property](devenv-subtype-blob-property.md)
<!--
[Testing the Application](Testing-the-Application.md)   
[How to: Create Test Codeunits and Test Methods](How-to-Create-Test-Codeunits-and-Test-Methods.md)   
[How to: Create Handler Methods](How-to-Create-Handler-Methods.md)   
[Walkthrough: Testing Purchase Invoice Discounts](Walkthrough-Testing-Purchase-Invoice-Discounts.md)   
[Codeunits](../devenv-codeunits.md) 
-->