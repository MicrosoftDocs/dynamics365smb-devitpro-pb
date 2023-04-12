---
title: "C/AL WITH Statements"
description: "Desription of the C/AL WITH statements."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e224ae1d-8147-419a-9b34-037729c75a2d
caps.latest.revision: 11
---
# C/AL WITH Statements
The following syntax shows a WITH-DO statement.  

```  
WITH <Record> DO  
  <Statement>  
```  

 When you work with records, addressing is created as record name, dot \(period\), and field name:  

 <*Record*>.<*Field*>  

 If you work continuously with the same record, then you can use WITH statements. When you use a WITH statement, you can only specify the record name one time.  

 Within the scope of <*Statement*>, fields in *Record*> can be addressed without having to specify the record name.  

 You can nest several WITH statements. If you have identical names, then the inner WITH statement overrules the outer WITH statement.  

## Example  
 This example shows two ways to write the same code that creates a record variable that you can commit later.  

 Create the following variable.  

|Variable|Data type|Subtype|  
|--------|---------|-------|  
|CustomerRec|Record|Customer|  

```  
CustomerRec."No." := '1234';  
CustomerRec.Name := 'Windy City Solutions';  
CustomerRec."Phone No." := '555-444-333';  
CustomerRec.Address := '1241 Druid Avenue';  
CustomerRec.City := 'Windy City';  
MESSAGE('A variable has been created for this customer.');  
```  

 The following example shows another way to create a record variable that you can commit later  

```  
WITH CustomerRec DO BEGIN  
  "No." := '1234';  
  Name := 'Windy City Solutions';  
  "Phone No." := '555-444-333';  
  Address := '1241 Druid Avenue';  
  City := 'Windy City';  
  MESSAGE('A variable has been created for this customer.');  
END;  
```  

## Programming Conventions  
 Within WITH-DO blocks, do not repeat the name of the object by using the member variable or function.  

 If you nest a WITH-DO block within another explicit or implicit WITH-DO block, then the WITH-DO block that you create within another WITH-DO block must always be attached to a variable of the same type as the variable that is attached to the surrounding WITH-DO block. Otherwise, it can be difficult to see what variable that a member variable or function refers to. For example, implicit WITH-DO blocks occur in table objects and in pages that have been attached to a record.  

### Example  
 The following example demonstrates nested WITH-DO blocks. Both WITH-DO blocks are attached to a Customer Ledger Entry record variable.  

```  
WITH CustLedgEntry DO BEGIN  
  INSERT;  
  ...;  
  WITH CustLedgEntry2 DO BEGIN  
    INSERT;  
    ...;  
  END;  
END;  
```  

### Incorrect Example  
 The following example demonstrates incorrect code in which you cannot directly tell which record variable that the MyField field refers to.  

```  
WITH CustLedgEntry DO BEGIN  
  ...;  
  WITH VendLedgEntry DO BEGIN  
    MyField := <Some Value>;  
    ...;  
  END;  
END;  
```  

## See Also  
 [C/AL Compound Statements](C-AL-Compound-Statements.md)   
 [C/AL Conditional Statements](C-AL-Conditional-Statements.md)   
 [C/AL Repetitive Statements](C-AL-Repetitive-Statements.md)
