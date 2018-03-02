---
title: "MEDIAID Function (MediaSet)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 270d2955-8330-466e-b7d3-46eb0901d42d
caps.latest.revision: 4
author: jswymer
---
# MEDIAID Function (MediaSet)
Gets the unique identifier that is assigned to a MediaSet of a record. The MediaSet is a collection of media objects that are used on the record that can be displayed in the client.  

## Syntax  

```  
Guid := Record.MediaSetField.MEDIAID  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that includes the MediaSet.  

 *MediaSetField*  
 Type: MediaSet  

 Specifies the field that includes the media. This field must have the **MediaSet** data type.  

## Property Value/Return Value  
 Type: GUID  

 The GUID of MediaSet on the record.  

## Remarks  
When you import media on a table record by using either the [IMPORTFILE Function \(MediaSet\)](IMPORTFILE-Function--MediaSet-.md) or [IMPORTSTREAM Function \(MediaSet\)](IMPORTSTREAM-Function--MediaSet-.md), the media is assigned to a MediaSet GUID in the system table **2000000183 Tenant Media Set** of the application database. You can use the MEDIAID function to retrieve the MediaSet GUID. Note that the imported media object is also assigned a GUID. To get the media object's GUID, you can use the [MEDIAID Function \(Media\)](MEDIAID-Function--Media-.md).  

## Example  
This example is gets the GUID of the MediaSet that is used on item No. 1000 in the **Item** table. The field in the **Item** table that is used for the MediaSet data type is **Picture**.  

 This code requires you to create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|item|Record|Item|  
|mediasetId|GUID||  

 This code requires you to create the following text constant.  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The GUID of the MediaSet is: %1|  

```  
item.GET('1000');  
    mediasetId := item.Picture.MEDIAID;  
    MESSAGE(Text000, mediasetId);  
```  

## See Also  
[Working With Media on Records](Working-With-Media-on-Records.md)  
[IMPORTFILE Function \(MediaSet\)](IMPORTFILE-Function--MediaSet-.md)   
[IMPORTSTREAM Function \(MediaSet\)](IMPORTSTREAM-Function--MediaSet-.md)   
[MediaSet Data Type](MediaSet-Data-Type.md)
