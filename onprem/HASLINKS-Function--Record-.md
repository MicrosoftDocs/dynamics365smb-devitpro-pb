---
title: "HASLINKS Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b787ab16-9988-40f9-b799-81e07f047bf6
caps.latest.revision: 10
manager: edupont
---
# HASLINKS Function (Record)
Determines whether a record contains any links.  
  
## Syntax  
  
```  
  
Ok := Record.HASLINKS  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record in the table for which you want to find the link.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record contains at least one link; otherwise, **false**.  
  
## Remarks  
 The link can be a link to a web site, a file stored on the local or on a remote computer, or a link to a Microsoft Dynamics NAV page.  
  
## Example  
 The following code example retrieves record number 10000 from the Vendor table and stores it in the MyRecord variable. The HASLINKS function determines whether the record contains one or more links. Record number 10000 contains one link so the varHasLink variable displays **Yes**. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
|varHasLinks|Boolean|Not applicable|  
  
```  
  
MyRecord.GET('10000');  
varHasLinks := MyRecord.HASLINKS;  
MESSAGE('Does this record have one or more links: %1', varHasLinks);  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)