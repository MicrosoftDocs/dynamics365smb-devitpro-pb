---
title: "GETFILTER Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 65221170-c9fb-4563-984b-386229e38410
caps.latest.revision: 15
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETFILTER Method (FieldRef)
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
 See also [GETFILTERS Method \(RecordRef\)](devenv-GETFILTERS-Method-RecordRef.md), [SETFILTER Method \(FieldRef\)](devenv-SETFILTER-Method-FieldRef.md), and [SETRANGE Method \(FieldRef\)](devenv-SETRANGE-Method-FieldRef.md).  
  
 This method is like the [GETFILTER Method \(Record\)](devenv-GETFILTER-Method-Record.md)method.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef for the first field \(No.\) and stores the reference in the MyFieldRef variable. The GETFILTER method retrieves the filters that are set on the No. field and stores the value in the Filters1 variable. The value of any filter that is set is displayed in a message box. The [SETFILTER Method \(FieldRef\)](devenv-SETFILTER-Method-FieldRef.md) sets the filter that selects records from 10000 to 40000 in the No. field. The GETFILTER method retrieves and stores the filter in the Filter2 variable and displays it in a message. The value in the Filter1 variable is blank because no filter is set. The value in Filter2 is 10000..40000 because of the filter that is set by the [SETFILTER Method \(FieldRef\)](devenv-SETFILTER-Method-FieldRef.md). This example requires that you create the following global variables and text constantss.  
  
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
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)