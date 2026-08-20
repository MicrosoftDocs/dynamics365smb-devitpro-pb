---
title: "TransactionModel attribute"
description: "Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# TransactionModel attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method.


## Applies to

- Method

> [!NOTE]
> The **TransactionModel** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```AL
[TransactionModel(TransactionModel: TransactionModel)]
```

### Arguments
*TransactionModel*  
&emsp;Type: [TransactionModel](../methods-auto/transactionmodel/transactionmodel-option.md)  
The test transaction model used in the test method.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To create meaningful tests, you must first understand how transactions run. In a typical client session, a page interaction can invoke AL code in a server transaction. When the interaction finishes successfully, the transaction is committed and the page is refreshed with updated data.

When you create test methods that exercise pages that interact with the database, you have the following options for simulating user scenarios and then returning the database to its initial, well-known state:  

- Set the `TransactionModel` attribute on the test method to `AutoRollback`. This setting assumes that the code under test doesn't call the [`Commit` method](../methods-auto/database/database-commit-method.md). A call to `Commit` causes an error. Most business logic relies on implicit commits at the end of the outermost AL trigger. The test proceeds as follows:

    1. The test method starts a transaction.  

    2. The test method initializes data in the database. Database changes are made in the transaction that was started by the test method.  

    3. Fields on the test page are set or updated. Database changes are made in the transaction that was started by the test method.  

    4. The test method reads the values of fields on the test page or reads from the database to validate the test.  

    5. After the test method is completed, the transaction is rolled back and the database is returned to its initial state.  

- If the code under test calls the [`Commit` method](../methods-auto/database/database-commit-method.md), set the `TransactionModel` attribute on the test method to `AutoCommit`. The test proceeds as follows:

    1. The test method starts a transaction.  

    2. The test method initializes data in the database. Database changes are made in the transaction that was started by the test method.  

    3. Fields on the test page are set or updated. Database changes are made in the transaction that was started by the test method.  

    4. When the `Commit` method is called, changes are committed to the database.

    5. The test method reads the values of fields on the test page or reads from the database to validate the test.  

    6. After the test method is completed, changes are committed to the database. To return the database to its initial state, either you must manually revert the changes by deleting, updating, or inserting records, or you must use the [TestIsolation Property](../properties/devenv-testisolation-property.md) on the test runner codeunit to roll back changes.  

- Set the `TransactionModel` attribute on the test method to `None` to simulate the behavior of an actual user. The test method doesn't start a transaction and can't write to the database. However, a new transaction starts each time that a field on the page is updated and AL code is triggered. At the end of each trigger, changes are automatically committed to the database. Use this option if your test doesn't write to the database and you don't have to initialize data before the test starts. For example, use it for tests that validate calculation formulas or read from the database. The test proceeds as follows:

    1. If a field on the test page is set or updated and AL code is triggered, then the test page starts a transaction. At the end of the trigger, changes are committed to the database.  

    2. The test method validates the test.  

    3. After the test is completed, no transactions are rolled back. To return the database to its initial state, either you must manually revert the changes by deleting, updating, or inserting records, or you must use the [TestIsolation Property](../properties/devenv-testisolation-property.md) on the test runner codeunit to roll back changes.  

With `AutoCommit` and `AutoRollback`, the test method starts a write transaction. Triggers invoked by the test code inherit this open transaction instead of running in separate transactions. If test code invokes several page interactions, they share the same transaction. With `None`, each page interaction runs in a separate transaction.

## Related information

[Properties](../properties/devenv-properties.md)   
[TestIsolation Property](../properties/devenv-testisolation-property.md)
