---
title: "Database.CurrentTransactionType Method"
ms.author: solsen
ms.custom: na
ms.date: 12/03/2020
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
# Database.CurrentTransactionType Method
> **Version**: _Available from runtime version 1.0._

Gets the current transaction type and sets a new type to be assigned.


## Syntax
```
[TransactionType := ]  Database.CurrentTransactionType([TransactionType: TransactionType])
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*TransactionType*  
&emsp;Type: [TransactionType](../TransactionType/TransactionType-option.md)  
The type of transaction to be set for the next transaction.  


## Return Value
*TransactionType*
&emsp;Type: [TransactionType](../TransactionType/TransactionType-option.md)
The type of transaction for the next transaction.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method sets the transaction type for the next transaction that starts when you are using Microsoft SQL Server. The transaction type determines the extent of locking that is performed on data in SQL Server tables and indexes. It also determines whether modifications to data can occur within the transaction. The following basic transaction types are available:  
  
- Browse  
- Snapshot  
- UpdateNoLocks  
- Update  
- Report  
  
The Report transaction type maps to one of the other basic transaction types. For more information about the behavior of the transaction types, see [TransactionType Property](../../properties/devenv-TransactionType-property.md).  
  
Using CurrentTransactionType to set a transaction type from within a currently active transaction does not affect the transaction type. You must set the transaction type before a transaction starts, which occurs at the first database call in a trigger or in a codeunit. If you set the current transaction type to a less isolated transaction behavior, for example, if you try to change an Update transaction to a Browse transaction, the method call is ignored. If you try to change the current transaction type to a more isolated transaction behavior, for example, from Browse to Update, you will receive an error message.  
  
## Example 1

In Example 1, CurrentTransactionType is used to set the required behavior of the next transaction in the database.  
  
```  
//Example 1  
CurrentTransactionType := TransactionType::UpdateNoLocks;  
```  
  
## Example 2

 In Example 2, CurrentTransactionType is used to return the transaction type setting for the current transaction.  
  
```  
//Example 2  
if CurrentTransactionType = TransactionType::UpdateNoLocks then...  
```  
  
## Example 3

Examples 3 and 4 show how to use the CurrentTransactionType method to set the transaction type for two separate transactions.  
  
When you set the transaction type as in Example 3, you will get an update \(or write\) transaction using Serializable behavior, which means that modifications are allowed within this transaction. SQL Server will guarantee the serializability of the transaction by placing the appropriate locks when you read from the table in the database.  
  
```  
//Example 3  
CurrentTransactionType := TransactionType::Update;  
```  
  
## Example 4

Examples 3 and 4 show how to use the CurrentTransactionType method to set the transaction type for two separate transactions.  
  
When you set the transaction type as in Example 4, you will get a read-only, non-locking transaction. This means that no modifications are allowed within this transaction and that SQL Server does not add any locks. It is also possible to read any uncommitted data.  
  
```  
//Example 4  
CurrentTransactionType := TransactionType::Browse;  
```  
  
## Example 5

In Example 5, the initial transaction type is UpdateNoLocks. This is usually the default transaction type for a trigger. When you try to change the transaction type from UpdateNoLocks to Browse, which is a less isolated transaction type, the method call is ignored. The current transaction type remains UpdateNoLocks. After the first Table.Get line, again, when you try to change the transaction type from UpdateNoLocks to Browse, the method call is ignored. The current transaction type remains UpdateNoLocks. Next, when you try to change the transaction type from UpdateNoLocks to Update, which is a more isolated transaction type, the method call causes an error message to be generated. The current transaction type remains UpdateNoLocks. After the [Commit Method](../../methods-auto/database/database-commit-method.md), you can set a new transaction type and change it again if it is required. After the second Table.Get line, the CurrentTransactionType method call is ignored. The transaction type remains Update.  
  
```  
//Example 5  
OnInsert  
CurrentTransactionType := TransactionType::Browse;  
Table.Get;  
CurrentTransactionType := TransactionType::Browse;  
CurrentTransactionType := TransactionType::Update;  
Commit;  
CurrentTransactionType := TransactionType::Browse;  
CurrentTransactionType := TransactionType::Update;  
Table.Get;  
CurrentTransactionType := TransactionType::Browse;  
OnInsert.RETURN  
Commit;  
```  
  
## Example 6

In Example 6, the initial transaction type is UpdateNoLocks. The first two times that you try to change to a less isolated transaction type, the method call is ignored. Finally, when you try to change to a more isolated transaction type, the method call causes an error message to be generated.  
  
```  
//Example 6  
CodeUnit  
CurrentTransactionType := TransactionType::Snapshot;  
Report 1  
CurrentTransactionType := TransactionType::Browse;  
Report 2  
CurrentTransactionType := TransactionType::Update;  
```  

## See Also

[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)