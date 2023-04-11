---
title: "Testing the Application"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7f7961ce-7256-43e9-9dc5-7fd93e65ee3a
caps.latest.revision: 32
---
# Testing the Application
Before you release your [!INCLUDE[navnow](includes/navnow_md.md)] application, you must test its functionality. Testing is an iterative process. It is important to create repeatable tests, and it is helpful to create tests that can be automated. This topic describes the features in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] that help you test the business logic in your application and some best practices for testing your [!INCLUDE[navnow](includes/navnow_md.md)] application.  

## Test Features  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes the following features to help you test your application:  

-   Test codeunits  

-   Test runner codeunits  

-   Test pages  

-   UI handlers  

-   ASSERTERROR statement  

-   Test with permission sets

    For more information, see [Testing with Permission Sets](testing-permissionsets.md).

### Test Codeunits  
 You write test functions as C/AL code in the test codeunits. When a test codeunit runs, it executes the OnRun function, and then executes each test function in the codeunit. By default, each test function runs in a separate database transaction, but you can use the [TransactionModel Property](TransactionModel-Property.md) on test functions and the [TestIsolation Property](TestIsolation-Property.md) on test runner codeunits to control the transactional behavior. By default, the results of a test codeunit are displayed in a message window, but you can use the [OnAfterTestRun Trigger](OnAfterTestRun-Trigger.md) on a test runner codeunit to capture the results. The outcome of a test function is either SUCCESS or FAILURE. If any error is raised by either the code that is being tested or the test code, then the outcome is FAILURE and the error is included in the results log file.  

 Even if the outcome of one test function is FAILURE, the next test functions are still executed.  

 The functions in a test codeunit are one of the following types:  

-   Test function  

-   Handler function  

-   Normal function  

 For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).  

### Test Runner Codeunits  
 You use test runner codeunits to manage the execution of test codeunits and to integrate with other test management, execution, and reporting frameworks. By integrating with a test management framework, you can automate your tests and enable them to run unattended.  

 Test runner codeunits include the following triggers:  

-   [OnBeforeTestRun Trigger](OnBeforeTestRun-Trigger.md)  

-   [OnAfterTestRun Trigger](OnAfterTestRun-Trigger.md)  

 You can use these triggers to perform preprocessing and postprocessing, such as initialization or logging test results. If you implement the **OnBeforeTestRun** trigger, then it executes before each test function executes. If you implement the **OnAfterTestRun** trigger, then it executes after each test function executes and also suppresses the automatic display of the results message.  

> [!NOTE]  
>  The **OnBeforeTestRun** and **OnAfterTestRun** triggers are optional. By default, they are not available on a test runner codeunit. To implement these triggers, you must manually add them as functions and you must specify the correct signature.  

> [!WARNING]  
>  The **OnBeforeTestRun** and **OnAfterTestRun** triggers always run in their own transactions, regardless of the value of the [TestIsolation Property](TestIsolation-Property.md), the value of the [TransactionModel Property](TransactionModel-Property.md), or the outcome of a test function.  

 For more information, see [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md).  

### Test Pages  
 Test pages mimic actual pages but do not present any UI on a client computer. Test pages let you test the code on a page by using C/AL to simulate user interaction with the page.  

 There are two types of test pages:  

-   TestPage, which is a regular page and can be any kind of page. This includes page parts or subpages.  

-   TestRequestPage, which represents the request page on a report.  

 You can access the fields on a page and the properties of a page or a field by using the dot notation. You can open and close test pages, perform actions on the test page, and navigate around the test page by using C/AL functions. For more information, see [Testing Pages](Testing-Pages.md).  

### UI Handlers  
 To create tests that can be automated, you must handle cases when user interaction is requested by code that is being tested. UI handlers run instead of the requested UI. UI handlers provide the same exit state as the UI. For example, a test function that has a FunctionType of ConfirmHandler handles CONFIRM function calls. If code that is being tested calls the CONFIRM function, then the ConfirmHandler function is called instead of the CONFIRM function. You write code in the ConfirmHandler function to verify that the expected question is displayed by the CONFIRM function and you write C/AL code to return the relevant reply.  

 The following table describes the available UI handlers.  

|Function type|Purpose|  
|-------------------|-------------|  
|MessageHandler|Handles MESSAGE statements.|  
|ConfirmHandler|Handles CONFIRM statements.|  
|StrMenuHandler|Handles STRMENU statements.|  
|PageHandler|Handles specific pages that are not run modally.|  
|ModalPageHandler|Handles specific pages that are run modally.|  
|ReportHandler|Handles specific reports.|  
|RequestPageHandler|Handles the request page of a specific report.|  
|HyperlinkHandler|Handles specific hyperlinks.|  
|SendNotificationHandler|Handles [SEND](function-notificationsend.md) statements.|  
|RecallNotificationHandler|Handles [RECALL](function-notificationrecall.md) statements.|  
|SessionSettingsHandler|Handles [REREQUESTSESSIONUPDATE](requestsessionupdate-function-sessionsettings.md) statements.|  

You create a specific handler for each page that you want to handle and a specific report handler for each report that you want to handle.  

If you run a test codeunit from a test runner codeunit, then any unhandled UI in the test functions of the test codeunit causes a failure of the test. If you do not run the test codeunit from a test runner codeunit, then any unhandled UI is displayed as it typically would.  

 For more information, see [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  

### ASSERTERROR Keyword  
 When you test your application, you should test that your code performs as expected under both successful and failing conditions. These are called positive and negative tests. To test how your application performs under failing conditions, you can use the ASSERTERROR keyword. The ASSERTERROR keyword specifies that an error is expected at run time in the statement that follows the ASSERTERROR keyword. If a simple or compound statement that follows the ASSERTERROR keyword causes an error, then execution successfully continues to the next statement in the test function. If a statement that follows the ASSERTERROR keyword does not cause an error, then the ASSERTERROR statement itself fails with an error, and the test function that is running produces a FAILURE result.  

 For more information, see [C/AL ASSERTERROR Statements](C-AL-ASSERTERROR-Statements.md).  

## Testing Best Practices  
 We recommend the following best practices for designing your application tests:  

-   Test code should be kept separate from the code that is being tested. That way, you can release the tested code to a production environment without releasing the test code.  

-   Test code should test that the code being tested works as intended both under successful and failing conditions. These are called positive and negative tests. The positive tests validate that the code being tested works as intended under successful conditions. The negative tests validate that the code being tested work as intended under failing conditions.  

    1.  In positive tests, the test function should validate the results of application calls, such as return values, state changes, or database transactions.  

    2.  In negative tests, the test function should validate that the intended errors occur, error messages are presented, and the data has the expected values.  

-   Automated tests should not require user intervention.  

-   Tests should leave the system in the same well-known state as when the test started so that you can re-run the test or run other tests in any order and always start from the same state.  

-   Test execution and reporting should be fast and able to integrate with the test management system so that the tests can be used as check-in tests or other build verification tests, which typically run on unattended servers.  

-   Create test functions that follow the same pattern:  

    1.  Initialize and set up the conditions for the test.  

    2.  Invoke the business logic that you want to test.  

    3.  Validate that the business logic performed as expected.  

-   Only use hardcoded values in tests when you really need it. For all other data, consider using random data. For example, you want to test the **Ext. Doc. No. Mandatory** field in the **Purchases &amp; Payables Setup** table. To do this you need to create and post typical purchase invoice. The typical purchase invoice line specifies an amount. For most tests, it does not matter exactly what amount. For inspiration, see the use of the `GenerateRandomCode` function in the tests that are included in the **TestToolkit** folder on the [!INCLUDE[navnow](includes/navnow_md.md)] product media. For more information, see [Random Test Data](Random-Test-Data.md).  

-   Monitor code coverage. For more information, see [Code Coverage](uiref/-$-N_9990-Code-Coverage-$-.md).  

## See Also  
 [Application Test Automation](Application-Test-Automation.md)   
 [Testing Pages](Testing-Pages.md)   
 [How to: Run Automated ApplicationTests](How-to--Run-Automated-ApplicationTests.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)   
 [Walkthrough: Create a Test with Confirmation Dialog](Walkthrough--Create-a-Test-with-Confirmation-Dialog.md)   
 [Random Test Data](Random-Test-Data.md)
