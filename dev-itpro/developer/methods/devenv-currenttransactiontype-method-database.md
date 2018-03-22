---
title: "CURRENTTRANSACTIONTYPE Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 40835671-b653-4865-8bcc-75090a4fd535
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTTRANSACTIONTYPE Method (Database)
Gets the current transaction type and sets a new type to be assigned.  
  
## Syntax  
  
```  
  
[TransactionType :=] CURRENTTRANSACTIONTYPE([TransactionType])  
```  
  
## Property Value/Return Value  
 Type: TransactionType  
  
 The type of transaction to be set or retrieved for the next transaction.  
  
## Remarks  
 This method sets the transaction type for the next transaction that starts when you are using Microsoft SQL Server. The transaction type determines the extent of locking that is performed on data in SQL Server tables and indexes. It also determines whether modifications to data can occur within the transaction. The following basic transaction types are available:  
  
-   Browse  
  
-   Snapshot  
  
-   UpdateNoLocks  
  
-   Update  
  
-   Report  
  
 The Report transaction type maps to one of the other basic transaction types. For more information about the behavior of the transaction types, see [TransactionType Property](../properties/devenv-TransactionType-Property.md).  
  
 Using CURRENTTRANSACTIONTYPE to set a transaction type from within a currently active transaction does not affect the transaction type. You must set the transaction type before a transaction starts, which occurs at the first database call in a trigger or in a codeunit. If you set the current transaction type to a less isolated transaction behavior, for example, if you try to change an Update transaction to a Browse transaction, the method call is ignored. If you try to change the current transaction type to a more isolated transaction behavior, for example, from Browse to Update, you will receive an error message.  
  
## Example  
 In Example 1, CURRENTTRANSACTIONTYPE is used to set the required behavior of the next transaction in the database.  
  
```  
//Example 1  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::UpdateNoLocks;  
```  
  
## Example  
 In Example 2, CURRENTTRANSACTIONTYPE is used to return the transaction type setting for the current transaction.  
  
```  
//Example 2  
IF CURRENTTRANSACTIONTYPE = TRANSACTIONTYPE::UpdateNoLocks THEN...  
```  
  
## Example  
 Examples 3 and 4 show how to use the CURRENTTRANSACTIONTYPE method to set the transaction type for two separate transactions.  
  
 When you set the transaction type as in Example 3, you will get an update \(or write\) transaction using SERIALIZABLE behavior, which means that modifications are allowed within this transaction. SQL Server will guarantee the serializability of the transaction by placing the appropriate locks when you read from the table in the database.  
  
```  
//Example 3  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Update;  
```  
  
## Example  
 Examples 3 and 4 show how to use the CURRENTTRANSACTIONTYPE method to set the transaction type for two separate transactions.  
  
 When you set the transaction type as in Example 4, you will get a read-only, non-locking transaction. This means that no modifications are allowed within this transaction and that SQL Server does not add any locks. It is also possible to read any uncommitted data.  
  
```  
//Example 4  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Browse;  
```  
  
## Example  
 In Example 5, the initial transaction type is UpdateNoLocks. This is usually the default transaction type for a trigger. When you try to change the transaction type from UpdateNoLocks to Browse, which is a less isolated transaction type, the method call is ignored. The current transaction type remains UpdateNoLocks. After the first Table.GET line, again, when you try to change the transaction type from UpdateNoLocks to Browse, the method call is ignored. The current transaction type remains UpdateNoLocks. Next, when you try to change the transaction type from UpdateNoLocks to Update, which is a more isolated transaction type, the method call causes an error message to be generated. The current transaction type remains UpdateNoLocks. After the COMMIT, you can set a new transaction type and change it again if it is required. After the second Table.GET line, the CURRENTTRANSACTIONTYPE call is ignored. The transaction type remains Update.  
  
```  
//Example 5  
OnInsert  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Browse;  
Table.GET;  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Browse;  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Update;  
COMMIT;  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Browse;  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Update;  
Table.GET;  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Browse;  
OnInsert.RETURN  
COMMIT;  
```  
  
## Example  
 In Example 6, the initial transaction type is UpdateNoLocks. The first two times that you try to change to a less isolated transaction type, the method call is ignored. Finally, when you try to change to a more isolated transaction type, the method call causes an error message to be generated.  
  
```  
//Example 6  
CODEUNIT  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Snapshot;  
Report 1  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Browse;  
Report 2  
CURRENTTRANSACTIONTYPE := TRANSACTIONTYPE::Update;  
```  
  
## See Also  
 [Database Methods](devenv-database-methods.md)