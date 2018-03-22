---
title: "GETFILTER Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e98cdb71-ad05-4bfd-87a6-ebf35b06b55c
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETFILTER Method (Record)
Gets a list of the filters within the current filter group that are applied to a field.  
  
## Syntax  
  
```  
  
String := Record.GETFILTER(Field)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The input record.  
  
 *Field*  
 Type: Field  
  
 The input field.  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 This string contains a list of the filters applied to the field in the record.  
  
## Example  
 This example requires that you create the following global variables and text constant.  
  
|Variable name|Data type|Subtype|  
|-------------------|---------------|-------------|  
|String|Text|Not applicable|  
|CustomerEntry|Record|Cust. Ledger Entry|  
  
|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|The filter is:\\%1|  
  
```  
// Write the following code in the OnRun trigger.  
CustomerEntry.SETRANGE(Amount, -100, 100);  
String := CustomerEntry.GETFILTER(Amount);  
MESSAGE(Text000, String);  
```  
  
 The following message is displayed:  
  
 **The filter is:**  
  
 **-100..100**  
  
## Example  
 This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Item|Record|Item|  
  
```  
Item.FILTERGROUP(2); // Filter group 2 is applied.  
Item.SETFILTER("No.", '1000..1450'); // A filter is set in filter group 2.  
MESSAGE('Filtergroup 2 filters, No. field: ' + Item.GETFILTER("No."));   
// GETFILTERS prints the filter that is set in filter group 2  
  
Item.FILTERGROUP(0); // Change the current filter group.   
// Now filter group 0 is applied.  
MESSAGE('Filtergroup 0 filter, No. field: ' + Item.GETFILTER("No."));   
// GETFILTERS returns an empty string because there is no filter set   
// in the current filter group (0).  
Item.SETFILTER("No.", '70000..79999'); // Set another filter, now in filter group 0.  
MESSAGE('Now Filtergroup 0 filters, No. field: ' + Item.GETFILTER("No."));   
// GETFILTERS prints the new filter set in the filter group 0.  
```  
  
 The message windows display the following:  
  
 **Filtergroup 2 filters, No. field: 1000..1450**  
  
 **Filtergroup 0 filters, No. field:**  
  
 **Now Filtergroup 0 filters, No. field: 70000..79999**  
  
## See Also  
 [GETFILTERS Method \(Record\)](devenv-GETFILTERS-Method-Record.md)   
 [SETFILTER Method \(Record\)](devenv-SETFILTER-Method-Record.md)   
 [SETRANGE Method \(Record\)](devenv-SETRANGE-Method-Record.md)   
 [FILTERGROUP Method \(Record\)](devenv-FILTERGROUP-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)