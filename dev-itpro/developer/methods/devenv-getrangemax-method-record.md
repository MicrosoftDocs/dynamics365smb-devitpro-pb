---
title: "GETRANGEMAX Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 80fdb0ad-7b4f-417c-9c88-be35b66c1b0d
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETRANGEMAX Method (Record)
Gets the maximum value in a range for a field.  
  
## Syntax  
  
```  
  
Value := Record.GETRANGEMAX(Field)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the field.  
  
 *Field*  
 Type: Field  
  
 The field for which you want to find the maximum value. The current filter on *Field* must be a single range filter; otherwise, a run-time error occurs.  
  
## Property Value/Return Value  
 Type: Depends on *Field*  
  
 Contains the maximum value of the range set for *Field*. The type of the return value must match the type of *Field*.  
  
## Remarks  
 The current filter on *Field* must be a single range filter; otherwise, a run-time error occurs. This means that field cannot be included in two different FILTERGROUPs, as shown in the following code example:  
  
```  
WITH GLAcc DO BEGIN  
  FILTERGROUP(2);  
    SETRANGE("Date Filter",010415D,300415D);  
  FILTERGROUP(0);  
    SETRANGE("Date Filter",TODAY,CLOSINGDATE(CALCDATE('<CM>',TODAY)));  
  
  MESSAGE('%1',GETRANGEMAX("Date Filter"));  
END;  
```  
  
## Example  
 In this example, you have a filter that defines a single range.  
  
 This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|CustomerRec|Record|Customer|Not applicable|  
|Val|Code|Not applicable|10|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The maximum value is: %1.|  
  
```  
CustomerRec.SETFILTER("No.",'100..200');  
Val := CustomerRec.GETRANGEMAX("No.");  
MESSAGE(Text000, Val);  
```  
  
 The following message is displayed:  
  
 **The maximum value is: 200.**  
  
## Example  
 In this example, you have a filter that is a single value.  
  
 This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|CustomerRec|Record|Customer|Not applicable|  
|Val|Code|Not applicable|10|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The maximum value is: %1.|  
  
```  
CustomerRec.SETFILTER("No.",'100');  
Val := CustomerRec.GETRANGEMAX("No.");  
MESSAGE(Text000, Val);  
```  
  
 The following message is displayed:  
  
 **The maximum value is: 100.**  
  
## Example  
 In this example, you have a filter that is not a single range.  
  
 This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|CustomerRec|Record|Customer|Not applicable|  
|Val|Code|Not applicable|10|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The maximum value is: %1.|  
  
```  
CustomerRec.SETFILTER("No.",'200|300');  
Val := CustomerRec.GETRANGEMAX("No.");  
MESSAGE(Text000, Val);  
```  
  
 This example causes a run-time error to occur.  
  
## See Also  
 [GETRANGEMIN Method \(Record\)](devenv-GETRANGEMIN-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)