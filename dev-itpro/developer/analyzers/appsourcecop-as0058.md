---
title: "AppSourceCop Error AS0058"
description: "Only use AssertError in Test Codeunits."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0058
Only use AssertError in Test Codeunits

## Description
Only use AssertError in Test Codeunits.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

AssertError must be used only in test codeunits, because it creates its own transaction scope. This can lead to unexpected behaviors when used in production code.

For more information about the usage of AssertError, see:

- [AssertError statements](../devenv-al-simple-statements.md#asserterror-statements)
- [Testing the application overview](../devenv-testing-application.md)
- [TransactionModel property](../properties/devenv-properties.md)

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[CodeCop AA0161](codecop-aa0161.md)