---
title: "MediaSet.Count Method"
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
# MediaSet.Count Method
Gets the number of media objects that are included in the MediaSet of a record.


## Syntax
```
Count :=   MediaSet.Count()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

## Return Value
*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of media objects that are included in the MediaSet of a record.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example counts the number of media objects that are available for item No. 1000 in table **27 Item** of the [!INCLUDE[demolonglight_md](../../includes/demolonglight_md.md)]. In this example, the field in the **Item** table that is used for the MediaSet data type is **Picture**.  

```
 var
    itemRec: Record Item;
    count: Integer;
    Text000: Label 'The number of media files: %1';
begin
    itemRec.Get('1000');  
        count := (itemRec.Picture.Count);  
        Message(Text000,count);  
end;
```  

## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)