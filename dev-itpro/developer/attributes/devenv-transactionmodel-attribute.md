---
title: "TransactionModel Attribute"
description: "Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# TransactionModel Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method.


## Applies To

- Method

> [!NOTE]
> The **TransactionModel** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```
[TransactionModel(TransactionModel: TransactionModel)]
```

### Arguments
*TransactionModel*  
&emsp;Type: [TransactionModel](../methods-auto/transactionmodel/transactionmodel-option.md)  
The test transaction model used in the test method.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

To create meaningful tests, you must first understand how transactions run. In a typical user scenario, a user who is logged on to a client enters data into one field of a page. Then the user enters some data in another field on the page. The user also checks the value of a third field. Finally, the user saves and closes the page. Every time a user enters data into a field, AL code may be triggered and a new transaction is automatically started. The trigger code runs within this new transaction. Field data is sent to the server where it is processed and often updated in the database. When the AL code in the trigger is finished, the transaction is automatically committed to the database and the page is refreshed with updated data.  

When you create test methods that exercise pages that interact with the database, you have the following options for simulating user scenarios and then returning the database to its initial, well-known state:  

- Set the **TransactionModel** property on the test method to **AutoRollback**. This assumes that the code that you test does not include calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md). Any calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md) give you an error. Most business logic does not call the [COMMIT Method](../methods-auto/database/database-commit-method.md), but relies on implicit commits at the end of the outermost AL trigger. The test proceeds as follows:  

    1. The test method starts a transaction.  

    2. The test method initializes data in the database. Database changes are made in the transaction that was started by the test method.  

    3. Fields on the test page are set or updated. Database changes are made in the transaction that was started by the test method.  

    4. The test method reads the values of fields on the test page or reads from the database to validate the test.  

    5. After the test method is completed, the transaction is rolled back and the database is returned to its initial state.  

- If the code that you test includes calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md), then set the **TransactionModel** property on the test method to **AutoCommit**. The test proceeds as follows:  

    1. The test method starts a transaction.  

    2. The test method initializes data in the database. Database changes are made in the transaction that was started by the test method.  

    3. Fields on the test page are set or updated. Database changes are made in the transaction that was started by the test method.  

    4. When the COMMIT method is called, changes are committed to the database.  

    5. The test method reads the values of fields on the test page or reads from the database to validate the test.  

    6. After the test method is completed, changes are committed to the database. To return the database to its initial state, either you must manually revert the changes by deleting, updating, or inserting records, or you must use the [TestIsolation Property](devenv-testisolation-property.md) on the test runner codeunit to roll back changes.  

- Set the **TransactionModel** property on the test method to **None** to simulate the behavior of an actual user. The test method does not start a transaction and cannot write to the database. However, a new transaction is started every time that a field on the page is updated and AL code is triggered. At the end of each trigger, changes are automatically committed to the database. You can use this option if your test does not write to the database and you do not have to initialize data in the database before the test starts. For example, use this option for tests that validate calculation formulas or tests that read from the database. The test proceeds as follows:  

    1. If a field on the test page is set or updated and AL code is triggered, then the test page starts a transaction. At the end of the trigger, changes are committed to the database.  

    2. The test method validates the test.  

    3. After the test is completed, no transactions are rolled back. To return the database to its initial state, either you must manually revert the changes by deleting, updating, or inserting records, or you must use the [TestIsolation Property](devenv-testisolation-property.md) on the test runner codeunit to roll back changes.  

With **AutoCommit** and **AutoRollback**, the test method starts a write transaction. Triggers that are invoked by the test code inherit this open transaction instead of running in their own separate transactions. By using the **AutoCommit** and **AutoRollback** settings, if several page interactions are invoked from test code, then they share the same transaction. By using the **None** setting, each page interaction runs in a separate transaction.  

## See Also  

[Properties](devenv-properties.md)   
[TestIsolation Property](devenv-testisolation-property.md)   