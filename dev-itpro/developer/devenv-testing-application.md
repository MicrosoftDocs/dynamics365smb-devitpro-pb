---
title: "Testing the Application Overview"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: jswymer
---

# Testing the Application Overview

Before you release your [!INCLUDE[prodshort](includes/prodshort.md)] application, you should test its functionality to ensure it works as expected. Testing is an iterative process. It's important to create repeatable tests, and helpful to create tests that can be automated. This article describes the features in [!INCLUDE[prodshort](includes/prodshort.md)] that help you test the business logic in your application, and it provides some best practices for testing.

For a walkthrough concerning advanced extension testing, see [Testing the Advanced Extension Sample](devenv-extension-advanced-example-test.md).

[!INCLUDE[prodshort](includes/prodshort.md)] includes the below features to help you test your application.

## Environment testing support and limitations

The extent to which you can run automated tests will depend on your [!INCLUDE[prodshort](includes/prodshort.md)] solution type and environment. The following table gives an overview.

|[!INCLUDE[prodshort](includes/prodshort.md)] solution|Environment|Testing allowed|More details|
|-----------------------------------------------------|-----------|-------|----|
|Online |Production||Running tests isn't allowed because it might have an adverse effect on your business. Testing can incidentally invoke external systems, like CDS, PayPal, and web hook subscriptions. Invoking these systems may slow down the solution for other users or cause data corruption.|
||Sandbox|![check](media/check.png)|You can use a sandbox environment to run tests manually to verify functionality on an environment. Running a large number of tests or tests that take a long time (more than 15 minutes per test method) isn't allowed. It's recommended that you don't run tests more that one or two hours a day.|
|On-premises|Production|![check](media/check.png)|For Business Central on-premises, running automated tests is only possible with a Partner license or a license that includes the Application Builder module.<br /><br />You can disable the ability to run tests by turning off **Enable Test Automation** (TestAutomationEnabled) on the [!INCLUDE[server](includes/server.md)] instance. For more information, see [Configuring Business Central Server - General Settings](../administration/configure-server-instance.md#General)|
||Container-based development environment|![check](media/check.png)|This setup should be the default environment for running large number of tests or setting up CI/CD gates. For more information, see [Running a Container-Based Development Environment](devenv-running-container-development.md) or [Running Tests In Containers](https://freddysblog.com/2019/10/22/running-tests-in-containers-2).|

## Test Codeunits and Test Methods 

You write tests as AL code in methods of codeunits that are configured to be test codeunits. Test codeunits have the [SubType Property](properties/devenv-subtype-codeunit-property.md) set to **Test**. There are three types of methods that you can add in a test codeunit: test, handler, and normal. Each method type is used for a specific purpose and behaves differently. When a test codeunit runs, it executes the **OnRun** trigger, and then executes each test method in the codeunit. The outcome of a test method is either SUCCESS or FAILURE.

This pattern doesn't apply to test isolation and isn't recommended as a method for running tests.

For more information about test codeunits and test methods, see [Test Codeunits and Test Methods](devenv-test-codeunits-and-test-methods.md).

## Test Runner Codeunits
  
You use test runner codeunits to manage the execution of test codeunits and to integrate with other test management, execution, and reporting frameworks. By integrating with a test management framework, you can automate your tests and enable them to run unattended.  

Test runner codeunits are codeunits that have the [SubType Property](properties/devenv-subtype-codeunit-property.md) set to **TestRunner**.

Test runner codeunits include the following triggers:  

-   [OnRun Trigger](triggers/devenv-onrun-trigger.md) 

-   [OnBeforeTestRun Trigger](triggers/devenv-OnBeforeTestRun-Trigger.md)  

-   [OnAfterTestRun Trigger](triggers/devenv-OnAfterTestRun-Trigger.md)  

 In the **OnRun** trigger you enter the code to run the codeunits. It runs when you execute the codeunit and before the test methods run. You can use the **OnBeforeTestRun** and the **OnAfterTestRun** triggers to do preprocessing and postprocessing, such as initialization or logging test results.  

For more information about test runner codeunits, see [Test Runner Codeunits](devenv-testrunner-codeunits.md).

> [!TIP]
> You can reuse test runners from [Test Runner module](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/DevTools/TestFramework/TestRunner) in the Microsoft/ALAppExtensions GitHub repo. You can also use the repo to request for the new functionality.

## Test Pages

Test pages mimic actual pages but don't present any UI on a client computer. Test pages let you test the code on a page by using AL to simulate user interaction with the page.  

There are two types of test pages:  

- TestPage, which is a regular page and can be any kind of page. It includes page parts and subpages as well.  

- TestRequestPage, which represents the request page on a report.  

You access the page's fields and properties or a field by using the dot notation. You open and close test pages, do actions on the test page, and navigate around the test page by using AL methods. For more information, see [Testing Pages](devenv-testing-pages.md).

## UI Handlers
To create tests that can be automated, you must handle cases when user interaction is requested by code that is being tested. UI handlers run instead of the requested UI. UI handlers provide the same exit state as the UI. For example, a method that has the [ConfirmHandler Attribute](methods/devenv-confirmhandler-attribute.md) set handles [CONFIRM Method](methods-auto/dialog/dialog-confirm-method.md) calls. If code that is being tested calls the [CONFIRM Method](methods-auto/dialog/dialog-confirm-method.md), then the **ConfirmHandler** method is called instead of the [CONFIRM Method](methods-auto/dialog/dialog-confirm-method.md). You write code in the **ConfirmHandler** method to verify that the expected question is displayed by the [CONFIRM Method](methods-auto/dialog/dialog-confirm-method.md). You write AL code to return the relevant reply. 

You create a specific handler for each page that you want to handle and a specific report handler for each report that you want to handle.  

If you run a test codeunit from a test runner codeunit, then any unhandled UI in the test methods of the test codeunit causes a failure of the test. If you do not run the test codeunit from a test runner codeunit, then any unhandled UI is displayed as it typically would. 

For more information, see [Creating Handler Methods](devenv-creating-handler-methods.md). 

## ASSERTERROR Keyword
You use `AssertError` statements in test methods to test how your application behaves under failing conditions. These statements are called positive and negative tests. The `AssertError` keyword specifies that an error is expected at run time in the statement that follows the `AssertError` keyword.

If a simple or compound statement that follows the `AssertError` keyword causes an error, then execution successfully continues to the next statement in the test method. You can get the error text of the statement by using the [GETLASTERRORTEXT Method](methods-auto/system/system-getlasterrortext-method.md).

If a statement that follows the `AssertError` keyword doesn't cause an error, then the `AssertError` statement causes the following error and the test method that is running produces a FAILURE result.

> [!IMPORTANT]
> Use ASSERTERROR in test code only. It isn't allowed or supported in production code.

### Example  
To create a test method to test the result of a failure of a CheckDate method that you've defined, you can use the following code. This example requires that you create a method called CheckDate. This method checks whether the date is valid for the customized application. You also create the following text constant, *Date* variable InvalidDate, and *Text* variable InvalidDateErrorMessage.  

```  
InvalidDate := 010184D;  
InvalidDateErrorMessage := 'The date is outside the valid date range.';  
ASSERTERROR CheckDate(InvalidDate);  
if GETLASTERRORTEXT <> InvalidDateErrorMessage then  
  ERROR('Unexpected error: %1', GETLASTERRORTEXT);  
```

<!--
## Test with Permission Sets

Users typically run with a permission set that limits access to the functionality they need to do their work. To ensure that it works as intended, write application tests in AL that use specific permission sets. For more information, see [Testing with Permission Sets](devenv-testing-with-permission-sets.md).

-->
## Testing Best Practices

We recommend the following best practices for designing your application tests:  

- Test code should be kept separate from the code that is being tested. That way, you can release the tested code to a production environment without releasing the test code.  

- Test code should test that the code works as intended both under successful and failing conditions. These tests are called positive and negative tests. The positive tests validate that the code being tested works as intended under successful conditions. The negative tests validate that the code being tested work as intended under failing conditions.  

  1. In positive tests, the test method should validate the results of application calls, such as return values, state changes, or database transactions.

  2. In negative tests, the test method should validate that the intended errors occur, error messages are presented, and data has the expected values.  

- Automated tests shouldn't require user intervention.  

- Tests should leave the system in the same well-known state as when the test started. This way, you can rerun the test or run other tests in any order and always start from the same state.  

- Test execution and reporting should be fast and able to integrate with the test management system. This way, the tests can be used as check-in tests or other build verification tests. These other tests typically run on unattended servers.  

- Create test methods that follow the same pattern:  

  1. Initialize and set up the conditions for the test.  

  2. Invoke the business logic that you want to test.  

  3. Validate that the business logic worked as expected.  

<!-- TO DO: Check this-->
- Only use hardcoded values in tests when you really need it. For all other data, consider using random data.

    For example, you want to test the `Ext. Doc. No. Mandatory` field in the `Purchases & Payables Setup` table. To do this, you need to create and post typical purchase invoice. The typical purchase invoice line specifies an amount. For most tests, it doesn't matter exactly what amount. For inspiration, see the use of the **GenerateRandomCode** method in the tests that are included in the **TestToolkit** folder on the [!INCLUDE[prodshort](includes/prodshort.md)] product media. For more information, see [Random Test Data](devenv-random-test-data.md). 

    > [!TIP]
    > Use the [Any module](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/DevTools/TestFramework/TestLibraries/Any) in the Microsoft/ALAppExtensions GitHub repo to generate pseudo-random values during test set-up. This module generates the same set of numbers, allowing you to reproduce test failures.

- Tests should be readable and fast to execute. We recommend that test codeunits run under 2 minutes, and that you don't add more than 100 test methods to the codeunit.
<!--- Monitor code coverage. For more information, see [Code Coverage](uiref/-$-N_9990-Code-Coverage-$-.md). -->


<!-- TO DO: Add articles for the links below-->
## See Also
 <!--[Application Test Automation](Application-Test-Automation.md)   -->
[Testing Pages](devenv-Testing-Pages.md)   
<!--[Testing with Permission Sets](devenv-testing-with-permission-sets.md) -->    
[Creating Handler Methods](devenv-creating-handler-methods.md)      
[Test Codeunits and Test Methods](devenv-test-codeunits-and-test-methods.md)   
[Application Testing Example: Testing Purchase Invoice Discounts](devenv-test-application-example-purchase-invoice-discounts.md)     
[Random Test Data](devenv-Random-Test-Data.md)    
[Testing the Advanced Extension Sample](devenv-extension-advanced-example-test.md)
<!--[How to: Run Automated ApplicationTests](How-to--Run-Automated-ApplicationTests.md)   -->
<!--[Walkthrough: Create a Test with Confirmation Dialog](Walkthrough--Create-a-Test-with-Confirmation-Dialog.md)  -->

