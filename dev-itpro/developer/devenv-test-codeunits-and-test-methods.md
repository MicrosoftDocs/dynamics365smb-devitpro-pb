---
title: Test Codeunits and Test Methods in AL
description: Learn how to create test codeunits and test methods in AL, set the SubType property to Test, and use the different test method attributes in Business Central.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Create test codeunits and test methods

In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you can create test codeunits and then test methods in the test codeunits.  

Test codeunits are codeunits that have the [SubType property](properties/devenv-subtype-codeunit-property.md) set to **Test**. You write tests as AL code in the methods inside of the test codeunits. There are three types of methods that you can add in a test codeunit: test, handler, and normal. Each method type is used for a specific purpose and behaves differently. When a test codeunit runs, it runs the **OnRun** trigger, and then runs each test method in the codeunit.

By default, each test method runs in a separate database transaction, but you can use the [TransactionModel attribute](attributes/devenv-transactionmodel-attribute.md) on test methods and the [TestIsolation property](properties/devenv-testisolation-property.md) on test runner codeunits to control the transactional behavior. 

The results of a test codeunit and of the individual test methods are displayed in a message window, but you can use the [OnAfterTestRun trigger](triggers-auto/codeunit/devenv-onaftertestrun-codeunit-trigger.md) on a test runner codeunit to capture the results. The outcome of a test method is either SUCCESS or FAILURE. If any error is raised by either the code that is being tested or the test code, then the global outcome of the test codeunit is FAILURE and the error is included in the results log file.  

The difference between a normal codeunit and a test codeunit is their execution at runtime. When a normal codeunit is run, if one of its methods fails, then the codeunit is terminated. When a test codeunit is run, even if the outcome of one test method is FAILURE, the next test methods are still running.  

The methods in a test codeunit can be one of the following types:  

|Type|Description|
|-------|-----------|
|Test method|You use test methods that include AL code that tests the business logic in the application, where each method covers a transaction. You declare the [Test attribute](attributes/devenv-test-attribute.md) on the method.|
|Handler method|You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. You declare a handler type attribute on the method. Learn more in [Create handler methods](devenv-creating-handler-methods.md).|
|Normal method|You use normal methods to structure the test code by using the same design practices and principles as methods in other codeunits of the application. You declare the [Normal attribute](attributes/devenv-normal-attribute.md) on the method.|

## Test properties

[!INCLUDE [2025-releasewave2-later](../includes/2025-releasewave2-later.md)]

By using runtime 16, you can use the [RequiredTestIsolation property](properties/devenv-requiredtestisolation-property.md) on test codeunits to specify the required test isolation level for the test codeunit. You can also use the [TestType property](properties/devenv-testtype-property.md) to categorize tests.

## Add lifecycle handlers to test codeunits

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

> [!NOTE]
> This feature is available in preview with a prerelease of runtime 18 and Business Central Server version 29.

Starting with runtime 18.0, the [TestHandlers property](properties/devenv-testhandlers-property.md) lets a test codeunit register codeunits that receive callbacks during a test run. Use these callbacks for cross-cutting tasks such as logging, cleanup, performance measurement, and test reporting. The `TestHandlers` property is available only on codeunits where `Subtype = Test`. Set the `runtime` value in the `app.json` file to `18.0` or later to use this property and its supporting types.

Each handler codeunit implements the `ITestHandler` interface. The interface provides the following lifecycle callbacks. The methods have default implementations, so a handler only needs to implement the callbacks that it uses.

| Callback | Invocation |
|---------|------------|
| `OnBeforeTestCodeunitRun` | Once, before the test codeunit starts |
| `OnAfterTestCodeunitRun` | Once, after the test codeunit finishes |
| `OnBeforeTestProcedureRun` | Before each test procedure |
| `OnAfterTestProcedureRun` | After each test procedure |
| `OnBeforeTestCaseRun` | Before each case in a data-driven test |
| `OnAfterTestCaseRun` | After each case in a data-driven test |

The following example implements a handler, registers it as a value in the extensible `TestHandler` system enum, and assigns that value to a test codeunit.

```al
codeunit 50100 "Test Activity Logger" implements ITestHandler
{
    procedure OnBeforeTestProcedureRun(Context: TestHandlerContext)
    begin
        Message('Starting %1.', Context.ProcedureName);
    end;

    procedure OnAfterTestProcedureRun(Context: TestHandlerContext)
    begin
        Message('Finished %1. Success: %2.', Context.ProcedureName, Context.Success);
    end;
}

enumextension 50100 "Sample Test Handlers" extends TestHandler
{
    value(50100; ActivityLogger)
    {
        Implementation = ITestHandler = "Test Activity Logger";
    }
}

codeunit 50101 "Sales Tests"
{
    Subtype = Test;
    TestHandlers = ActivityLogger;

    [Test]
    procedure SalesDocumentCanBeCreated()
    begin
        // Run the test.
    end;
}
```

You can list multiple `TestHandler` values in `TestHandlers`, separated by commas. Codeunit-specific handlers run in the listed order. Both `TestHandler` and `DefaultTestHandler` are extensible system enums whose values map `ITestHandler` to implementing codeunits. To register a handler for every test codeunit, add its mapping to an extension of `DefaultTestHandler` instead. Default handlers run before handlers registered on a test codeunit.

### Use the test handler context

Each callback receives a read-only [TestHandlerContext](methods-auto/testhandlercontext/testhandlercontext-data-type.md) value with information about the current scope.

| Member | Description and use |
|--------|--------------------|
| [CodeunitId](methods-auto/testhandlercontext/testhandlercontext-codeunitid-method.md) | Contains the test codeunit ID in every callback. |
| [CodeunitName](methods-auto/testhandlercontext/testhandlercontext-codeunitname-method.md) | Contains the fully qualified test codeunit name in every callback. |
| [ProcedureName](methods-auto/testhandlercontext/testhandlercontext-procedurename-method.md) | Contains the test procedure name in procedure-level and case-level callbacks. It's empty in codeunit-level callbacks. |
| [TestCaseName](methods-auto/testhandlercontext/testhandlercontext-testcasename-method.md) | Contains the value returned by `ITestContext.Identifier` in case-level callbacks. It's empty in other callbacks. |
| [Success](methods-auto/testhandlercontext/testhandlercontext-success-method.md) | Indicates the result in `OnAfterTestCodeunitRun`, `OnAfterTestProcedureRun`, and `OnAfterTestCaseRun`. Its value is `false` in before callbacks. |
| [Skip(Reason)](methods-auto/testhandlercontext/testhandlercontext-skip-method.md) | Skips the current procedure or data-driven case when called from `OnBeforeTestProcedureRun` or `OnBeforeTestCaseRun`. The reason appears in the test result and log. Calling this method from an after callback has no effect. |

For a standard test procedure, the procedure callbacks run between the codeunit callbacks. For a data-driven procedure, all case callbacks run inside its procedure callbacks:

```text
OnBeforeTestCodeunitRun
  OnBeforeTestProcedureRun
    OnBeforeTestCaseRun
    OnAfterTestCaseRun
    OnBeforeTestCaseRun
    OnAfterTestCaseRun
  OnAfterTestProcedureRun
OnAfterTestCodeunitRun
```

Case callbacks run only for procedures that use the `TestDataSource` attribute.

## Create data-driven tests

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

> [!NOTE]
> This feature is available in preview with a prerelease of runtime 18 and Business Central Server version 29.

Starting with runtime 18.0, the [TestDataSource attribute](attributes/devenv-testdatasource-attribute.md) runs one test method with multiple context values. The attribute takes a codeunit that supplies the cases and a text dataset identifier:

```al
[TestDataSource(Codeunit::"Late Fee Data Source", 'late-fees')]
procedure LateFeeIsCalculated(Context: interface "Late Fee Test Context")
begin
end;
```

The test method must be public, must not return a value, and must have exactly one parameter. The parameter type must be `interface ITestContext` or an interface that extends it. The provider codeunit must implement `ITestDataSource`.

The runtime passes the attribute's dataset identifier and a [DataSourceContext](methods-auto/datasourcecontext/datasourcecontext-data-type.md) value to `ITestDataSource.GetDataRows`. The method returns a `List of [interface ITestContext]`, where each item defines one test case. [DataSourceContext.CodeunitId](methods-auto/datasourcecontext/datasourcecontext-codeunitid-method.md) identifies the provider codeunit, and [DataSourceContext.AppId](methods-auto/datasourcecontext/datasourcecontext-appid-method.md) identifies the app that defines the test method.

Each context implementation supplies `ITestContext.Identifier`. The identifier names the case in test results and in `TestHandlerContext.TestCaseName`. It must be deterministic and remain stable between runs.

The following example defines a context, returns two cases from a provider, and consumes the context in a data-driven test.

```al
interface "Late Fee Test Context" extends ITestContext
{
    procedure Balance(): Decimal;
}

codeunit 50110 "Late Fee Test Case" implements "Late Fee Test Context"
{
    var
        BalanceValue: Decimal;
        CaseIdentifier: Text;

    procedure Initialize(NewIdentifier: Text; NewBalance: Decimal)
    begin
        CaseIdentifier := NewIdentifier;
        BalanceValue := NewBalance;
    end;

    procedure Identifier(): Text
    begin
        exit(CaseIdentifier);
    end;

    procedure Balance(): Decimal
    begin
        exit(BalanceValue);
    end;
}

codeunit 50111 "Late Fee Data Source" implements ITestDataSource
{
    procedure GetDataRows(DataSetIdentifier: Text; Context: DataSourceContext): List of [interface ITestContext]
    var
        FirstCase: Codeunit "Late Fee Test Case";
        SecondCase: Codeunit "Late Fee Test Case";
        TestCase: interface ITestContext;
        TestCases: List of [interface ITestContext];
    begin
        if DataSetIdentifier <> 'late-fees' then
            exit(TestCases);

        FirstCase.Initialize('zero-balance', 0);
        TestCase := FirstCase;
        TestCases.Add(TestCase);

        SecondCase.Initialize('positive-balance', 100);
        TestCase := SecondCase;
        TestCases.Add(TestCase);

        exit(TestCases);
    end;
}

codeunit 50112 "Late Fee Tests"
{
    Subtype = Test;

    [TestDataSource(Codeunit::"Late Fee Data Source", 'late-fees')]
    procedure BalanceIsNonnegative(Context: interface "Late Fee Test Context")
    begin
        if Context.Balance() < 0 then
            Error('The balance for test case %1 must not be negative.', Context.Identifier());
    end;
}
```
With runtime version 16, you can use the [RequiredTestIsolation property](properties/devenv-requiredtestisolation-property.md) on test codeunits, in addition to the [TestIsolation property](properties/devenv-testisolation-property.md), to specify the required test isolation level for the test codeunit. You can also use the [TestType property](properties/devenv-testtype-property.md) to categorize tests.

## Related information

[Testing the application](devenv-testing-application.md)  
[Create handler methods](devenv-creating-handler-methods.md)  
[Interfaces in AL](devenv-interfaces-in-al.md)
