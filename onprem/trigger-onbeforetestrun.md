---
title: "OnBeforeTestRun Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# OnBeforeTestRun Trigger
Executed before a test function of a test codeunit is run.

```
OnBeforeTestRun(CodeunitID : Integer;CodeunitName : Text[30];FunctionName : Text[128]; TestPermissions : Text) Ok : Boolean)

```

## Parameters
*CodeunitID*

Type: Integer

Specifies the ID of the codeunit that has run.

*CodeunitName*

Type: Text

Specifies the name of the test codeunit to be run.

*FunctionName*

Type: Text

Specifies the name of the test function to be run.

> [!NOTE]  
>  This parameter is empty when the **OnBeforeTestRun** trigger is called for the entire test codeunit.  

*Permissions*

Type: TestPermissions

Specifies the permission set level to use on the test run. The value is retrieved from the [TestPermissions property](testing-permissionsets.md) of the test codeunit or test function that is run. The parameter accepts the following values:

*   **Disabled**
*   **Restrictive**
*   **NonRestrictive**
*   **InheritFromTestCodunit** - Specifies that a test the function uses the **TestPermissions** property setting of the test codeunit to which it belongs.

For more information, see [Testing With Permission Sets](testing-permissionsets.md). 

## Return Value
*Ok*

Type: Boolean

**true** to run the test function; otherwise, **false**. This value is checked after each function call.

## Applies to
Test runner codeunits. Test runner codeunits have the **SubType** Property set to **TestRunner**.

**Note**: This trigger is optional and not available on a test runner codeunit by default. To implement this trigger, you must manually add it as a function.  

## Remarks
A test runner codeunit manages the execution of test codeunits that are run from its **OnRun** function. When a test codeunit runs, it executes each test function in the codeunit, one at a time. The **OnBeforeTestRun** trigger is called before the test codeunit, the OnRun function, and each test function.

You can use the **OnBeforeTestRun** trigger to perform preprocessing, such as general initialization and logging, or to automate tests by integrating the test runner codeunit with a test management framework.

By using the *TestPermissions* parameter, you can add code to control which permission sets, if any, to test.

The **OnBeforeTestRun** trigger is run in its own database transaction.

For more information, see [Testing the Application](Testing-the-Application.md) and [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md).  

## Example
The following **OnBeforeTestRun** trigger code initializes a logging variable and returns true to indicate that the test function should execute. This example requires that you create the following global variable.

|Variable Name  |Data Type  |
|----------|-------------|
|Before|DateTime|

```
Before := CURRENTDATETIME;
EXIT(true);
```

## See Also  
[TestPermissions Property](property-testpermissions.md)  
[OnAfterTestRun Trigger](trigger-onaftertestrun.md)  
[Testing With Permission Sets](testing-permissionsets.md)  
[Testing the Application](Testing-the-Application.md)  
[How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)  
[How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)  
[How to: Create Handler Functions](How-to--Create-Handler-Functions.md)  
[Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)  
