---
title: "Database.Commit Method"
description: "The Database Commit Method in AL for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.Commit Method
> **Version**: _Available from runtime version 1.0._

Ends the current write transaction.


## Syntax
```
 Database.Commit()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When a codeunit begins, it automatically enables write transactions to be performed. When an AL code module completes, it automatically ends the write transaction by committing the updates made by the AL code.  

This means that if you want the codeunit to perform a single write transaction, it is automatically handled for you. However, if you want the codeunit to perform multiple write transactions, you must use the Commit method to end one write transaction before you can start the next. The COMMIT method separates write transactions in an AL code module.  

## Example

The following pseudo-code example contains two write transactions. When it begins, a write transaction is automatically started. Using the Commit method, you end the first write transaction and prepare for the second. When the code completes, the second write transaction automatically ends.  

```  
BeginWriteTransactions  
(AL Statements) // Transaction 1  
COMMIT  
(AL Statements) // Transaction 2  
EndWriteTransactions   
```  

## See Also

[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)