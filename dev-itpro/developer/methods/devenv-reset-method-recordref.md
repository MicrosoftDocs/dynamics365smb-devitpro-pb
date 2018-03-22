---
title: "RESET Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c427028e-c262-4367-aeb8-363febf2e466
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RESET Method (RecordRef)
Removes all filters, including any special filters set by the [MARKEDONLY Method \(Record\)](devenv-MARKEDONLY-Method-Record.md) and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables on the record.  
  
## Syntax  
  
```  
  
RecordRef.RESET  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 Refers to the record that you want to reset.  
  
## Remarks  
 If no table is selected, this method returns an error.  
  
 This method works the same as the [RESET Method \(Record\)](devenv-RESET-Method-Record.md).  
  
## Example  
 The following example opens the Customer \(18\) table and creates a RecordRef variable that is named RecRef. The [GETFILTERS Method \(RecordRef\)](devenv-GETFILTERS-Method-RecordRef.md) gets filters that have been applied to records in the table. The filters that are returned, if any, are stored in the Filters1 variable and displayed in message box. In this example, no filters are set so the message is blank. The [SETRECFILTER Method \(RecordRef\)](devenv-SETRECFILTER-Method-RecordRef.md) sets a filter on the current key of the current record that is represented by the RecRef variable. The [GETFILTERS Method \(RecordRef\)](devenv-GETFILTERS-Method-RecordRef.md) gets the filters that have been set and stores the value in the Filters2 variable. The message displays No. because the No. field is set as a filter. The RESET method removes the filter that was set. The value of the filter that is returned by the [GETFILTERS Method \(RecordRef\)](devenv-GETFILTERS-Method-RecordRef.md) after the [RESET Method \(RECORDREF\)](devenv-RESET-Method-RecordRef.md) is executed is stored in the Filters3 variable. Filter3 is blank because the filter that was set by `RecRef.SETRECFILTER;` is removed by the RESET method. This example requires that create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|Filters1|Text|  
|Filters2|Text|  
|Filters3|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Filter before filter is set is: %1.|  
|Text001|Text|Filter after filter is set is: %1.|  
|Text002|Text|Filter after filter is reset is: %1.|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
Filters1 := RecRef.GETFILTERS;  
MESSAGE(Text000, Filters1);  
RecRef.SETRECFILTER;  
Filters2 := RecRef.GETFILTERS;  
MESSAGE(Text001, Filters2);  
RecRef.RESET;  
Filters3 := RecRef.GETFILTERS;  
MESSAGE(Text002, Filters3);  
  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)