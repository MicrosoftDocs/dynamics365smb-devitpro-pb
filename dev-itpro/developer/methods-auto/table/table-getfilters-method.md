---
title: "GetFilters Method"
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
# GetFilters Method
Gets a string that contains a list of the filters within the current filter group for all fields in a record. In addition, this function also returns the state of the MARKEDONLY function (Record).

## Syntax
```
String :=   Table.GetFilters()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)