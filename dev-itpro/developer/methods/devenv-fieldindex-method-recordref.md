---
title: "FIELDINDEX Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8e42682c-f78a-4b67-8d27-d4fcf0bfee7b
caps.latest.revision: 12
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FIELDINDEX Method (RecordRef)
Gets the FieldRef of the field that has the specified index in the table that is referred to by the *RecordRef*.  

## Syntax  

```  

Field := RecordRef.FIELDINDEX(Index)  
```  

#### Parameters  
 *RecordRef*  
 Type: RecordRef  

 *Index*  
 Type: Integer  

## Property Value/Return Value  
 Type: FieldRef  

 The FieldRef of the field that has the specified index.  

## Remarks  
 The fields in the primary key are always listed first in the index. Therefore, the order of the fields in the index is not necessarily the same as the order of the fields in the table.  

 If the index is out of the range supplied or if no table is selected, then the method returns an error.  

## Example  
 This example requires that you create the following global variables and text constants.  

|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|SalesInvHdr|RecordRef|Not applicable|  
|FldRef|FieldRef|Not applicable|  
|Str|Text|1024|  

|Text constant name|Constant value|  
|------------------------|--------------------|  
|Text001|Index 1: %1\\|  
|Text002|Index 2: %2\\|  
|Text003|Index 3: %2|  

```  

SalesInvHdr.OPEN(112);  
FldRef1 := SalesInvHdr.FIELDINDEX(1);  
FldRef2 := SalesInvHdr.FIELDINDEX(2);  
FldRef3 := SalesInvHdr.FIELDINDEX(3);  
MESSAGE(Text001 + Text002 + Text003, FldRef1.CAPTION, FldRef2.CAPTION, FldRef3.CAPTION);  
```  

 The message window displays the following:  

-   **Index 1: No.**  

-   **Index 2: Sell-to Customer No.**  

-   **Index 3: Bill-to Customer No.**  

 The following illustration shows the first fields in table 112, Sales Invoice Header, and shows the keys for table 112. The order of the fields in the index differs from the order of the fields in the table. The index lists the field in the primary key first.  

 ![Table 112 designer and keys](../media/DesignTable112.png "DesignTable112")  

## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)
