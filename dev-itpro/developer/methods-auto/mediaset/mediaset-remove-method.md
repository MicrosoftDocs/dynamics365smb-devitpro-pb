---
title: "MediaSet.Remove Method"
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
# MediaSet.Remove Method
Removes a media object from a MediaSet of a record.


## Syntax
```
[Result := ]  MediaSet.Remove(MediaId: Guid)
```
## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

*MediaId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
Specifies the unique ID that is assigned to the media object that you want to remove from the MediaSet. Existing media objects are stored in the system table 2000000184 Tenant Media of the application database. There are different ways of obtaining the GUID of a media object. You could identify the media object ID by looking in the table. Or programmatically, you can use either the Item function on a MediaSet data type field of a record or the MEDIAID function on Media data type field of a record.
          


## Return Value
*Result*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the object was removed or **false** if a media object with the given ID was not present in the set. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The REMOVE method disassociates the media object from the MediaSet. It does not delete the media object from the database.

## Example  
This example uses the REMOVE method and [Item Method \(MediaSet\)](../../methods-auto/mediaset/mediaset-item-method.md) to remove a media object from the MediaSet for record '1000' in the table called TableA. This example assumes the following about TableA:

-   It has a MediaSet data type field called **Images**
-   It contains the record number '1000'.
-   Record '1000' has at least 1 media object in the MediaSet.

```
 var
    recA: Record TableA;
    mediasetId: GUID;
    Text000: Label 'Media %1 was removed from MediaSet %2.';
    Text001: Label 'The media was not removed from MediaSet %1.';
begin 
    // Retrieves the GUID of the first media object (index number 1) in the MediaSet of record 1000 in TableA
    recA.Get('1000');  
    mediaId := recA.Images.Item(1);
    
    // Removes the media object from the MediaSet of record 1000
    if recA.Images.Remove(mediaId) then begin
        recA.Modify;    
        Message(Text000, mediaId, recA.Images.MediaId);
    end else begin
        Message(Text001);
    end;
end;
```  
## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)