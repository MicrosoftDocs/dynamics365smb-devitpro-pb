---
title: "SETTABLE Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 291b58b6-54f2-425a-a40a-64b43f5d786a
caps.latest.revision: 11
---
# SETTABLE Function (RecordRef)
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
  
 This example requires that you create the following variables in the **C/AL Globals** or **C/AL Locals** window.  
  
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
 [GETTABLE Function \(RecordRef\)](GETTABLE-Function--RecordRef-.md)   
 [RecordRef Data Type](RecordRef-Data-Type.md)