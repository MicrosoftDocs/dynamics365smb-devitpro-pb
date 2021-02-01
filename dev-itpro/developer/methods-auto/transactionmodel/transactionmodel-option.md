---
title: "TransactionModel System Option"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# TransactionModel Option Type
> **Version**: _Available from runtime version 1.0._

Represents a test transaction model.

## Members
|  Member  |  Description  |
|----------------|---------------|
|AutoCommit|The transaction automatically commits after the Test method has run.|
|AutoRollback|The transaction is automatically rolled back after the Test method has run.|
|None|No write-transaction is open in the test-method code, and writes will fail. The transaction model mirrors the model used by the "real" client. Every call from the TestPage to the "server" has its own transaction.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  