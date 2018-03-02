---
title: "FIND Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 07f5e141-a6f9-4ddd-b5c0-154268cf89f2
caps.latest.revision: 18
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FIND Method (Record)
Finds a record in a table that is based on the values stored in keys.  
  
## Syntax  
  
```  
  
Ok := Record.FIND([Which])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 On input, *Record* identifies the record that you want to find. On output, the following possibilities exist:  
  
-   If the record was found, then the record is returned in the *Record* parameter and any [FlowFields](../devenv-flowfields.md) in the record are set to zero. You must update the FlowFields using the [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md).  
  
-   If the record was not found and if you omitted the return value, a run-time error occurs.  
  
 *Which*  
 Type: Text or code  
  
 Specifies how to perform the search. The table is searched until either a record  is found or there are no more records. Each character in this string can be present only one time. You can combine the '=', '\<', and '>' characters. You can use the following characters:  
  
-   =  to search for a record that equals the key values \(default\)  
  
-   >  to search for a record that is larger than the key values  
  
-   \<  to search for a record that is less than the key values  
  
-   +  to search for the last record in the table \(+ can only be used alone\)  
  
-   -   to search for the first record in the table \(- can only be used alone\)  
  
 If this parameter contains '=', '>' or '\<', then you must assign value to all fields of the current and primary keys before you call FIND.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be found, a run-time error occurs. If you include a return value, you must handle any errors.  
  
## Remarks  
 FIND retrieves the first record that meets the conditions set by *Which* and the filters associated with *Record*. The search path reflects the sort order defined by the current key. If the current key is not the primary key, several records might have the same values in current key fields. If this occurs, the sort order defined by the primary key as the search path is used.  
  
## Example  
 The following example shows how use the **FIND** method to find a record in a table. The code sets the number of the record to find to 1100, which is the primary key of the record to find. The **FIND** method uses the '=' parameter to find the record that has a primary value that equals the specified primary key. If the record is found, then the item number, description, and unit price of the item are displayed in a message box. Otherwise, a message that specifies that the item is not found is displayed. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|ItemRec|Record|Item|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Item No. %1.\\Description:  %2.  Price:  $%3.|  
|Text001|The item was not found.|  
  
```  
ItemRec."No." := '1100';  
IF ItemRec.FIND('=') THEN  
  MESSAGE(TEXT000,  ItemRec."No.", ItemRec.Description, ItemRec."Unit Price")  
ELSE  
  MESSAGE(TEXT001);  
```  
  
## Example  
 The following example defines a record variable that is named ItemRec. The **FIND** method uses the ‘+’ parameter to find the last record in the table. If the record is found, then the item number, description, and unit price of the item are displayed in a message box. Otherwise, the message that specifies that the item was not found is displayed. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|ItemRec|Record|Item|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Item No. %1.\\Description:  %2.  Price:  $%3.|  
|Text001|The item was not found.|  
  
```  
IF ItemRec.FIND('+') THEN  
  MESSAGE(Text000, ItemRec."No.", ItemRec.Description, ItemRec."Unit Price")  
ELSE  
  MESSAGE(Text001);  
```  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)   
 [GET, FIND, and NEXT Methods](../devenv-get-find-and-next-methods.md)