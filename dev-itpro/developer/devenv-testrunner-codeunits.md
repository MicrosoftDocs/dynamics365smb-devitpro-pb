---
title: Create Test Runner Codeunits in AL
description: Learn how to create test runner codeunits in AL to manage the execution of test codeunits and integrate with test management or test reporting frameworks.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: how-to
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Create test runner codeunits

You can create test runner codeunits to manage the execution of test codeunits and to integrate with test management or test reporting frameworks. By integrating with a test management framework, you can automate your tests and enable them to run unattended.  

To create a test runner codeunit, create a codeunit and set the [SubType Property](properties/devenv-subtype-codeunit-property.md) to **TestRunner**.

To specify what changes in the database you want to roll back after the tests in the test runner codeunit execute, set the [TestIsolation Property](properties/devenv-testisolation-property.md).

<!--
> [!TIP]
> In the test runners in the automated application test libraries on the Dynamics NAV product media, test isolation is set to Codeunit.
-->

Test runner codeunits include the following triggers:  

- [OnRun Trigger](triggers-auto/codeunit/devenv-onrun-codeunit-trigger.md) 

- [OnBeforeTestRun Trigger](triggers-auto/codeunit/devenv-onbeforetestrun-codeunit-trigger.md)  

- [OnAfterTestRun Trigger](triggers-auto/codeunit/devenv-onaftertestrun-codeunit-trigger.md)  

In the **OnRun** trigger, you'll enter the code to run the codeunits. It runs when you execute the codeunit and before the test methods run. You can use the **OnBeforeTestRun** and the **OnAfterTestRun** triggers to perform preprocessing and postprocessing, such as initialization or logging test results. If you implement the **OnBeforeTestRun** trigger, then it executes before each test method executes. If you implement the **OnAfterTestRun** trigger, then it executes after each test method executes and also suppresses the automatic display of the results message.  

> [!WARNING]  
> The **OnBeforeTestRun** and **OnAfterTestRun** triggers always run in their own transactions, regardless of the value of the [TestIsolation Property](properties/devenv-TestIsolation-Property.md), the value of the [TransactionModel Property](./properties/devenv-properties.md), or the outcome of a test method. 

## Example

This sample codeunit runs three test codeunits in the automated application test libraries.

```al
codeunit 50101 TestRunnerCodeunit
{
    Subtype = TestRunner;

    trigger OnRun()
    begin
        Codeunit.Run(Codeunit::"ERM Vendor Statistics");
        Codeunit.Run(Codeunit::"ERM Sales Quotes");
        Codeunit.Run(Codeunit::"ERM Dimension");
    end;
}
```

You may want to define your test suite in a table and then write code in the test runner codeunit to iterate through the items in the table. And then run each test codeunit. In that case, you can make use of the following example.

```al
codeunit 50102 EnabledTestRunnerCodeunit
{
    Subtype = TestRunner;

    trigger OnRun()
    var
        EnabledTestCodeunit: Record "CAL Test Enabled Codeunit";
        AllObj: Record AllObj;
    begin
        if EnabledTestCodeunit.FindSet() then
            repeat
                if AllObj.Get(AllObj."Object Type"::Codeunit, EnabledTestCodeunit."Test Codeunit ID") then
                    Codeunit.Run(EnabledTestCodeunit."Test Codeunit ID");
            until EnabledTestCodeunit.Next() = 0;
    end;
}
```

## Related information
[Testing the Application](devenv-Testing-Application.md)
