---
title: "TestPermissions system option"
description: "Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestPermissions Option Type
> **Version**: _Available or changed with runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by test codeunits or test functions.

## Members
|  Member  |  Description  |
|----------------|---------------|
|InheritFromTestCodeunit|Is only relevant for test methods; not test codeunits. It specifies that a test method uses the TestPermissions property setting of the test codeunit to which it belongs. If you use this value on a test codeunit, the property will resolve to Restrictive at runtime.|
|Restrictive|This is the default value. Setting the Restrictive value will cause the permission execution context of every test in the codeunit to be set by default to 'D365 Full Access’. It is required to lower the level of permissions within every test to any permission sets other than 'D365 Full Access’. Otherwise, it will result in a runtime error. The change of the permission execution context is supported by  Codeunit "Library - Lower Permissions".|
|NonRestrictive|Setting the NonRestrictive value will cause that the permission execution context of every test in the codeunit is set to 'D365 Full Access’. Opposite to Restrictive, setting the TestPermissions property to NonRestrictive does not require a change of permissions.|
|Disabled|Setting this value will exclude any change of the permission execution context and all tests will be executed using SUPER.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
