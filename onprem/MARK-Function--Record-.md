---
title: "MARK Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6047c38f-de7e-4e4d-842c-528d63f36e64
caps.latest.revision: 11
manager: edupont
---
# MARK Function (Record)
Marks a record. You can also use this function to determine whether a record is marked.  
  
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
  
 If this parameter is **true**, the function will mark the record. \(Previously marked records remain marked.\)  
  
 If this parameter is **false**, the function will remove any mark.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record is marked; otherwise, **false**.  
  
 The mark is effective until the application stops running.  
  
## Example  
 This example shows how to use the MARK function. Assume that at first no records are marked.  
  
 This example requires that you create the following text constant in the **C/AL Globals** window.  
  
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
 This example shows how to use the MARK function together with the MARKEDONLY function. Assume that at first no records are marked.  
  
 This example requires that you create the following text constants in the **C/AL Globals** window.  
  
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
 [MARKEDONLY Function \(Record\)](MARKEDONLY-Function--Record-.md)   
 [Record Data Type](Record-Data-Type.md)