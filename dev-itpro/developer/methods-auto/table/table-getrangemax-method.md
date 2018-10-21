---
title: "GetRangeMax Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
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
# GetRangeMax Method
Gets the maximum value in a range for a field.

## Syntax
```
Value :=   Table.GetRangeMax(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field for which you want to find the maximum value. The current filter on Field must be a single range filter; otherwise, a run-time error occurs.
          


## Return Value
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)