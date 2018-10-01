---
title: "MarkedOnly Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# MarkedOnly Method
Activates a special filter. After you use this function, your view of the table includes only records marked by this function.

## Syntax
```
[MarkedOnly := ]  Table.MarkedOnly([MarkedOnly: Boolean])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*MarkedOnly*  
&emsp;Type: [Boolean](boolean-data-type.md)  
Activates a special filter. After you use this function, your view of the table includes only records marked by this function.  


## Return Value
*MarkedOnly*  
&emsp;Type: [Boolean](boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example shows how to use MARK and MARKEDONLY. Assume that at first no records are marked.  
  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|No1|Integer|Not applicable|  
|No2|Integer|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Number of records before MARKEDONLY: %1.\\|  
|Text001|Number of records after MARKEDONLY: %2.|  
  
```  
CustomerRec.SETCURRENTKEY("No.");  
CustomerRec."No." := '10000';  
CustomerRec.FIND('=');  
CustomerRec.MARK(TRUE); // Mark a record.  
  
No1 := CustomerRec.COUNT;  
CustomerRec.MARKEDONLY(TRUE);  
No2 := CustomerRec.COUNT;  
MESSAGE(Text000 + Text001, No1, No2);  
```  
  
 The following messages could be displayed:  
  
 **Number of records before MARKEDONLY: 68.**  
  
 **Number of records after MARKEDONLY: 1.**  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)