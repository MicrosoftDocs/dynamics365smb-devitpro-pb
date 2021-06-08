---
title: "TestPermissions Attribute"
description: "Specifies a value that can be used to determine which permission sets are used on tests that are run by a test method."
ms.author: solsen
ms.custom: na
ms.date: 06/08/2021
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

# TestPermissions Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by a test method.


## Applies To

- Method

> [!NOTE]
> The TestPermissions attribute can only be set inside codeunits with the **SubType property** set to Test.


## Syntax
```
[TestPermissions(TestPermissions: TestPermissions)]
```

### Parameters

*TestPermissions*  
&emsp;Type: [TestPermissions](../methods-auto/testpermissions/testpermissions-option.md)  
Specifies the permission sets used on tests that are run by the test method.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  