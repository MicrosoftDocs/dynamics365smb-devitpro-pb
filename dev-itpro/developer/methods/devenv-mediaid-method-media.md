---
title: "MEDIAID Method (Media)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: SusanneWindfeldPedersen
ms.service: dynamics365-financials
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MEDIAID Method (Media)
Gets the unique identifier of a media object on a record.  

## Syntax  

```  
Guid := Record.MediaField.MEDIAID  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that uses the media.  

 *MediaField*  
 Type: Media  

 Specifies the field that contains the media. This field has the **Media** data type.  

## Property Value/Return Value  
 Type: GUID  

 Specifies the GUID of media in the database.  

## Remarks  
 When a media is imported on the Media data type field of table record, the media is given a GUID and stored in the system table **2000000184 Tenant Media** of the application database. The GUID is then included in the **Media** data type field as a reference to the media in the database.  

## Example  
This example uses the MEDIAID method to get the GUID of the media object that is used on item number **1** in the a the table named **My Items**.  

The example assumes that  the **My Items** table already exists and has a **Media** data type field named **Image**.

This code requires you to create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|myItemRec|Record|My Items|  
|imageID|GUID||  

This code requires you to create the following text constant.  

|Text constant|ConstValue|  
|-------------------|---------------|  
|Text001|Item %1 has a media object with the following ID: %2|  

```  
myItemRec.GET('1');  
    mediaGuid := myItemRec.Image.MEDIAID;  
    MESSAGE(Text000, myItemRec."No.", imageID);  
```  

## See Also  
 [Working With Media on Records](../devenv-working-with-media-on-records.md)  
 [IMPORTFILE Method \(Media\)](devenv-IMPORTFILE-Method-Media.md)   
 [IMPORTSTREAM Method \(Media\)](devenv-IMPORTSTREAM-Method-Media.md)   
 [Media Data Type](../datatypes/devenv-Media-Data-Type.md)
