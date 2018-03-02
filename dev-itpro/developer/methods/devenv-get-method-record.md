---
title: "GET Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 016aef60-9faa-48a3-bee6-cfe71cf9c900
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GET Method (Record)
Gets a record based on values stored in primary key fields.  

## Syntax  

```  

[Ok :=] Record.GET([Value] ,...)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The record in the table.  

 *Value,…*  
 Type: any  

 Values in primary key fields. The data type of this parameter must match the data type of the corresponding primary key field. For example, if you enter an integer, the data type of the corresponding primary key field must also be an integer. The value 0 \(zero\) or an empty string is assigned to unspecified fields.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the record was found; otherwise, **false**.  

 If you omit this optional return value and if the record cannot be found, then a run-time error occurs. If you include the return value, then you must handle any errors.  

## Remarks  
 This method always uses the primary key for the table. It ignores any filters that are set, except security filters. Security filters are applied or ignored based on the Security Filter Mode. The current key and filters are not changed after you call this method. <!--Links For more information, see [Security Filter Modes](Security-Filter-Modes.md)-->.  

 This method ignores any call to the [SETAUTOCALCFIELDS Method \(Record\)](devenv-SETAUTOCALCFIELDS-Method-Record.md). Therefore, a **GET** call on a record after a **SETAUTOCALCFIELDS** call does not automatically calculate FlowFields in the record.  

 > [!NOTE]  
> You cannot use the GET method to retrieve a record in a table by its primary key value if the primary key field in the table has the data type RecordID. In this case, you can retrieve the record by using the Record.SETRANGE(FieldName, FieldValue) method.

## Example  
 This example requires that you create the following global variable and text constants.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  

|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|The record was found.|  
|Text001|The record could not be found.|  

```  
CustomerRec.GET('1120');  
// This statement causes a run-time error if customer 1120 cannot be   
// found. To avoid this, use the following construct:  
IF CustomerRec.GET('1120') THEN  
  MESSAGE(Text000)  
ELSE  
  MESSAGE(Text001);  
```  

## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)   
 [FILTERGROUP Method \(Record\)](devenv-FILTERGROUP-Method-Record.md)   
 [GET, FIND, and NEXT Methods](../devenv-get-find-and-next-methods.md)
