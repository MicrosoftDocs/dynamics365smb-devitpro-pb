---
title: "COMMIT Function (Database)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ea46e230-f8e7-4aeb-952f-ea02d30ea092
caps.latest.revision: 7
manager: edupont
---
# COMMIT Function (Database)
Ends the current write transaction.  
  
## Syntax  
  
```  
  
COMMIT  
```  
  
## Remarks  
 When a C/AL codeunit begins, it automatically enables write transactions to be performed. When a C/AL code module completes, it automatically ends the write transaction by committing the updates made by the C/AL code.  
  
 This means that if you want the C/AL codeunit to perform a single write transaction, it is automatically handled for you. However, if you want the C/AL codeunit to perform multiple write transactions, you must use the COMMIT function to end one write transaction before you can start the next. The COMMIT function separates write transactions in a C/AL code module.  
  
## Example  
 The following pseudo-code example contains two write transactions. When it begins, a write transaction is automatically started. Using the COMMIT function, you end the first write transaction and prepare for the second. When the code completes, the second write transaction automatically ends.  
  
```  
BeginWriteTransactions  
(C/AL Statements) // Transaction 1  
COMMIT  
(C/AL Statements) // Transaction 2  
EndWriteTransactions   
```  
  
## See Also  
 [Database](Database.md)