---
title: "GET, FIND, and NEXT Methods"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 800587f2-90cc-4492-8fd8-a94bc91d1fe1
caps.latest.revision: 15
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GET, FIND, and NEXT Methods
The following methods are used to search for records:  
  
-   GET  
  
-   FIND  
  
-   NEXT  
  
 These methods are some of the most frequently used AL methods. When you search for records, you must know the difference between GET and FIND and to know how to use FIND and NEXT in conjunction.  
  
## GET Method  
 The [GET Method \(Record\)](devenv-GET-Method-Record.md) retrieves one record based on values of the primary key fields.  
  
 GET has the following syntax.  
  
```  
[Ok :=] Record.GET([Value],...)  
```  
  
 For example, if the **No.** field is the primary key of the **Customer** table and if you have created a record variable called **CustomerRec** that has a subtype of Customer, then you can use GET in the following way.  
  
```  
CustomerRec.GET('4711');  
```  
  
 The result is that the record of customer 4711 is retrieved.  
  
 GET produces a run-time error if it fails and the return value is not checked by the code. In the previous example, the actual code that you write should resemble the following.  
  
```  
IF CustomerRec.GET('4711') THEN  
.... // Do some processing.  
ELSE  
.... // Do some error processing.  
```  
  
 GET searches for the records, regardless of the current filters, and it does not change any filters. GET always searches through all the records in a table.  
  
## FIND Method  
 The [FIND Method \(Record\)](devenv-FIND-Method-Record.md) locates a record in a table that is based on the values stored in the keys.  
  
 FIND has the following syntax.  
  
```  
Ok := Record.FIND([Which])  
```  
  
 The *Which* parameter specifies how to perform the search. You can search for values that are greater than, less than, or equal to the key value, or for the first or last record in a table.  
  
 The important differences between GET and FIND are as follows:  
  
-   FIND uses the current filters.  
  
-   FIND can look for records where the key value is equal to, greater than, or smaller than the search string.  
  
-   FIND can find the first or the last record, depending on the sort order defined by the current key.  
  
 When you are developing applications in a relational database, there are often one-to-many relationships defined between tables. An example could be the relationship between an **Item** table, which registers items, and a **Sales Line** table, which registers the detailed lines from sales orders. One record in the **Sales Line** table can only be related to one item, but each item can be related to any number of sales line records. You would not want an item record to be deleted as long as there are still open sales orders that include the item. You can use FIND to check for open sales orders.  
  
 The OnDelete trigger of the **Item** table includes the following code that illustrates using FIND.  
  
```  
SalesOrderLine.SETCURRENTKEY(Type,"No.");  
SalesOrderLine.SETRANGE(Type,SalesOrderLine.Type::Item);  
SalesOrderLine.SETRANGE("No.","No.");  
IF SalesOrderLine.FIND('-') THEN  
ERROR(Text001,TABLECAPTION,"No.",SalesOrderLine."Document Type");  
```  
  
 If you want to find the first record in a table or set, then use the [FINDFIRST Method \(Record\)](devenv-FINDFIRST-Method-Record.md). If you want to find the last record in a table or set, then use the [FINDLAST Method \(Record\)](devenv-FINDLAST-Method-Record.md).  
  
## NEXT Method  
 The [NEXT Method \(Record\)](devenv-NEXT-Method-Record.md) is often used with FIND to step through the records of a table.  
  
 NEXT has the following syntax.  
  
```  
Steps := Record.NEXT([Steps])  
```  
  
 In the following example, FIND is used to go to the first record of the table. NEXT is used to step through every record, until there are no more. When there are no more records, NEXT returns 0 \(zero\).  
  
```  
IF (Rec.FINDSET) THEN  
REPEAT  
  // process record  
UNTIL (Rec.NEXT = 0);  
```