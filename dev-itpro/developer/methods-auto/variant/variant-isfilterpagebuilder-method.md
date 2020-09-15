---
title: "Variant.IsFilterPageBuilder Method"
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
# Variant.IsFilterPageBuilder Method
Indicates whether an AL variant contains a FilterPageBuilder variable.


## Syntax
```
Ok :=   Variant.IsFilterPageBuilder()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Variant*  
&emsp;Type: [Variant](variant-data-type.md)  
An instance of the [Variant](variant-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the AL variant contains a FilterPageBuilder variable, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example uses the ISFILTERPAGEBUILDER method on a filter page object that includes a filter control for the **Date** system table.  
   
```  
var
    varDateItem: Text;
    varFilterPageBuilder: FilterPageBuilder;
    myVariant: Variant;
begin
    varDateItem := 'Date record';  
    varFilterPageBuilder.ADDTABLE(varDateItem + ‘ 1’,DATABASE::Date);  
    myVariant := varFilterPageBuilder;  
    if not myVariant.ISFILTERPAGEBUILDER then   
      ERROR(‘This variant should contain a FilterPageBuilder variable’);  
end;
  
```  

## See Also
[Variant Data Type](variant-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)