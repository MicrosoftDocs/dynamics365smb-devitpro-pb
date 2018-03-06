---
title: "INSERT Method (MediaSet)"
ms.custom: na
ms.date: 11/17/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 270d2955-8330-466e-b7d3-46eb0901d42d
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# INSERT Method (MediaSet)
Adds a media object that already exists in the database to a MediaSet of a record.

## Syntax  

```  
[Ok := ]Record.MediaSetField.INSERT(MediaID)  
```  

#### Parameters  
*Record*  
Type: Record  

Specifies the record that includes the MediaSet to which you want to add the media object.  

*MediaSetField*  
Type: MediaSet  

Specifies the field of the record that is used for the MediaSet. This field must have the **MediaSet** data type.  

*MediaID*  
Type: GUID  

Specifies the unique ID that is assigned to the media object that you want to insert.

Existing media objects are stored in the system table **2000000184 Tenant Media** of the application database. There are different ways of obtaining the GUID of a media object. You could identify the media object ID by looking in the table. Or programmatically, you can use either the [Item Method](devenv-Item-Method-MediaSet.md) on a MediaSet data type field of a record or the [MEDIAID Method](devenv-MEDIAID-Method-Media.md) on Media data type field of a record.

## Property Value/Return Value  
Type: Boolean  

**True** if the media is successfully added to the MediaSet; otherwise, **false**.

## Remarks  
When media object is inserted in a MediaSet, it is assigned in index number. For more information, see [Indexing of media objects in a media set](../devenv-working-with-media-on-records.md#Indexing).

## <a name="InsertMediaExample"></a> Example  
This example uses the Insert method and [Item Method \(MediaSet\)](devenv-Item-Method-MediaSet.md) to take a media object that is already in the database and assigned to a record in a table (TableA), and add it to the MediaSet of a record in another table (TableB). This example assumes the following:

-   TableA and TableB already exist
-   Each table has a MediaSet data type field called **Images**
-   Each table contains the record number '1000'.
-   There is at least 1 media object in the MediaSet of record 1000 in TableA.

This code example requires you to create the following variables:  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|recA|Record|TableA|
|recB|Record|TableB|  
|mediaId|GUID|(not applicable) |


This code example requires you to create the following text constants:  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Media %1 was added to MediaSet %2.|
|Text001|The media was not added to MediaSet %1.|

Code:
```  
// Retrieves the GUID of the first media object (index number 1) in the MediaSet of record 1000 in TableA
recA.GET('1000');  
MediaId := recA.Images.Item(1);

// Adds media object to the MediaSet of record 1000 in TableB based on the media object GUID
recB.GET('1000');
IF recB.Images.INSERT(mediaId) THEN
  BEGIN
    recB.MODIFY;    
    MESSAGE (Text000, mediaId, recB.Images.MEDIAID);
  END
ELSE
  BEGIN
   MESSAGE (Text001);
  END;
```  

## See Also  
[Working With Media on Records](../devenv-working-with-media-on-records.md)  
[Item Method \(MediaSet\)](devenv-Item-Method-MediaSet.md)  
[IMPORTFILE Method \(MediaSet\)](devenv-IMPORTFILE-Method-MediaSet.md)   
[IMPORTSTREAM Method \(MediaSet\)](devenv-IMPORTSTREAM-Method-MediaSet.md)   
[MediaSet Data Type](../datatypes/devenv-MediaSet-Data-Type.md)
