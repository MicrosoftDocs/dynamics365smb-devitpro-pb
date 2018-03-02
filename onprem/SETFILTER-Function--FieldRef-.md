---
title: "SETFILTER Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bb385c41-5247-442b-8d22-48ce09b16ee8
caps.latest.revision: 18
---
# SETFILTER Function (FieldRef)
Assigns a filter to a field that you specify.  
  
## Syntax  
  
```  
  
FieldRef.SETFILTER(String [, Value],...)  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 The FieldRef that refers to the field that you want to place a filter on.  
  
 *String*  
 Type: Text or Code  
  
 The filter expression. A valid expression consists of alphanumeric characters and one or more of the following operators: \<, >, \*, &, &#124;, and =. You can use replacement fields \(%1, %2, and so on\) to insert values at run time.  
  
 *Value*  
 Type: any  
  
 Replacement values to insert in replacement fields in the filter expression. The data type of *Value* must match the type of *FieldRef*.  
  
## Remarks  
 If the function is called with a field for which a filter already exists, the filter is removed before a new one is set. You can construct filters using the following operators.  
  
|Operator|Description|  
|--------------|-----------------|  
|..|Range|  
|&|And|  
|&#124;|Or|  
|\<|Less than|  
|\<=|Less than or equal to|  
|>|Greater than|  
|>=|Greater than or equal to|  
|\<>|Different from|  
|\*|Forms a part of value|  
|@|Case-insensitive|  
  
 This function is like the [SETFILTER Function \(Record\)](SETFILTER-Function--Record-.md) function.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef for the first field \(No.\) and stores the reference in the MyFieldRef variable. The [GETFILTER Function \(FieldRef\)](GETFILTER-Function--FieldRef-.md) retrieves the filters that are set on the No. field and stores the value in the Filter1 variable. The value of any filter that is set is displayed in a message box. The SETFILTER function sets a filter that selects records from 10000 to 40000 in the No. field. The [GETFILTER Function \(FieldRef\)](GETFILTER-Function--FieldRef-.md) retrieves and stores the new filter in the Filter2 variable and displays it in a message. The value in the Filter1 variable is blank because no filter is set. The value in Filter2 is 10000..40000 because of the filter that is set by the SETFILTER function. This example requires that you create the following variables and text constants in the **C/AL Globals** windows.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|Filter1|Text|  
|Filter2|Text|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Filter before filters set: %1.|  
|Text001|Filter after filters set: %1.|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
Filter1 := MyFieldRef.GETFILTER;  
MESSAGE(Text000, Filter1);  
MyFieldRef.SETFILTER('10000..40000');  
Filter2 := MyFieldRef.GETFILTER;  
MESSAGE(Text001, Filter2);  
  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)