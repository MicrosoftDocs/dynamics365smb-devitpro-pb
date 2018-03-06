---
title: "ISTEMPORARY Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7191542f-8764-4429-aabd-2118e181377c
caps.latest.revision: 9
---
# ISTEMPORARY Function (RecordRef)
Determines whether a RecordRef refers to a temporary table.  
  
## Syntax  
  
```  
  
Temp := RecordRef.ISTEMPORARY  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef of a record that refers to a table.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the RecordRef refers to a temporary table; otherwise, **false**.  
  
## Remarks  
 In versions of [!INCLUDE[navnow](includes/navnow_md.md)] earlier than [!INCLUDE[nav7long](includes/nav7long_md.md)], if a RecordID or a RecordRef referred to a temporary table, then the table number value of the RecordID or RecordRef was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine if a RecordID or a RecordRef referred to a temporary table. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the table number value of a RecordID or a RecordRef always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the [TABLENO Function \(RecordID\)](TABLENO-Function--RecordID-.md) or the [NUMBER Function \(RecordRef\)](NUMBER-Function--RecordRef-.md) to test for the sequence number and determine if the RecordID or RecordRef was temporary, then you must use the ISTEMPORARY function in [!INCLUDE[navnow](includes/navnow_md.md)] instead.  
  
## Example  
 This example shows that you can replace code that you used previously to determine if a RecordRef referred to a temporary table. This example requires that you create a RecordRef variable named RecordRefVar.  
  
```  
// Previous code  
IF RecordRefVar.Number >= 2000100000 THEN BEGIN  
  // Code for temporary tables  
END;  
  
// New code  
IF RecordRefVar.IsTemporary THEN BEGIN  
  // Code for temporary tables  
END;  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)