---
title: "Type Method"
ms.author: solsen
ms.custom: na
ms.date: 09/16/2019
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
# Type Method
Gets the data type of the field that is currently selected.


## Syntax
```
Type :=   FieldRef.Type()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Type*  
&emsp;Type: [FieldType](../fieldtype/fieldtype-option.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The code loops through fields 1 to 5 and creates a FieldRef that is named MyFieldRef for each field that is selected. `MyFieldRef.TYPE` retrieves the data of each field and displays it in a message box. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varType|Variant|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Field %1 is a %2 data type.|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
FOR i := 1 TO 5 DO BEGIN  
  MyFieldRef := CustomerRecref.FIELD(i);  
  MESSAGE(Text000, i, MyFieldRef.TYPE);  
END;  
  
```  
  
  
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)