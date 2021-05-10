---
title: "OnAfterTestRun (Codeunit) Trigger"
description: "Runs after a test of a test codeunit has been run."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnAfterTestRun (Codeunit) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a test of a test codeunit has been run.

> [!IMPORTANT]
> The [Subtype Property](../../properties/devenv-subtype-property.md) must be set to **TestRunner** in the Codeunit.

## Syntax
```
trigger OnAfterTestRun(CodeunitId: Integer, CodeunitName: Text, FunctionName: Text, Permissions: TestPermissions, Success: Boolean)
begin
    ...
end;
```

### Parameters

*CodeunitId*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the codeunit that has run.  

*CodeunitName*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Specifies the name of the test codeunit that has run.  

*FunctionName*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Specifies the name of the test that has run.  

*Permissions*  
&emsp;Type: [TestPermissions](../../methods-auto/testpermissions/testpermissions-option.md)  
Specifies the permission set level to use on the test run. The value is retrieved from the TestPermissions property of the test codeunit or test that is run. The parameter accepts the following values:
- Disabled
- Restrictive
- NonRestrictive
- InheritFromTestCodunit - Specifies that a test the uses the TestPermissions property setting of the test codeunit to which it belongs.  

*Success*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
True indicates that the test run succeeded; otherwise, false indicates that the test run failed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!NOTE]  
> This trigger is optional and not available on a test runner codeunit by default. To implement this trigger, you must manually add it.  

A test runner codeunit manages the execution of test codeunits that are run from its [OnRun trigger](devenv-onrun-codeunit-trigger.md). When a test codeunit runs, it executes each test one at a time in the codeunit. When implemented, the **OnAfterTestRun** trigger is called after each test  has run and after all of the test codeunits have run.

The **OnAfterTestRun** trigger suppresses the automatic display of the results message after the test codeunit runs.

> [!NOTE]  
> To return the error message for a failed test run, use the [GetLastErrorText Method](../../methods-auto/debugger/debugger-getlasterrortext-method.md).  


You can use the **OnAfterTestRun** trigger to perform post-processing, such as logging, or to automate tests by integrating the test runner codeunit with a test management framework.

The *Permissions* parameter, enables you can control how to handle applied permission sets, if any, after the test is run.   
<!-- For more information about testing with permision sets, including an example, see [Testing With Permission Sets](../testing-permissionsets.md).
-->

The *FunctionName* parameter is empty when the **OnAfterTestRun** trigger is called for the whole test codeunit.  

The **OnAfterTestRun** trigger is run in its own database transaction.


## Example

The following **OnAfterTestRun** trigger code logs test results to a test reporting system. This example requires that you create a record variable named *log*.  

```AL
log.Init;  
log.UnitId := CodeunitId;  
log.Unit := CodeunitName;  
log.Func := MethodName;  
log.Before := Before;  
log.After := CURRENTDATETIME;  
if Success then  
  log.Status := log.Status::Success  
else begin  
  log.Status := log.Status::Failure;  
  if MethodName <> '' then  
    log.Message := GETLASTERRORTEXT;  
end;  
log.Insert(true);  
```  

The GetLastErrorText returns the text that was contained in the last error message.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[SubType Property (Codeunit)](../../properties/devenv-subtype-codeunit-property.md)  
[OnBeforeTestRun Trigger](devenv-onbeforetestrun-codeunit-trigger.md)  
