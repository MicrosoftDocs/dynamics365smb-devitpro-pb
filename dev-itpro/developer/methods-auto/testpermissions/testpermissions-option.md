---
title: "TestPermissions System Option"
description: "Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# TestPermissions Option Type
> **Version**: _Available or changed with runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions.

## Members
|  Member  |  Description  |
|----------------|---------------|
|InheritFromTestCodeunit|Is only relevant for test methods; not test codeunits. It specifies that a test method uses the TestPermissions property setting of the test codeunit to which it belongs. If you use this value on a test codunit, the property will resolve to Restrictive at runtime.|
|Restrictive|Does not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.|
|NonRestrictive|Does not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.|
|Disabled|Does not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  