---
title: "IsolationLevel System Option"
description: "The isolation level applied for this record."
ms.author: solsen
ms.custom: na
ms.date: 02/07/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IsolationLevel Option Type
> **Version**: _Available or changed with runtime version 1.0._

The isolation level applied for this record.

## Members
|  Member  |  Description  |
|----------------|---------------|
|Default|Follows the table's isolation level for reads, same behavior as not choosing an IsolationLevel.|
|ReadUncommitted|Allows the record to read uncommitted changes from other transactions.|
|ReadCommitted|Only allows for reads committed data, but does not guarantee that rows read will stay consistent throughout the entirety of the transaction.|
|RepeatableRead|Guarantees that rows read will stay consistent during the entirety of the current transaction. Does not allow reading of uncommitted data.|
|UpdLock|Ensures that the rows read will stay consistent in the entirety of the current transaction, while also blocking readers with the same isolation level. Does not allow reading of uncommitted data.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  