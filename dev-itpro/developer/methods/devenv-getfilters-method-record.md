---
title: "GETFILTERS Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 6891d81b-9f79-441f-becb-fb71c740a3d8
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETFILTERS Method (Record)
Gets a string that contains a list of the filters within the current filter group for all fields in a record. In addition, this method also returns the state of the [MARKEDONLY Method \(Record\)](devenv-MARKEDONLY-Method-Record.md).  

## Syntax  

```  

String := Record.GETFILTERS  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The record from which you want a list of filters.  

## Property Value/Return Value  
 Type: Text or code  

 This string contains a list of the filters for all fields in *Record*.  

## Example  
 This example requires that you create the following global variables and text constant.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Str|Text|Not applicable|  
|CustLedgerEntry|Record|Cust. Ledger Entry|  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The filters are:\\|  

```  
CustLedgerEntry.SETRANGE(Amount, -100, 100);  
CustLedgerEntry.SETRANGE("Posting Date", 010108D, 123108D);  
Str := CustLedgerEntry.GETFILTERS;  
MESSAGE(Text000 + '%1', Str);  
```  

 On a computer with the regional format set to English \(United States\), the message window displays the following:  

 **The filters are:**  

 **Posting Date: 01/01/08..12/31/08, Amount: -100..100**  

## Example  
 This example requires that you create the following global variable.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Item|Record|Item|  

```  
Item.FILTERGROUP(2); // Filter group 2 is applied.  
Item.SETFILTER("No.", '1000..1450'); // A filter is set in filter group 2.  
MESSAGE('Filtergroup 2 filters: ' + Item.GETFILTERS);   
// GETFILTERS prints the filter that is set in filter group 2  

Item.FILTERGROUP(0); // Change the current filter group.   
// Now filter group 0 is applied.  
MESSAGE('Filtergroup 0 filter: ' + Item.GETFILTERS);   
// GETFILTERS returns an empty string because there is no filter set   
// in the current filter group (0).  
Item.SETFILTER("No.", '70000..79999'); // Set another filter, now in filter group 0.  
MESSAGE('Now Filtergroup 0 filters: ' + Item.GETFILTERS);   
// GETFILTERS prints the new filter set in the filter group 0.  
```  

 The message windows display the following:  

 **Filtergroup 2 filters: No.: 1000..1450**  

 **Filtergroup 0 filters:**  

 **Now Filtergroup 0 filters: No.: 70000..79999**  

## See Also  
 [GETFILTER Method \(Record\)](devenv-GETFILTER-Method-Record.md)   
 [SETFILTER Method \(Record\)](devenv-SETFILTER-Method-Record.md)   
 [SETRANGE Method \(Record\)](devenv-SETRANGE-Method-Record.md)   
 [FILTERGROUP Method \(Record\)](devenv-FILTERGROUP-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)
