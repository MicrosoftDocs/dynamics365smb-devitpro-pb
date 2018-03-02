---
title: "HASFILTER Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1c8ce5d9-0ebc-4305-958e-26ee1de66925
caps.latest.revision: 11
---
# HASFILTER Function (Record)
Determines whether a filter is attached to a record within the current filter group.  
  
## Syntax  
  
```  
  
Ok := Record.HASFILTER  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record within the current filter group to check for a filter.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if there is a filter; otherwise, **false**.  
  
## Example  
 The following example uses the **HASFILTER** function to determine whether the **Customer** table that contains the MyRecord record has a filter. The function returns **No** because the MyRecord record has no filters. The return value is displayed in a message box. The [SETFILTER Function \(Record\)](SETFILTER-Function--Record-.md) is then used to set a filter for the table. This time, the return value is **Yes** because the table now has a filter. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|HasFilter|Boolean|Not applicable|  
  
```  
HasFilter := MyRecord.HASFILTER;  
MESSAGE('Does this record have a filter? %1', HasFilter);  
MyRecord.SETFILTER("No.", '100..200');  
HasFilter := MyRecord.HASFILTER;  
MESSAGE('Does this record have a filter? %1', HasFilter);  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)