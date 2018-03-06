---
title: "ITEM Method (MediaSet)"
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

# ITEM Method (MediaSet)
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

For more information about indexes, see [Indexing of media objects in a media set](../devenv-working-with-media-on-records.md#Indexing).


## Property Value/Return Value  
Type: GUID  

Specifies the unique identifier (GUID) of the media object.

Media objects are stored in the system table **2000000184 Tenant Media** of the application database.

## Example  
For an example of using the ITEM method, see this [example](devenv-INSERT-Method-MediaSet.md#InsertMediaExample).

## See Also  
[Working With Media on Records](../devenv-working-with-media-on-records.md)  
[INSERT Method \(MediaSet\)](devenv-INSERT-Method-MediaSet.md)  
[IMPORTFILE Method \(MediaSet\)](devenv-IMPORTFILE-Method-MediaSet.md)   
[IMPORTSTREAM Method \(MediaSet\)](devenv-IMPORTSTREAM-Method-MediaSet.md)   
[MediaSet Data Type](../datatypes/devenv-MediaSet-Data-Type.md)
