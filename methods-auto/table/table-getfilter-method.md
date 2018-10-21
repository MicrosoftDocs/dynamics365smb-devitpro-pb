---
title: "GetFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# GetFilter Method
Gets a list of the filters within the current filter group that are applied to a field.

## Syntax
```
String :=   Table.GetFilter(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The input field.
          


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)