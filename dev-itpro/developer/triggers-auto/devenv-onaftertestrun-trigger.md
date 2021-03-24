---
title: "OnAfterTestRun Trigger"
ms.author: solsen
ms.custom: na
ms.date: 03/24/2021
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
# OnAfterTestRun Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a test of a test codeunit has been run.

## Syntax
```
trigger OnAfterTestRun(CodeunitId: Integer, CodeunitName: Text, FunctionName: Text, Permissions: TestPermissions, Success: Boolean)
begin
    ...
end;
```

### Parameters

*CodeunitId*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the codeunit that has run.  
*CodeunitName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the name of the test codeunit that has run.  
*FunctionName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the name of the test that has run.  
*Permissions*  
&emsp;Type: [TestPermissions](../methods-auto/testpermissions/testpermissions-data-type.md)  
Specifies the permission set level to use on the test run. The value is retrieved from the TestPermissions property of the test codeunit or test that is run. The parameter accepts the following values:
- Disabled
- Restrictive
- NonRestrictive
- InheritFromTestCodunit - Specifies that a test the uses the TestPermissions property setting of the test codeunit to which it belongs.  
*Success*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
True indicates that the test run succeeded; otherwise, false indicates that the test run failed.  


## Applies To
- Codeunit


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  