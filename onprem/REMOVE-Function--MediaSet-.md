---
title: "REMOVE Function (MediaSet)"
ms.custom: na
ms.date: 11/17/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 270d2955-8330-466e-b7d3-46eb0901d42d
caps.latest.revision: 4
author: jswymer
---
# REMOVE Function (MediaSet)
Removes a media object from a MediaSet of a record.

## Syntax  

```  
[Ok := ]Record.MediaSetField.REMOVE(MediaID)  
```  

#### Parameters  
*Record*  
Type: Record  

Specifies the record that includes the MediaSet.  

*MediaSetField*  
Type: MediaSet  

Specifies the field of the record that is used for the MediaSet that contains the media object to remove. This field must have the **MediaSet** data type.

*MediaID*  
Type: GUID  

Specifies the unique ID that is assigned to the media object that you want to remove from the MediaSet.

Existing media objects are stored in the system table **2000000184 Tenant Media** of the application database. There are different ways of obtaining the GUID of a media object. You could identify the media object ID by looking in the table. Or programmatically, you can use either the [Item Function](Item-Function--MediaSet-.md) on a MediaSet data type field of a record or the [MEDIAID Function](MEDIAID-Function--Media-.md) on Media data type field of a record.

## Property Value/Return Value  
Type: Boolean  

**true** if the media is successfully removed from the MediaSet; otherwise, **false**.

## Remarks  
The REMOVE function disassociates the media object from the MediaSet. It does not delete the media object from the database.

## Example  
This example uses the REMOVE function and [Item Function \(MediaSet\)](Item-Function--MediaSet-.md) to remove a media object from the MediaSet for record '1000' in the table called TableA. This example assumes the following about TableA:

-   It has a MediaSet data type field called **Images**
-   It contains the record number '1000'.
-   Record '1000' has at least 1 media object in the MediaSet.

This code example requires you to create the following variables:  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|recA|Record|TableA|
|mediaId|GUID|(not applicable) |


This code example requires you to create the following text constants:  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Media %1 was removed from MediaSet %2.|
|Text001|The media was not removed from MediaSet %1.|

Code:
```  
// Retrieves the GUID of the first media object (index number 1) in the MediaSet of record 1000 in TableA
recA.GET('1000');  
mediaId := recA.Images.Item(1);

// Removes the media object from the MediaSet of record 1000
IF recA.Images.REMOVE(mediaId) THEN
  BEGIN
    recA.MODIFY;    
    MESSAGE (Text000, mediaId, recA.Images.MEDIAID);
  END
ELSE
  BEGIN
    MESSAGE (Text001);
  END;
```  

## See Also  
[Working With Media on Records](Working-With-Media-on-Records.md)  
[IMPORTFILE Function \(MediaSet\)](IMPORTFILE-Function--MediaSet-.md)   
[IMPORTSTREAM Function \(MediaSet\)](IMPORTSTREAM-Function--MediaSet-.md)   
[MediaSet Data Type](MediaSet-Data-Type.md)
