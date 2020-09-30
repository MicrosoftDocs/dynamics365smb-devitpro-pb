---
title: "FieldRef.OptionCaption Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# FieldRef.OptionCaption Method
Gets the option caption of the field that is currently selected.


## Syntax
```
OptionCaption :=   FieldRef.OptionCaption()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*OptionCaption*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The option caption of the field is returned as a comma separated string.  
  
 If the field is not an Option, an empty string is returned.  
  
 This method returns an error if no field is selected.  
  
## Example  
 The following example opens the Item table as a RecordRef variable that is named ItemRecref. and creates a reference to field 19 \(Price/Profit Calculation field\), which is an Option field. The OPTIONCAPTION method retrieves the caption of the option field and displays the options as a comma separated list. 

```
var
    MyFieldRef: FieldRef;
    ItemRecref: RecordRef;
    OptionCaption: Text;
begin
    ItemRecref.OPEN(DATABASE::Item);  
    MyFieldRef := ItemRecref.FIELD(19);  
    OptionCaption := MyFieldRef.OPTIONCAPTION;  
    MESSAGE('%1', OptionCaption);  
end;
```  
  
  
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)