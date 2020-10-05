---
title: "TransactionModel Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1eb38214-45a5-4ffe-82d1-c7507af277ee
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---

 

# TransactionModel Property
Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method.  

## Applies to  
 AL test methods on test codeunits. A test codeunit is a codeunit that has the [SubType Property \(Codeunit\)](devenv-subtype-codeunit-property.md) set to **Test**.  

 The TransactionModel property applies to both test methods that use TestPages and test methods that do not use TestPages.  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|AutoCommit|A commit is issued at the end of the test method. If an error occurs during the test method, then the transaction is rolled back. If an error occurs and you catch it with an **ASSERTERROR** statement, then the transaction is rolled back. If the code that is being tested calls the [COMMIT Method](../methods-auto/database/database-commit-method.md) before an error occurs, then the transaction is rolled back only to the point at which the [COMMIT Method](../methods-auto/database/database-commit-method.md) was called.<br /><br /> **AutoCommit** is the default value.|  
|AutoRollback|The transaction is rolled back after test execution. Calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md) during a test that is set to **AutoRollback** fail with an error.|  
|None|Used primarily with TestPages. The test method does not have an open write transaction; therefore, it cannot write to the database. Each interaction with the database occurs through TestPage triggers, which open their own write transactions. At the end of each trigger, if no errors occurred, then any changes are committed to the database. If an error occurred, then changes are rolled back at the end of the transaction.|  

## Syntax
```
[TransactionModel(TransactionModel::AutoRollback)]
```

## Remarks  
 To create meaningful tests, you must first understand how transactions run. In a typical user scenario, a user who is logged on to a client enters data into one field of a page. Then the user enters some data in another field on the page. The user also checks the value of a third field. Finally, the user saves and closes the page. Every time a user enters data into a field, AL code may be triggered and a new transaction is automatically started. The trigger code runs within this new transaction. Field data is sent to the server where it is processed and often updated in the database. When the AL code in the trigger is finished, the transaction is automatically committed to the database and the page is refreshed with updated data.  

 When you create test methods that exercise pages that interact with the database, you have the following options for simulating user scenarios and then returning the database to its initial, well-known state:  

-   Set the **TransactionModel** property on the test method to **AutoRollback**. This assumes that the code that you test does not include calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md). Any calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md) give you an error. Most business logic does not call the [COMMIT Method](../methods-auto/database/database-commit-method.md), but relies on implicit commits at the end of the outermost AL trigger. The test proceeds as follows:  

    1.  The test method starts a transaction.  

    2.  The test method initializes data in the database. Database changes are made in the transaction that was started by the test method.  

    3.  Fields on the test page are set or updated. Database changes are made in the transaction that was started by the test method.  

    4.  The test method reads the values of fields on the test page or reads from the database to validate the test.  

    5.  After the test method is completed, the transaction is rolled back and the database is returned to its initial state.  

-   If the code that you test includes calls to the [COMMIT Method](../methods-auto/database/database-commit-method.md), then set the **TransactionModel** property on the test method to **AutoCommit**. The test proceeds as follows:  

    1.  The test method starts a transaction.  

    2.  The test method initializes data in the database. Database changes are made in the transaction that was started by the test method.  

    3.  Fields on the test page are set or updated. Database changes are made in the transaction that was started by the test method.  

    4.  When the COMMIT method is called, changes are committed to the database.  

    5.  The test method reads the values of fields on the test page or reads from the database to validate the test.  

    6.  After the test method is completed, changes are committed to the database. To return the database to its initial state, either you must manually revert the changes by deleting, updating, or inserting records, or you must use the [TestIsolation Property](devenv-testisolation-property.md) on the test runner codeunit to roll back changes.  

-   Set the **TransactionModel** property on the test method to **None** to simulate the behavior of an actual user. The test method does not start a transaction and cannot write to the database. However, a new transaction is started every time that a field on the page is updated and AL code is triggered. At the end of each trigger, changes are automatically committed to the database. You can use this option if your test does not write to the database and you do not have to initialize data in the database before the test starts. For example, use this option for tests that validate calculation formulas or tests that read from the database. The test proceeds as follows:  

    1.  If a field on the test page is set or updated and AL code is triggered, then the test page starts a transaction. At the end of the trigger, changes are committed to the database.  

    2.  The test method validates the test.  

    3.  After the test is completed, no transactions are rolled back. To return the database to its initial state, either you must manually revert the changes by deleting, updating, or inserting records, or you must use the [TestIsolation Property](devenv-testisolation-property.md) on the test runner codeunit to roll back changes.  

 With **AutoCommit** and **AutoRollback**, the test method starts a write transaction. Triggers that are invoked by the test code inherit this open transaction instead of running in their own separate transactions. By using the **AutoCommit** and **AutoRollback** settings, if several page interactions are invoked from test code, then they share the same transaction. By using the **None** setting, each page interaction runs in a separate transaction.  

## See Also  
 [Properties](devenv-properties.md)   
 [TestIsolation Property](devenv-testisolation-property.md)   
 <!-- [Testing the Application](Testing-the-Application.md)   
 [Testing Pages](Testing-Pages.md)   
 [How to: Create Test Codeunits and Test Methods](How-to--Create-Test-Codeunits-and-Test-Methods.md)   
 [AL ASSERTERROR Statements](AL-ASSERTERROR-Statements.md) -->
