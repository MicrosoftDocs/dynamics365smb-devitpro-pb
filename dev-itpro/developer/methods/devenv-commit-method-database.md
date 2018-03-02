---
title: "COMMIT Method (Database)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ea46e230-f8e7-4aeb-952f-ea02d30ea092
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COMMIT Method (Database)
Ends the current write transaction.  

## Syntax  

```  

COMMIT  
```  

## Remarks  
 When a codeunit begins, it automatically enables write transactions to be performed. When an AL code module completes, it automatically ends the write transaction by committing the updates made by the AL code.  

 This means that if you want the codeunit to perform a single write transaction, it is automatically handled for you. However, if you want the codeunit to perform multiple write transactions, you must use the COMMIT method to end one write transaction before you can start the next. The COMMIT method separates write transactions in an AL code module.  

## Example  
 The following pseudo-code example contains two write transactions. When it begins, a write transaction is automatically started. Using the COMMIT method, you end the first write transaction and prepare for the second. When the code completes, the second write transaction automatically ends.  

```  
BeginWriteTransactions  
(AL Statements) // Transaction 1  
COMMIT  
(AL Statements) // Transaction 2  
EndWriteTransactions   
```  

## See Also  
 [Database Methods](devenv-database-methods.md)
