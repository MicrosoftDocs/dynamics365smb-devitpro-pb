---
title: "COPYLINKS Method (Record)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8597befc-1d60-41d9-8afc-a24c9ae3bf59
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COPYLINKS Method (Record)
Copies all the links from a specified record.  
  
## Syntax  
  
```  
  
DestRecord.COPYLINKS(FromRecord)  
```  
  
#### Parameters  
 *DestRecord*  
 Type: Record  
  
 Specifies the record you want to copy the links to.  
  
 *FromRecord*  
 Type: Record or RecordRef  
  
 Specifies the record from which you want to copy links.  
  
## Remarks  
 Use this method to copy all the links from a specified record and paste the links to the current record.  
  
 The link can be a link to a website, a file stored on the local or on a remote computer, or a link to a page.  
  
## Example  
 The following example copies all the links from a record named SourceRecord to the record named DestRecord. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SourceRecord|Record|Customer|  
|DestRecord|Record|Customer|  
  
```  
  
DestRecord.COPYLINKS(SourceRecord);  
```  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)