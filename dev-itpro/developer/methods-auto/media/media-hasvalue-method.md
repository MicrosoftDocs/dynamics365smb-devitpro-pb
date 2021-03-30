---
title: "Media.HasValue Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# Media.HasValue Method
> **Version**: _Available or changed with runtime version 1.0._

Checks whether a Media data type field in a record has been initialized with a media object and that the specified media object exists in the database.


## Syntax
```
HasValue :=   Media.HasValue()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*Media*
&emsp;Type: [Media](media-data-type.md)
An instance of the [Media](media-data-type.md) data type.

## Return Value
*HasValue*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the Media data type field in a record has been initialized with a media object and the specified media object exists in the database, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
This example uses the HasValue method to iterate over the **My Items** table to determine whether media objects are available on records in the table.  

The example assumes that **My Items** table exists and contains a **Media** data type field that is named **Image**. For information about importing media, see [ImportFile Method \(Media\)](../../methods-auto/media/media-importfile-method.md).  

The code returns a message if a record does not include a media object. 

```al
 var
    myItemRec: Record "My Items";
begin
    if myItemRec.FindFirst() then begin 
        repeat begin
            if not myItemRec.Image.HasValue then
                Error('Item %1 does not have a valid image', myItemRec."No.");          
        end until myItemRec.Next < 1;  
    end; 
end;
```  

## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)