---
title: "Test Attribute"
description: "Specifies that the method is a test method."
ms.author: solsen
ms.custom: na
ms.date: 06/22/2021
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

# Test Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a test method.


## Applies To

- Method

> [!NOTE]
> The **Test** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax


> **Version**: _Available or changed with runtime version 1.0._
```
[Test]
procedure Test()
```
> [!IMPORTANT]
> The above signature requires the Test method to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You use test methods that include AL code that tests the business logic in the application, where each method covers a transaction. 

For more information, see [Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md).

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)