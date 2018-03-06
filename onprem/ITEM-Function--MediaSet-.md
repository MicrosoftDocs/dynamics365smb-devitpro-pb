---
title: "ITEM Function (MediaSet)"
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
# ITEM Function (MediaSet)
Gets the unique identifier (GUID) of a media object that is assigned to a MediaSet on a record.

## Syntax  

```  
[mediaId := ]Record.MediaSetField.ITEM(Index)  
```  

#### Parameters  
*Record*  
Type: Record  

Specifies the record that includes the MediaSet.

*MediaSetField*  
Type: MediaSet  

Specifies the field of the record that is used for the MediaSet that contains the media object. This field must have the **MediaSet** data type.

*Index*  
Type: Integer  

Specifies the index number that is assigned to the media object in the MediaSet.

For more information about indexes, see [Indexing of media objects in a media set](Working-With-Media-on-Records.md#Indexing).


## Property Value/Return Value  
Type: GUID  

Specifies the unique identifier (GUID) of the media object.

Media objects are stored in the system table **2000000184 Tenant Media** of the application database.

## Example  
For an example of using the ITEM function, see the [example](INSERT-Function--MediaSet-.md#InsertMediaExample).

## See Also  
[Working With Media on Records](Working-With-Media-on-Records.md)  
[INSERT Function \(MediaSet\)](INSERT-Function--MediaSet-.md)  
[IMPORTFILE Function \(MediaSet\)](IMPORTFILE-Function--MediaSet-.md)   
[IMPORTSTREAM Function \(MediaSet\)](IMPORTSTREAM-Function--MediaSet-.md)   
[MediaSet Data Type](MediaSet-Data-Type.md)
