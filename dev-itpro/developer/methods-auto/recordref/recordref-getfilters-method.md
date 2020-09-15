---
title: "RecordRef.GetFilters Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.GetFilters Method
Determines which filters have been applied to the table referred to by the RecordRef.


## Syntax
```
String :=   RecordRef.GetFilters()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
Filters that have been applied to the table that is referred to by the RecordRef parameter.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [GETFILTERS Method \(Record\)](../record/record-getfilters-method.md).  
  
## Property Value/Return Value  
 Filters that have been applied to the table that is referred to by the *RecordRef* parameter.  
  
## Example  
 The following example opens a table as a RecorRef variable. The variable, RecRef, is used with the GETFILTERS method to retrieve the filters that are applied in the Customer table. If filters are applied, they will be stored in the Filters1 variable. The Filters1 variable does not contain any filters because filters have not been set. Then the [SETRECFILTER Method \(RecordRef\)](recordref-setrecfilter-method.md) is used to set the value in the current key of the current record as a filter. The variable Filters2 will now contain No. as a filter. 
   
```   
var
    RecRef: RecordRef;
    Filters1: Text;
    Filters2: Text;
    Text000: TexConst ENU='Filters1 contains : %1  Filters2 contains: %2';
begin   
    RecRef.OPEN(DATABASE::Customer);  
    Filters1 := RecRef.GETFILTERS;  
    RecRef.SETRECFILTER;  
    Filters2 := RecRef.GETFILTERS;  
    MESSAGE(Text000, Filters1, Filters2);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)