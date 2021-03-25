---
title: "Only use AssertError in Test Codeunits"
ms.author: solsen
ms.custom: na
ms.date: 03/08/2021
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
# AppSourceCop Rule AS0058
Only use AssertError in Test Codeunits

## Description
Only use AssertError in Test Codeunits.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

AssertError must be used only in test codeunits, because it creates its own transaction scope. 
This can lead to unexpected behaviors when used in production code.

For more information about the usage of AssertError, see:
- [AssertError statements](../devenv-al-simple-statements.md#asserterror-statements)
- [Testing the Application Overview](../devenv-testing-application.md)
- [TransactionModel Property](../properties/devenv-properties.md)

### How to fix this diagnostic?

Error handling in production code must be done using Try Methods.

For more information, see:
- [TryFunction attribute](../methods/devenv-tryfunction-attribute.md)
- [Handling Errors by Using Try Methods](../devenv-handling-errors-using-try-methods.md)

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[CodeCop AA0161](codecop-aa0161-onlyuseasserterrorintestcodeunits.md)