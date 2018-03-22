---
title: "HASFILTER Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1c8ce5d9-0ebc-4305-958e-26ee1de66925
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# HASFILTER Method (Record)
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
 The following example uses the **HASFILTER** method to determine whether the **Customer** table that contains the MyRecord record has a filter. The method returns **No** because the MyRecord record has no filters. The return value is displayed in a message box. The [SETFILTER Method \(Record\)](devenv-SETFILTER-Method-Record.md) is then used to set a filter for the table. This time, the return value is **Yes** because the table now has a filter. This example requires that you create the following global variables.  
  
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
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)