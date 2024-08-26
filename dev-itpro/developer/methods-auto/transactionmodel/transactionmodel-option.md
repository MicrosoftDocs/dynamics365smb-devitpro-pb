---
title: "TransactionModel system option"
description: "Represents a test transaction model."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TransactionModel Option Type
> **Version**: _Available or changed with runtime version 1.0._

Represents a test transaction model.

## Members
|  Member  |  Description  |
|----------------|---------------|
|AutoCommit|The transaction automatically commits after the Test method has run.|
|AutoRollback|The transaction is automatically rolled back after the Test method has run.|
|None|No write-transaction is open in the test-method code, and writes will fail. The transaction model mirrors the model used by the "real" client. Every call from the TestPage to the "server" has its own transaction.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  