---
title: "C/AL Database Functions and Performance on SQL Server"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 59f99e81-9f9a-4d25-83c3-581f5c2bec26
caps.latest.revision: 25
manager: edupont
---
# C/AL Database Functions and Performance on SQL Server
This topic describes the relationship between basic database functions in C/AL and SQL statements.  
  
## C/AL and SQL Statements  
  
### GET, FIND, and NEXT  
 The C/AL language offers several methods to retrieve record data. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], records are retrieved using multiple active result sets (MARS). Generally, retrieving records with MARS is faster than with server-side cursors. Additionally, each function is optimized for a specific purpose. To achieve optimal performance you must use the method that is best suited for a given purpose.  
  
-   **Record.GET** is optimized for getting a single record based on primary key values.  
  
-   **Record.FIND** is optimized for getting a single record based on the primary keys in the record and any filter or range that has been set.  
  
-   **Record.FIND('-')** and **Record.FIND('+')** are optimized for reading primarily from a single table when the application might not read all records. FIND('-') is implemented by issuing a self-tuning TOP X call, where X can change over time, based on statistics of the number of rows read.  
  
     The following are examples of scenarios in which you should use the FIND('-') function to achieve optimal performance:  
  
    -   Before you post a general journal batch, you must check all journal lines for validity and verify that all lines balance. After the first line when an error is found, you do not have to retrieve the rest of the rows.  
  
    -   If you want to fulfill multiple outstanding orders from a recent purchase but you do not know how many orders are covered by the purchase.  
  
-   **Record.FINDSET(ForUpdate, UpdateKey)** is optimized for reading the complete set of records in the specified filter and range. The *UpdateKey* parameter does not influence the efficiency of this method in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], such as it did in [!INCLUDE[nav2009](includes/nav2009_md.md)].  
  
     FINDSET is not implemented by issuing a TOP X call.  
  
-   **Record.FINDFIRST** and **Record.FINDLAST** are optimized for finding the single first or last record in the specified filter and range.  
  
-   **Record.NEXT** can be called at any time. However, if **Record.NEXT** is not called as part of retrieving a continuous result set, then [!INCLUDE[navnow](includes/navnow_md.md)] calls a separate SQL statement in order to find the next record.  
  
### Dynamic Result Sets  
 Any result set that is returned from a call to the find methods discussed in the previous section is dynamic. That means that the result set is guaranteed to contain any changes that you make further ahead in the result set. However this feature comes at a cost. If any modifications are made to a table which is being traversed, then [!INCLUDE[navnow](includes/navnow_md.md)] might have to issue an extra SQL statement to guarantee that the result set is dynamic.  
  
 The following code shows how records are most efficiently retrieved. **FINDSET** is the most efficient method to use because this example reads all records.  
  
```  
IF FINDSET THEN  
  REPEAT  
    // Insert statements to repeat.  
  UNTIL NEXT = 0;  
```  
  
### CALCFIELDS, CALCSUMS, and COUNT  
 Each call to **CALCFIELDS**, **CALCFIELD**, **CALCSUMS**, or **CALCSUM** functions that calculates a sum requires a separate SQL statement unless the client has calculated the same sum or another sum that uses the same SumIndexFields or filters in a recent operation, and therefore, the result is cached.  
  
 Each **CALCFIELDS** or **CALCSUMS** request should be confined to use only one SIFT index. The SIFT index can only be used if:  
  
-   All requested sum-fields are contained in the same SIFT index.  
  
-   The filtered fields are part of the key fields specified in the SIFT index containing all the sum fields.  
  
 If neither of these requirements is fulfilled, then the sum will be calculated directly from the base table.  
  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], SIFT indexes can be used to count records in a filter provided that a SIFT index exists that contains all filtered fields in the key fields that are defined for the SIFT index.  
  
### SETAUTOCALCFIELDS  
 It is a common task to retrieve data and request calculation of associated FlowFields. The following example traverses customer records, calculates the balance, and marks the customer as blocked if the customer exceeds the maximum credit limit. Note the Customer record and associated fields are imaginary.  
  
```  
IF Customer.FINDSET() THEN REPEAT  
  Customer.CALCFIELDS(Customer.Balance)  
  IF (Customer.Balance > MaxCreditLimit) THEN BEGIN  
    Customer.Blocked = True;   
    Customer.MODIFY();  
  END  
  ELSE IF (Customer.Balance > LargeCredit) THEN BEGIN  
    Customer.Caution = True;  
    Customer.MODIFY();   
  END;   
UNTIL Customer.NEXT = 0;  
  
```  
  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can do this much faster. First, we set a filter on the customer. This could also be done in [!INCLUDE[navnow](includes/navnow_md.md)] 2009, but behind the scenes the same code as mentioned earlier would be executed. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], setting a filter on a record is translated into a single SQL statement.  
  
```  
Customer.SETFILTER(Customer.Balance,’>%1’, LargeCredit);   
IF Customer.FINDSET() THEN REPEAT  
  Customer.CALCFIELDS(Customer.Balance)  
  IF (Customer.Balance > MaxCreditLimit) THEN BEGIN   
    Customer.Blocked = True;   
    Customer.MODIFY();   
  END   
  ELSE IF (Customer.Balance > LargeCredit) THEN BEGIN   
    Customer.Caution = True;   
    Customer.MODIFY();   
  END;   
UNTIL Customer.NEXT = 0;   
```  
  
 In the previous example, an extra call to CALCFIELDS still must be issued for the code to be able to check the value of Customer.Balance. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can optimize this further by using the new **SETAUTOCALCFIELDS** function.  
  
```  
Customer.SETFILTER(Customer.Balance,’>%1’, LargeCredit);   
Customer.SETAUTOCALCFIELDS(Customer.Balance)   
IF Customer.FINDSET() THEN REPEAT   
  IF (Customer.Balance > MaxCreditLimit) THEN BEGIN   
    Customer.Blocked = True;   
    Customer.MODIFY();   
  END   
  ELSE IF (Customer.Balance > LargeCredit) THEN BEGIN   
    Customer.Caution = True;   
    Customer.MODIFY();   
  END;   
UNTIL Customer.NEXT = 0;  
  
```  
  
### INSERT, MODIFY, DELETE, and LOCKTABLE  
 Each call to **INSERT**, **MODIFY**, or **DELETE** functions requires a separate SQL statement. If the table that you modify contains SumIndexes, then the operations will be much slower. As a test, select a table that contains SumIndexes and execute one hundred **INSERT**, **MODIFY**, or **DELETE** operations to measure how long it takes to maintain the table and all its SumIndexes.  
  
 The **LOCKTABLE** function does not require any separate SQL statements. It only causes any subsequent reading from the table to lock the table or parts of it.  
  
## See Also  
 [Table Keys and Performance](Table-Keys-and-Performance.md)   
 [Bulk Inserts](Bulk-Inserts.md)   
 [GET Function \(Record\)](GET-Function--Record-.md)   
 [FIND Function \(Record\)](FIND-Function--Record-.md)   
 [NEXT Function \(Record\)](NEXT-Function--Record-.md)   
 [FINDSET Function \(Record\)](FINDSET-Function--Record-.md)   
 [FINDFIRST Function \(Record\)](FINDFIRST-Function--Record-.md)   
 [FINDLAST Function \(Record\)](FINDLAST-Function--Record-.md)   
 [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md)   
 [CALCFIELD Function \(FieldRef\)](CALCFIELD-Function--FieldRef-.md)   
 [CALCSUMS Function \(Record\)](CALCSUMS-Function--Record-.md)   
 [CALCSUM Function \(FieldRef\)](CALCSUM-Function--FieldRef-.md)   
 [SETAUTOCALCFIELDS Function \(Record\)](SETAUTOCALCFIELDS-Function--Record-.md)   
 [INSERT Function \(Record\)](INSERT-Function--Record-.md)   
 [MODIFY Function \(Record\)](MODIFY-Function--Record-.md)   
 [DELETE Function \(Record\)](DELETE-Function--Record-.md)   
 [LOCKTABLE Function \(Record\)](LOCKTABLE-Function--Record-.md)