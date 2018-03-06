---
title: "ISTEMPORARY Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 7191542f-8764-4429-aabd-2118e181377c
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISTEMPORARY Method (RecordRef)
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
 In versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] earlier than [!INCLUDE[nav7long](../includes/nav7long_md.md)], if a RecordID or a RecordRef referred to a temporary table, then the table number value of the RecordID or RecordRef was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine if a RecordID or a RecordRef referred to a temporary table. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], the table number value of a RecordID or a RecordRef always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the [TABLENO Method \(RecordID\)](devenv-TABLENO-Method-RecordID.md) or the [NUMBER Method \(RecordRef\)](devenv-NUMBER-Method-RecordRef.md) to test for the sequence number and determine if the RecordID or RecordRef was temporary, then you must use the ISTEMPORARY method in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] instead.  
  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)