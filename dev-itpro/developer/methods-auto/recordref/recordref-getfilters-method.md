---
title: "RecordRef.GetFilters() Method"
description: "Determines which filters have been applied to the table referred to by the RecordRef."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.GetFilters() Method
> **Version**: _Available or changed with runtime version 1.0._

Determines which filters have been applied to the table referred to by the RecordRef.


## Syntax
```AL
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
 This method works just like the [GetFilters Method \(Record\)](../record/record-getfilters-method.md).  
  
## Property Value/Return Value  
 Filters that have been applied to the table that is referred to by the *RecordRef* parameter.  
  
## Example  
 The following example opens a table as a RecorRef variable. The variable, RecRef, is used with the GetFilters method to retrieve the filters that are applied in the Customer table. If filters are applied, they will be stored in the Filters1 variable. The Filters1 variable does not contain any filters because filters have not been set. Then the [SetRecFilter Method \(RecordRef\)](recordref-setrecfilter-method.md) is used to set the value in the current key of the current record as a filter. The variable Filters2 will now contain No. as a filter. 
   
```al
var
    RecRef: RecordRef;
    Filters1: Text;
    Filters2: Text;
    Text000: TexConst ENU='Filters1 contains : %1  Filters2 contains: %2';
begin   
    RecRef.Open(Database::Customer);  
    Filters1 := RecRef.GetFilters;  
    RecRef.SetRecFilter;  
    Filters2 := RecRef.GetFilters;  
    Message(Text000, Filters1, Filters2);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)