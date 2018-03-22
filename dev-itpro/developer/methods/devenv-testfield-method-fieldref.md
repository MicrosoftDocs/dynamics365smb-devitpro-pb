---
title: "TESTFIELD Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c9f012be-9066-45ba-b01b-d1bf61c75b97
caps.latest.revision: 13
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TESTFIELD Method (FieldRef)
Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.  
  
## Syntax  
  
```  
  
FieldRef.TESTFIELD([Value])  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
 *Value*  
 Type: any  
  
 The value that you want to compare with the contents of the field referred to by  
  
 FieldRef. The data type of *Value* must match the type of the field.  
  
 If you include *Value* and the contents of the field do not match, an error message is displayed.  
  
 If you omit *Value* and the content of the field is zero or blank \(empty string\), an error message is displayed.  
  
## Remarks  
 This method is like the [TESTFIELD Method \(Record\)](devenv-TESTFIELD-Method-Record.md) method.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref, created a reference to the first field \(No\) and stores the reference in the MyFieldRef variable. The [VALUE Method \(FieldRef, TestPage Field\)](devenv-VALUE-Method-FieldRef-TestPage-Field.md) sets the No. field to a blank text. The TESTFIELD method determines whether the contents of the field match 10000, the specified value. In this case, the content does not match so the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] throws an exception. If the there is a match, no exception is thrown. This example requires that you create the following global variabless.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.VALUE := '';  
MyFieldRef.TESTFIELD('10000');  
```  
  
 In this example, the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] displays following error message:  
  
 No. must be equal to 10000 in Customer: No.=. Current value is ‘’.  
  
## Example  
 If the value of the No. field is set to a value other than 10000, [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] displays the following error message:  
  
 No. must be equal to 10000 in Customer: No.=AAA10000. Current value is ‘AAA10000’.  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.VALUE := 'AAA 10000';  
MyFieldRef.TESTFIELD('10000');  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)