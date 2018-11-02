---
title: "Mark Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# Mark Method
Marks a record. You can also use this function to determine whether a record is marked.

## Syntax
```
[Marked := ]  Table.Mark([Mark: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Mark*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Marks a record. You can also use this function to determine whether a record is marked.  


## Return Value
*Marked*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example shows how to use the MARK method. Assume that at first no records are marked.  
  
 This example requires that you create the following global text constant.  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Customer.No.: %1, Marked?: %2|  
  
 This example also requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Customer|Record|Customer|  
|Marked|Boolean|Not applicable|  
  
```  
Customer.SETCURRENTKEY("No.");  
Customer."No." := 'NEW 3500';  
Customer.FIND('=');  
Customer.MARK(TRUE); // Mark a record.  
Customer.FIND('-'); // Find first record.  
REPEAT // Go through records  
Marked := Customer.MARK; // Test if marked.  
MESSAGE(Text000, Customer."No.", Marked);  
UNTIL Customer.NEXT = 0;  
```  
  
 The message windows could show the following:  
  
 **Customer No.: AAA 1050, Marked?: No**  
  
 **Customer No.: DEL 3500, Marked?: No**  
  
 **Customer No.: NEW 3500, Marked?: Yes**  
  
 **Customer No.: PEA 2500, Marked?: No**  
  
 **Customer No.: SOP 7500, Marked?: No**  
  
## Example  
 This example shows how to use the MARK method together with the MARKEDONLY method. Assume that at first no records are marked.  
  
 This example requires that you create the following text constants.  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text001|Number of records before MARKEDONLY: %1\\|  
|Text002|Number of records after MARKEDONLY: %2|  
  
 This example also requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Customer|Record|Customer|  
|No1|Integer|Not applicable|  
|No2|Integer|Not applicable|  
  
```  
SETCURRENTKEY(Customer."No.");  
Customer."No." := 'NEW 3500';  
FIND(Customer, '=');  
MARK(Customer, TRUE); //Mark a record.   
No1 := COUNT(Customer);  
MARKEDONLY(Customer, TRUE);  
No2 := COUNT(Customer);  
MESSAGE(Text001 + Text002, No1, No2);  
```  
  
 The message windows could show the following:  
  
 **Number of records before MARKEDONLY: 5**  
  
 **Number of records after MARKEDONLY: 1**  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)