---
title: "EXPORTFILE Method (Media)"
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

# EXPORTFILE Method (Media)
Exports the media object \(such as an image\) that is currently used on record to a file on your computer or network. On the record, the media object is referenced in a **Media** data type field.  

## Syntax  

```  
[Ok := ] Record.MediaField.EXPORTFILE(FileName)   
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that includes the media.  

 *MediaField*  
 Type: Media  

 Specifies the **Media** data type field of the record that includes the media.  

 *FileName*  
 Type: Text  

 Specifies the full path and name of the file to create for the exported media.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the media was successfully exported; otherwise, **false**.  

## Remarks  
 The exported media file will be of the same media type, such as JPEG \(.jpg\) or GIF \(.gif\), as it was when imported.  For more information about the media types, see [Supported Media Types](../devenv-working-with-media-on-records.md#SupportedMediaTypes).  

 If a file with the same name as the exported file already exists in the target folder and the current session has write access on the file, the existing file will be automatically replaced by the new file. If the export fails, the existing file will be erased.  

## Example  
 This example uses the EXPORTFILE method to export media objects that are used on records in a sample table that is named **My Items**. Each media object is exported to a separate file in a  folder on your computer.  

 The example assumes that the **My Items** table already exists. Also, the table contains a **Media** data type field that is named **Image**, and one or more records already include media. For information about importing media, see [IMPORTFILE Method \(Media\)](devenv-IMPORTFILE-Method-Media.md) or [IMPORTSTREAM Method \(Media\)](devenv-IMPORTSTREAM-Method-Media.md).  

The example code requires that you create the following variables and text constant:  

|  Variable name  |  DataType  |  Subtype  |  
|-----------------|------------|-----------|  
|myItemRec|Record|My Items|  
|fileName|Text| |  
|count|Integer|  |  

|  Text constant name  |  ConstValue  |
|----------------------|--------------|
|Text000|%1 media files were exported.|

The code iterates over records in the **My Items** table. If a media object is referenced in the *Image* field, the media is exported to a file in the *C:\images* folder. The file is given a name in the format *ItemNN.jpg*, where *NN* is the number assigned to item record in the table, as specified by the **No.** field.
```  
IF myItemRec.FINDFIRST() THEN  
BEGIN  
  REPEAT  
    fileName := 'C:\images\' + 'Item' + FORMAT(myItemRec."No.") + '.jpg';  
    IF myItemRec.Image.EXPORTFILE(fileName) THEN
      count := count + 1
  UNTIL myItemRec.NEXT < 1;
  MESSAGE(Text000, count);  
END;
```  

## See Also  
 [Working With Media on Records](../devenv-working-with-media-on-records.md)  
 [IMPORTSTREAM Method \(Media\)](devenv-IMPORTSTREAM-Method-Media.md)   
 [IMPORTFILE Method \(MediaSet\)](devenv-IMPORTFILE-Method-MediaSet.md)   
 [IMPORTSTREAM Method \(MediaSet\)](devenv-IMPORTSTREAM-Method-MediaSet.md)   
 [MediaSet Data Type](../datatypes/devenv-MediaSet-Data-Type.md)   
 [EXPORTSTREAM Method \(Media\)](devenv-EXPORTSTREAM-Method-Media.md)
