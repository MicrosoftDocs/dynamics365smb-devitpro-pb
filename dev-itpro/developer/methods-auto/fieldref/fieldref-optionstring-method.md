---
title: "FieldRef.OptionString Method"
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
# FieldRef.OptionString Method
The 'OptionString' property has been deprecated and will be removed in the future. Use the 'OptionMembers' property instead.


## Syntax
```
OptionMembers :=   FieldRef.OptionString()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*OptionMembers*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 All the options for this field are returned as a comma separated string.  
  
 This method returns an error if no field is selected.  
  
 If the field is not an option an empty string is returned.  
  
## Example  
 The following example opens the Item table with RecordRef variable that is named ItemRecref and creates a reference to field 19 \(Price/Profit Calculation\), which is an Options field. The OPTIONSTRING method retrieves the options in the field and displays them as a comma separated list.

 ```
var
    MyFieldRef: FieldRef;
    ItemRecref: RecordRef;
    OptionString: Text;
begin
    ItemRecref.OPEN(DATABASE::Item);  
    MyFieldRef := ItemRecref.FIELD(19);  
    OptionString := MyFieldRef.OPTIONSTRING;  
    MESSAGE(' %1', OptionString);  
end;
```  


## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)