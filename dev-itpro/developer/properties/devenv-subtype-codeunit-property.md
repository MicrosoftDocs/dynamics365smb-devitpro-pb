---
title: "SubType Property (Codeunit)"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# SubType Property (Codeunit)
> **Version**: _Available from runtime version 1.0._

Sets the codeunit to method as a normal, test, test runner, or upgrade codeunit.  
  
## Applies to  

- Codeunits  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Normal**|A normal codeunit. This is the default setting.|  
|**Test**|A test codeunit includes AL methods that test the application. <!-- For more information, see [How to: Create Test Codeunits and Test Methods](../devenv-how-to-create-test-codeunits-and-test-methods.md).-->|  
|**TestRunner**|A test runner codeunit manages the execution of one or more test codeunits. <!-- For more information, see [How to: Create a Test Runner Codeunit](../devenv-how-to-create-a-test-runner-codeunit.md).-->|  
|**Upgrade**|An upgrade codeunit includes AL methods for synchronizing changes to a table definition in an application with the business data table in SQL Server and migrating existing data. <!-- For more information, see [Upgrade Codeunits](../devenv-upgrade-codeunits.md).-->|  
|**Install**|An install codeunit includes AL methods for performing operations unconcerned with the extension code itself during the initial installation and the reinstallation of an extension.|

## Syntax

```AL
SubType = Normal;
```
  
## Remarks

You can create test codeunits and test runner codeunits to test your application.  
  
You write test methods as AL code in the test codeunits. When a test codeunit runs, it executes the OnRun trigger and then executes each test method in the codeunit, records the outcome in a log, and displays the results in a message window. The continuation of the test method run is dependent on successful run of the OnRun trigger. The difference between a normal codeunit and a test codeunit is their execution at run time. When a normal codeunit is run, if one of its methods fails, then the codeunit is terminated. When a test codeunit is run, if a method fails, then the method is terminated, but the codeunit continues to run the remaining methods.  
  
A test runner codeunit runs the test codeunits that are programmed to run from its OnRun trigger. When a test runner codeunit runs, it does the following:  
  
- Calls the [OnBeforeTestRun Trigger](../triggers/codeunit/devenv-onbeforetestrun-codeunit/trigger.md) before each test codeunit, and the OnRun trigger and test method is executed.  
  
- Calls the [OnAfterTestRun Trigger](../triggers/codeunit/devenv-onaftertestrun-codeunit-trigger.md) after each test code unit, and the OnRun trigger and test method is executed.  
  
- Indicates that a test method has failed if it invokes the user interface.  

For more information, see [Testing the Application](../devenv-testing-application.md).  

When developing a new extension version, you can use upgrade codeunits to upgrade data from the previous version and make it compatible with the new one. <!-- The data upgrade code is implemented through upgrade triggers, which are invoked when you run the upgrade process. --> For more information, see [Upgrading Extensions](../devenv-upgrading-extensions.md). 

For more information on how to use install codeunits to write extension install code, see [Writing Extension Install Code](../devenv-extension-install-code.md). 

## See Also  

[Properties](devenv-properties.md)  
[Codeunit Properties](devenv-codeunit-properties.md)  
[Subtype BLOB Property](devenv-subtype-blob-property.md)  
[Testing the Application](../devenv-testing-application.md)  
<!--
[How to: Create Test Codeunits and Test Methods](How-to-Create-Test-Codeunits-and-Test-Methods.md)   
[How to: Create Handler Methods](How-to-Create-Handler-Methods.md)   
[Walkthrough: Testing Purchase Invoice Discounts](Walkthrough-Testing-Purchase-Invoice-Discounts.md)   
[Codeunits](../devenv-codeunits.md) 
-->