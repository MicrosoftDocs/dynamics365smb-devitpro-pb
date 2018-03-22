---
title: "SETTABLE Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 291b58b6-54f2-425a-a40a-64b43f5d786a
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETTABLE Method (RecordRef)
Sets the table to which a Record variable refers as the same table as a RecordRef variable.  

## Syntax  

```  

RecordRefVar.SETTABLE(RecordVar)  
```  

#### Parameters  
 *RecordRefVar*  
 Type: RecordRef  

 The RecordRef for the table you want to the *RecordVar* to refer to.  

 *RecordVar*  
 Type: Record  

 The Record for which you want to specify a table.  

## Remarks  
 Any filters that are applied to the RecordRef are also applied to the Record. If you change the filter that is applied to the RecordRef, you must call SETTABLE again to apply the new filter to the Record.  

## Example  
 This example shows that if you have a RecordID data type, you can get a RecordRef for the table that the RecordID refers to. Then you can use the RecordRef to set the table to which a Record variable refers.  

 This example requires that you create the following global or local variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|InvtEventBuf|Record|Inventory Event Buffer|  
|RecID|RecordID|Not applicable|  
|RecRef|RecordRef|Not applicable|  
|ProdOrderComp|Record|Prod. Order Component|  

```  
InvtEventBuf.FIND('-');  
RecID := InvtEventBuf."Source Line ID";  
RecRef := RecID.GETRECORD;  
RecRef.SETTABLE(ProdOrderComp);  
```  

## See Also  
 [GETTABLE Method \(RecordRef\)](devenv-GETTABLE-Method-RecordRef.md)   
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)
