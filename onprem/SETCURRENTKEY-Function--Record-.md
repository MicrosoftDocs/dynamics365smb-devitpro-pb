---
title: "SetCurrentKey Function (Record)"
description: "Document the SetCurrentKey Function (Record)."
ms.custom: na
ms.date: 01/31/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 216cdb5a-36a1-48dd-90d0-f9f360feccee
caps.latest.revision: 21
manager: edupont
---

<!--
Additional changes were made based on the following information provided in the deliverable's description: 

"What has changed:
Before NAV2016 SetCurrentKey method was setting a Key on a record and applied sorting on the key fields. When setting the key and sorting was successful this method returned TRUE. Otherwise it was false.

In NAV2016 this method got extended. In the case when key could not be set (might not exist or be disabled), sorting on the given fields is still applied. SetCurrentKey will then return TRUE, if the key was not set, but sorting was applied."
-->
# SetCurrentKey Function (Record)
Sorts the contents of the table on the provided fields and selects the key that contains the specified fields if possible.  
  
## Syntax  
  
```    
[Ok :=] Record.SetCurrentKey(Field1, [Field2],...)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the fields on which you sort the contents of the table and on which you identify the key you want to select. The fields can be of any data type that can be used to define a key. Data types that are not supported include BLOBs, FlowFilters, variables, and functions. 
  
 *Field1, Field2, …*  
 Type: Field  
  
 One or more fields that sort the contents of the table. The fields can optionally identify the key that should be selected. 
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if sorting could be applied based on the specified fields; otherwise, **false**.  

 If you omit this optional return value and sorting cannot be applied on the key's fields, then a runtime error occurs. If you include a return value, then you must handle any errors.    
  
## Remarks  
 **SetCurrentKey** is used to sort the contents of the table on the provided fields and select the key that contains the specified fields if possible. This key becomes the current key and is used by the [FIND Function \(Record\)](FIND-Function--Record-.md), the [NEXT Function \(Record\)](NEXT-Function--Record-.md), and other functions until another key is selected. Until this function is called, the table's primary key is used as the current key.  
  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md), [CALCSUMS Function \(Record\)](CALCSUMS-Function--Record-.md), and [CALCSUM Function \(FieldRef\)](CALCSUM-Function--FieldRef-.md) do not require that a SIFT index is defined for the fields that are being calculated. Therefore, you do not need to define keys solely for SIFT indexes. Fewer SIFT indexes and fewer keys can improve performance. In versions earlier than Dynamics NAV 2016, if a [!INCLUDE[navnow](includes/navnow_md.md)] key that started with the fields that you specified as parameters to **SetCurrentKey** did not exist, then you received an error when you called the **SetCurrentKey** function. This provided a degree of protection in versions earlier than Dynamics NAV 2016 against accidentally requesting a sorting for which no index existed. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  
  
 Use the following guidelines when you use **SetCurrentKey**:  
  
-   Inactive fields are ignored. Only active keys are scanned.  
  
-   When searching for a key, [!INCLUDE[navnow](includes/navnow_md.md)] selects the first occurrence of the specified field\(s\). This means the following:  
  
    -   If you specify only one field as a parameter when you call **SetCurrentKey**, then the key that is actually selected may consist of more than one field.  
  
    -   If the field that you specify is the first component of several keys, then the key that is selected is the first one that matches, which may not be the key that you expect.  
  
-   If no keys can be found that include the field\(s\) that you specify and sorting on a given field\(s\) cannot be set, then an runtime error occurs unless you test the Boolean value of **SetCurrentKey** in your code. 
  
-   If you do test the return value, then you must decide what to do if the function returns **false**, because without a run-time error, the application continues to run even though no key was found and may fail later.  
  
-   Use only the necessary key fields in a call to **SetCurrentKey**. If the definition of the key includes the fields that you specify in the call to **SetCurrentKey** in the order given, then you can change the definition of the key without having to change any code. If the table order is not important, then consider one of the following:  
  
    -   If the expected result set is small, then do not call **SetCurrentKey** at all. The result will be sorted according to the smallest possible key, which is the primary key.  
  
    -   If the expected result set is large, then call **SetCurrentKey** with a field set that matches subsequent calls to **SETRANGE** and **SETFILTER** functions. This way, there is less risk that extra sorting of the large result must be done.  
  
## Example  
 This example shows how to use the **SetCurrentKey** function without using a return value. This example requires that you create the following variable. This statement applies sorting on the Name field and selects the Name key for the **Customer** table if possible. If sorting cannot be applied, a runtime error occurs. 
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|MyCustomer|Record|Customer|  
  
```  
MyCustomer.SetCurrentKey(Name);  
```  
  
## Example  
 This example shows how to use the **SetCurrentKey** function with a return value.  
  
 This example requires that you create the following variable.  
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|MyCustomer|Record|Customer|  
  
 This example requires that you create the following text constants.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The key was successfully selected.|  
|Text001|The key could not be found.|  
  
```  
IF MyCustomer.SetCurrentKey(Name) THEN  
  MESSAGE(Text000)  
ELSE  
  MESSAGE(Text001);  
```  
 By including a return value, you can avoid a runtime error if sorting could not be applied.

## Example
The following code exemplifies how to check if a key was set.

```
SalesInvoiceHeader.SETCURRENTKEY("Document Date"); 
SalesInvoiceHeaderRef.GETTABLE(SalesInvoiceHeader); // RecordRef data type can be used to check if key was set

IF SalesInvoiceHeaderRef.CURRENTKEYINDEX = -1 THEN
  MESSAGE('Key is NOT set, but sorting is.')
ELSE
  MESSAGE('Both key and sorting are set.');
```
## See Also  
 [Record Data Type](Record-Data-Type.md)