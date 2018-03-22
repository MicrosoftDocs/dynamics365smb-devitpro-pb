---
title: "HASLINKS Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 21df7251-85fd-4244-81ef-dda4bc7744db
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# HASLINKS Method (RecordRef)
Determines whether a record contains any links.  
  
## Syntax  
  
```  
  
OK := HASLINKS  
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record contains at least one link; otherwise, **false**.  
  
## Remarks  
 The link can be a link to a Web site, a file stored on the local computer or on a remote computer, or a link to a [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] page.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef variable for field 1 \(No.\) and stores the value in the MyFieldRef variable. The [VALUE Method \(FieldRef, TestPage Field\)](devenv-VALUE-Method-FieldRef-TestPage-Field.md) selects record number 20000. The HASLINKS method determines whether the selected record has any links. The method returns **No** because there are no links in the record. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varHasLinks|Boolean|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Does this record have one or more links? %1.|  
  
```  
  
CustomerRecref.OPEN(18);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.VALUE := '20000';  
varHasLinks := CustomerRecref.HASLINKS;  
MESSAGE(Text000, varHasLinks);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)