---
title: "GETFILTER Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 65221170-c9fb-4563-984b-386229e38410
caps.latest.revision: 15
---
# GETFILTER Function (FieldRef)
Gets the filter that is currently applied to the field referred to by FieldRef.  
  
## Syntax  
  
```  
  
String := FieldRef.GETFILTER  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the field for which you want to return the filter.  
  
## Property Value/Return Value  
 Type: Text  
  
 This string contains the filter that is applied to the field in the record.  
  
## Remarks  
 See also [GETFILTERS Function \(RecordRef\)](GETFILTERS-Function--RecordRef-.md), [SETFILTER Function \(FieldRef\)](SETFILTER-Function--FieldRef-.md), and [SETRANGE Function \(FieldRef\)](SETRANGE-Function--FieldRef-.md).  
  
 This function is like the [GETFILTER Function \(Record\)](GETFILTER-Function--Record-.md)function.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef for the first field \(No.\) and stores the reference in the MyFieldRef variable. The GETFILTER function retrieves the filters that are set on the No. field and stores the value in the Filters1 variable. The value of any filter that is set is displayed in a message box. The [SETFILTER Function \(FieldRef\)](SETFILTER-Function--FieldRef-.md) sets the filter that selects records from 10000 to 40000 in the No. field. The GETFILTER function retrieves and stores the filter in the Filter2 variable and displays it in a message. The value in the Filter1 variable is blank because no filter is set. The value in Filter2 is 10000..40000 because of the filter that is set by the [SETFILTER Function \(FieldRef\)](SETFILTER-Function--FieldRef-.md). This example requires that you create the following variables and text constants in the **C/AL Globals** windows.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|Filters1|Text|  
|Filters2|Text|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Filter before filters set: %1.|  
|Text001|Filter after filters set: %1.|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
Filters1 := MyFieldRef.GETFILTER;  
MESSAGE(Text000, Filters1);  
MyFieldRef.SETFILTER('10000..40000');  
Filters2 := MyFieldRef.GETFILTER;  
MESSAGE(Text001, Filters2);  
  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)