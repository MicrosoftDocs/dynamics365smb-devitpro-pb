---
title: "HASVALUE Function (Media)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
manager: edupont
---
# HASVALUE Function (Media)
Checks whether a **Media** data type field in a record has been initialized with a media object and that the specified media object exists in the database.  

## Syntax  

```  
HasValue := Record.MediaField.HASVALUE  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that includes the media.  

 *MediaField*  
 Type: Media  

 Specifies the **Media** data type field of the record that includes the media.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the **Media** data type field has media data; otherwise, **false**.  

## Example  
This example uses the HASVALUE function to iterate over the **My Items** table to determine whether media objects are available on records in the table.  

The example assumes that **My Items** table exists and contains a **Media** data type field that is named **Image**. For information about importing media, see [IMPORTFILE Function \(Media\)](IMPORTFILE-Function--Media-.md).  

The code returns a message if a record does not include a media object. To support the code, you must create the following variable:  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|myItemRec|Record|My Items|  

```  
IF myItemRec.FINDFIRST() THEN  
BEGIN  
  REPEAT  
    If NOT myItemRec.Image.HASVALUE THEN  
      ERROR('Item %1 does not have a valid image', myItemRec."No.");  
  UNTIL myItemRec.NEXT < 1;  
END;  
```  

## See Also  
 [Working With Media on Records](Working-With-Media-on-Records.md)   
 [IMPORTFILE Function \(Media\)](IMPORTFILE-Function--Media-.md)   
 [IMPORTSTREAM Function \(Media\)](IMPORTSTREAM-Function--Media-.md)   
 [EXPORTFILE Function \(Media\)](EXPORTFILE-Function--Media-.md)  
 [EXPORTSTREAM Function \(Media\)](EXPORTSTREAM-Function--Media-.md)  
 [MediaSet Data Type](MediaSet-Data-Type.md)  
