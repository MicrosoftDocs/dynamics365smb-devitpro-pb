---
title: "MARK Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 6047c38f-de7e-4e4d-842c-528d63f36e64
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MARK Method (Record)
Marks a record. You can also use this method to determine whether a record is marked.  
  
## Syntax  
  
```  
  
[IsMarked :=] Record.MARK([SetMarked])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The input record.  
  
 *SetMarked*  
 Type: Boolean  
  
 If this parameter is **true**, the method will mark the record. \(Previously marked records remain marked.\)  
  
 If this parameter is **false**, the method will remove any mark.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record is marked; otherwise, **false**.  
  
 The mark is effective until the application stops running.  
  
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
 [MARKEDONLY Method \(Record\)](devenv-MARKEDONLY-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)