---
title: "ReadState Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ReadState Property
Specifies which records are read and how they are locked when a query is executed.

## Applies to
-   Query

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|ReadUncommitted|TODO:Add documentation|
|ReadShared|TODO:Add documentation|
|ReadExclusive|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

Committed data is data that is saved to the database when a transaction is completed.  
  
The ReadState property will overrule the current transaction type of the data as set by a [CURRENTTRANSACTIONTYPE Method (Database)](../methods-auto/database/database-currenttransactiontype-method.md) call in the AL code because queries ignore the CURRENTTRANSACTIONTYPE method call.   
  
Each query will use the specified ReadState regardless of other queries that have already been executed. This means that you can read uncommitted data and committed data from the same tables in the same transaction. However, the strictest lock placed on a row will remain until the transaction is committed.

## See Also

[Properties](devenv-properties.md)  