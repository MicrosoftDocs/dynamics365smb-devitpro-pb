---
title: "MARKEDONLY Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 71047bed-4992-46f4-9f6c-07f512cad222
caps.latest.revision: 12
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MARKEDONLY Method (Record)
Activates a special filter. After you use this method, your view of the table includes only records marked by this method.  
  
## Syntax  
  
```  
  
[IsMarkedOnly :=] Record.MARKEDONLY([SetMarkedOnly])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 A record from the table that you want mark.  
  
 *SetMarkedOnly*  
 Type: Boolean  
  
 Changes the state of the special filter. This parameter is optional.  
  
 If this parameter if **true**, only marked records are included. If this parameter is **false**, all records are included.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the special filter is being used; otherwise, **false**.  
  
## Example  
 This example shows how to use MARK and MARKEDONLY. Assume that at first no records are marked.  
  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|No1|Integer|Not applicable|  
|No2|Integer|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Number of records before MARKEDONLY: %1.\\|  
|Text001|Number of records after MARKEDONLY: %2.|  
  
```  
CustomerRec.SETCURRENTKEY("No.");  
CustomerRec."No." := '10000';  
CustomerRec.FIND('=');  
CustomerRec.MARK(TRUE); // Mark a record.  
  
No1 := CustomerRec.COUNT;  
CustomerRec.MARKEDONLY(TRUE);  
No2 := CustomerRec.COUNT;  
MESSAGE(Text000 + Text001, No1, No2);  
```  
  
 The following messages could be displayed:  
  
 **Number of records before MARKEDONLY: 68.**  
  
 **Number of records after MARKEDONLY: 1.**  
  
## See Also  
 [MARK Method \(Record\)](devenv-MARK-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)