---
title: "HasFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 09/24/2019
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
# HasFilter Method
Determines whether a filter has been applied to the table that the RecordRef refers to.


## Syntax
```
Ok :=   RecordRef.HasFilter()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the table referred to by RecordRef has a filter; otherwise, **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [HASFILTER Method \(Record\)](../../methods/devenv-hasfilter-method-record.md).  
  
## Example  
 The following example opens the Customer table with a RecordRef variable that is named RecRef. The HASFILTER method determines whether a filter has been applied in the Customer table. The method returns **false** because no filters are applied. The return value is stored in the varHasFilters variable. The [SETRECFILTER Method \(RecordRef\)](../../methods/devenv-setrecfilter-method-recordref.md) is used to set a filter. The HASFILTER method now returns **true**. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varHasFilters|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Are there any filters? %1|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
VarHasFilters := RecRef.HASFILTER;  
MESSAGE('Are there any filters? %1', VarHasFilters);  
RecRef.SETRECFILTER;  
VarHasFilters := RecRef.HASFILTER;  
MESSAGE(Text000, VarHasFilters);  
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)