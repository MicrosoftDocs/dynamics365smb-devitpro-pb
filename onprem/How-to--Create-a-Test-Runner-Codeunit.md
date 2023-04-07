---
title: Create a Test Runner Codeunit
description: You can create test runner codeunits to manage the execution of test codeunits and to integrate with test management or test reporting frameworks.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 97562b1d-e7ec-4a7b-9e0c-229905eb3e3f
caps.latest.revision: 23
---
# Creating a Test Runner Codeunit
You can create test runner codeunits to manage the execution of test codeunits and to integrate with test management or test reporting frameworks.  

### To create a test runner codeunit  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in **Object Designer**, create a new codeunit.  

2.  In the **Properties** window for the new codeunit, in the **Subtype** field, select **TestRunner** to specify that this is a test runner codeunit.  

3.  In the **TestIsolation** field, specify which changes that you want to roll back. You can choose from the following values:  

    -   Disabled  

    -   Codeunit  

    -   Function  

     For more information, see [TestIsolation Property](TestIsolation-Property.md).  

    > [!TIP]  
    >  In the test runners in the automated application test libraries on the [!INCLUDE[navnow](includes/navnow_md.md)] product media, test isolation is set to **Codeunit**.  

4.  In the C/AL Editor, in the **OnRun** function, enter code to run the test codeunits. For example, the following code in the **OnRun** function of a test runner codeunit runs three test codeunits in the automated application test libraries.  

    ```  
    CODEUNIT.RUN(CODEUNIT::”ERM Vendor Statistics”);   
    CODEUNIT.RUN(CODEUNIT::”ERM Sales Quotes”);   
    CODEUNIT.RUN(CODEUNIT::”ERM Dimension”);   
    ```  

5.  \(optional\) You may want to define your test suite in a table and then write code in the **OnRun** function of the test runner codeunit to iterate through items in the table and run each test codeunit.  

    1.  In that case, add the following variables to the **OnRun** function in the test runner codeunit.  

        |Name|DataType|Subtype|  
        |----------|--------------|-------------|  
        |EnabledTestCodeunit|Record|CAL Test Enabled Codeunit|  
        |Object|Record|Object|  

    2.  In the **C/AL Editor**, in the **OnRun** function, delete the existing code, and then enter code that iterates through items in the table and runs each test codeunit.  

         The following code example illustrates the code that you can add to the test runner.  

        ```  
        IF EnabledTestCodeunit.FINDSET THEN  
          REPEAT  
            IF Object.GET(Object.Type::Codeunit,'',EnabledTestCodeunit."Test Codeunit ID") THEN  
              CODEUNIT.RUN(EnabledTestCodeunit."Test Codeunit ID");  
          UNTIL EnabledTestCodeunit.NEXT = 0  

        ```  

6.  \(optional\) You may want to save the results of the test execution in the database. This example requires that you add two triggers \(steps 7 and 8\).  

    1.  Add the following global variables.  

        |Name|DataType|  
        |----------|--------------|  
        |StartTime|Time|  
        |TestRunNo|Integer|  

    2.  To initialize the **TestRunNo** trigger, add a local variable to the **OnRun** function.  

        |Name|DataType|Subtype|  
        |----------|--------------|-------------|  
        |TestResult|Record|CAL TestResult|  

    3.  Add the following line of code at the beginning of the **OnRun** function:  

        ```  
        TestRunNo := TestResult.LastTestRunNo + 1;  
        ```  

7.  To create an **OnBeforeTestRun** trigger, do the following steps:  

    1.  In the **C/AL Globals** window, on the **Functions** tab, on a new line in the **Name** field, enter **OnBeforeTestRun**, and then choose **Locals**.  

    2.  In the **C/AL Locals** window, on the **Parameters** tab, enter the following.  

        |Name|DataType|Length|  
        |----------|--------------|------------|  
        |CodeunitID|Integer||  
        |CodeunitName|Text|30|  
        |FunctionName|Text|128|  

    3.  In the **C/AL Locals** window, on the **Return Value** tab, enter the following.  

        |Name|Return type|  
        |----------|-----------------|  
        |OK|Boolean|  

    4.  In the **C/AL Locals** window, on the **Variables** tab, enter the following.  

        |Name|DataType|Subtype|  
        |----------|--------------|-------------|  
        |TestResult|Record|CAL Test Result|  

    5.  Close the **C/AL Locals** window.  

    6.  In the C/AL Editor, in the **OnBeforeTestRun** trigger, enter code that executes before each test function. Typically, the code in the **OnBeforeTestRun** function determines if the test function should execute and returns **true** if it should. Otherwise, the trigger returns **false**. The **OnBeforeTestRun** trigger may also initialize logging variables. For example, the following code initializes a logging variable and returns **true** to indicate that the test function should execute.  

        ```  
        StartTime := TIME;  

        IF FunctionName  = '' THEN  
          EXIT(TRUE);  

        CLEARLASTERROR;  
        TestResult.Create(TestRunNo,CodeunitId,CodeunitName,FunctionName);  
        EXIT(TRUE)  
        ```  

8.  To create an **OnAfterTestRun** trigger, do the following steps:  

    1.  In the **C/AL Globals** window, on the **Functions** tab, on a new line in the **Name** field, enter **OnAfterTestRun**, and then choose **Locals**.  

    2.  In the **C/AL Locals** window, on the **Parameters** tab, enter the following.  

        |Name|DataType|Length|  
        |----------|--------------|------------|  
        |CodeunitID|Integer||  
        |CodeunitName|Text|30|  
        |FunctionName|Text|128|  
        |Success|Boolean||  

    3.  In the **C/AL Locals** window, on the Variables tab, enter the following.  

        |Name|DataType|Subtype|  
        |----------|--------------|-------------|  
        |TestResult|Record|CAL Test Result|  
        |EndTime|Time||  

    4.  In the C/AL Editor, in the **OnAfterTestRun** trigger, enter code that executes after each test function. For example, the following code logs the results of the tests to the test reporting system. This example requires that you create a record variable named `log`.  

        ```  
        IF FunctionName  = '' THEN  
          EXIT;  
        EndTime := TIME;  

        TestResult.FINDLAST;  
        IF (FunctionName  = 'OnRun') AND Success THEN BEGIN  
          TestResult.DELETE;  
          EXIT;  
        END;  

        TestResult.Update(Success,EndTime - StartTime,FALSE)  
        ```  

        > [!NOTE]  
        >  If you implement the **OnAfterTestRun** trigger, then it suppresses the automatic display of the results message after the test codeunit runs.  

9. On the **File** menu, choose **Save**.  

10. In the **Save As** window, in the **ID** field, enter an ID and in the **Name** field, enter a name for the codeunit. Verify that the **Compiled** check box is selected, and then choose **OK**.  

## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)   
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)   
 [Application Test Automation](Application-Test-Automation.md)  
[Testing with Permission Sets](testing-permissionsets.md)  
