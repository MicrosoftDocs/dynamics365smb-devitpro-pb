---
title: "SubType Property (Codeunit)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c31be95f-e083-4d87-84e4-27b2373349d6
caps.latest.revision: 13
manager: edupont
---
# SubType Property (Codeunit)
Sets the codeunit to function as a normal, test, test runner, or upgrade codeunit.  
  
## Applies To  
 Codeunits  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Normal**|A normal codeunit. This is the default setting.|  
|**Test**|A test codeunit includes C/AL functions that test the application. For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).|  
|**TestRunner**|A test runner codeunit manages the execution of one or more test codeunits. For more information, see [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md).|  
|**Upgrade**|An upgrade codeunit includes C/AL functions for synchronizing changes to a table definition in an application with the business data table in SQL Server and migrating existing data. For more information, see [Upgrade Codeunits](Upgrade-Codeunits.md).|  
  
## Remarks  
 You can create test codeunits and test runner codeunits to test your application.  
  
 You write test functions as C/AL code in the test codeunits. When a test codeunit runs, it executes the OnRun function and then executes each test function in the codeunit, records the outcome in a log, and displays the results in a message window. The continuation of the test function run is dependent on successful run of the OnRun function. The difference between a normal codeunit and a test codeunit is their execution at run time. When a normal codeunit is run, if one of its functions fails, then the codeunit is terminated. When a test codeunit is run, if a function fails, then the function is terminated, but the codeunit continues to run the remaining functions.  
  
 A test runner codeunit runs the test codeunits that are programmed to run from its OnRun trigger. When a test runner codeunit runs, it does the following:  
  
-   Calls the [OnBeforeTestRun Trigger](OnBeforeTestRun-Trigger.md) before each test codeunit, and the OnRun function and test function is executed.  
  
-   Calls the [OnAfterTestRun Trigger](OnAfterTestRun-Trigger.md) after each test code unit, and the OnRun function and test function is executed.  
  
-   Indicates that a test function has failed if it invokes the user interface.  
  
 For more information, see [Testing the Application](Testing-the-Application.md).  
  
## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)   
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)   
 [Codeunits](Codeunits.md)