---
title: "Test attribute"
description: "Specifies that the method is a test method."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Test attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a test method.


## Applies to

- Method

> [!NOTE]
> The **Test** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax


> **Version**: _Available or changed with runtime version 1.0._
```AL
[Test]
procedure Test()
```
> [!IMPORTANT]
> The above signature requires the Test method to be *global*. Learn more in [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Use test methods to test specific units of application business logic. The transaction behavior of a test method depends on its [`TransactionModel`](devenv-transactionmodel-attribute.md) setting.

Learn more in [Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md).

## Related information

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)  
[TransactionModel Attribute](devenv-transactionmodel-attribute.md)
