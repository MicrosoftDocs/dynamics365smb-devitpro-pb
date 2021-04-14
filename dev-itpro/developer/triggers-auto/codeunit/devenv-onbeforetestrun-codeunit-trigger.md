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
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
