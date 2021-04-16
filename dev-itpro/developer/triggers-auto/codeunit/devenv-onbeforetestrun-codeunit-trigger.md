---
title: "OnBeforeTestRun (Codeunit) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/14/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnBeforeTestRun (Codeunit) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a test of a test codeunit is run.

> [!IMPORTANT]
> The [Subtype Property](../../properties/devenv-subtype-property.md) must be set to **TestRunner** in the Codeunit.


## Syntax
```
trigger OnBeforeTestRun(CodeunitId: Integer, CodeunitName: Text, FunctionName: Text, Permissions: TestPermissions): Ok
begin
    ...
end;
```

### Parameters

*CodeunitId*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the codeunit to be run.  

*CodeunitName*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
The name of the test codeunit to be run.  

*FunctionName*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Specifies the name of the test to be run.  

*Permissions*  
&emsp;Type: [TestPermissions](../../methods-auto/testpermissions/testpermissions-option.md)  
Specifies the permission set level to use on the test run. The value is retrieved from the TestPermissions property of the test codeunit or test that is run. The parameter accepts the following values:
- Disabled
- Restrictive
- NonRestrictive
- InheritFromTestCodunit - Specifies that a test the uses the TestPermissions property setting of the test codeunit to which it belongs.  


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)
**true** if the test was run, otherwise, **false**. The default value is **true**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!NOTE]  
> This trigger is optional and not available on a test runner codeunit by default. To implement this trigger, you must manually add it.  

A test runner codeunit manages the execution of test codeunits that are run from its [OnRun trigger](devenv-onrun-codeunit-trigger.md). When a test codeunit runs, it executes each test  in the codeunit, one at a time. The **OnBeforeTestRun** trigger is called before the test codeunit, the **OnRun** , and each test .  

You can use the **OnBeforeTestRun** triggers to perform preprocessing, such as general initialization and logging, or to automate tests by integrating the test runner codeunit with a test management framework.  
  
By using the *Permissions* parameter, you can add code to control which permission sets, if any, to test.
  
The *FunctionName* parameter is empty when the **OnBeforeTestRun** trigger is called for the entire test codeunit.  

The **OnBeforeTestRun** trigger is run in its own database transaction.  

 <!-- For more information, see [Testing the Application](../devenv-testing-the-application.md) and [How to: Create a Test Runner Codeunit](../devenv-how-to-create-a-test-runner-codeunit.md).  -->

## Example  

The following **OnBeforeTestRun** trigger code initializes a logging variable and returns **true** to indicate that the test should execute. 

```AL
trigger OnBeforeTestRun(CodeunitId: Integer, CodeunitName: Text, FunctionName: Text, Permissions: TestPermissions): Boolean
var
    Before : DateTime;
begin
    Before := CURRENTDATETIME;  
    Exit(true);  
end;
```  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnAfterTestRun Trigger](devenv-onaftertestrun-codeunit-trigger.md)  
[TestPermissions Property](../properties/devenv-testpermissions-property.md)  
