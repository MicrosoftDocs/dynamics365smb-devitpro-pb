---
title: "EXPORTFILE Method (MediaSet)"
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

# EXPORTFILE Method (MediaSet)
Exports the media objects in the current media set of a record to individual files on your computer or network. In the record, the media set is referenced in a **MediaSet** data type field.  

## Syntax  

```  
[count := ]Record.MediaSetField.EXPORTFILE(FileNamePrefix)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that includes the media set.  

 *MediaSet*  
 Type: MediaSet  

 Specifies the **MediaSet** data type field of the record that includes the media objects.  

 *FileNamePrefix*  
 Type: Text  

 Specifies the location and name of the exported media files.  

 Each exported media file is given a name that consists of a prefix that you specify, plus an index number that is automatically assigned. The file name has the format *prefix*-*index*.*type*, for example, Image-1.jpg, Image-2.jpg, and Image-3.jpg. To set the parameter value, use the format: *path*\\*prefix*.*type*.  

-   *path* is the folder path where you want to store the files.  

-   *prefix* is the text that you want before the index number.  

-   *type* is the media type extension.  

## Property Value/Return Value  
 Type: Integer  

 Specifies the number of media files that were generated and stored in the output file path.  

## Remarks  
 The exported media files will be of the same media file type as when they were imported. For more information about the media types, see [Supported Media Types](../devenv-working-with-media-on-records.md#SupportedMediaTypes).

The method has the following behavior:  

-   If a file that has the same name as the exported file already is located in the target folder and the current session has write access on the file, the existing file will be automatically replaced by the new file.  

-   If the export fails, the existing file will be erased.  

-   If a media in the media set cannot be found in the database, no file will be generated for this object.  

## Example  
This example first imports two media files \(JPEG image files\) from a local folder to the media set of a record in the table **27 Item** of the [!INCLUDE[demolonglight_md](../includes/demolonglight_md.md)]. Then, using the EXPORTFILE method, the media objects are exported to files again in another local folder.

For using media sets on records, the **Item** table includes a **MediaSet** data type field that is named **Picture**.  

The example code requires that you create the following variables and text constant:  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|itemRec|Record|Item|  
|count|Boolean| |  

|  Text constant name  |  ConstValue  |
|----------------------|--------------|
|Text000|%1 media files were exported.|

 The code imports the JPEG image files \(.jpg\) from the folder *C:\images* to record *1000* in the **Item** table, and then exports the media files to the folder *C:\images\export*.  

```  
// Import image files the C:\images folder.  
itemRec.GET('1000');
itemRec.Picture.IMPORTFILE('C:\images\1000-v1.jpg', 'Demo image for item ' + FORMAT(itemRec."No."));
itemRec.Picture.IMPORTFILE('C:\images\1000-v2.jpg', 'Demo image for item ' + FORMAT(itemRec."No."));
itemRec.MODIFY;
COMMIT;

// Export the MediaSet to two separate image files in the c:\images\export folder.  
itemRec.GET('1000');
count := itemRec.Picture.EXPORTFILE('C:\images\export\' + 'Item1000Image.jpg');   
Message('%1 files exported.', count);
```  

## See Also  
 [Working With Media on Records](../devenv-working-with-media-on-records.md)   
 [IMPORTSTREAM Method \(Media\)](devenv-IMPORTSTREAM-Method-Media.md)   
 [IMPORTFILE Method \(MediaSet\)](devenv-IMPORTFILE-Method-MediaSet.md)   
 [IMPORTSTREAM Method \(MediaSet\)](devenv-IMPORTSTREAM-Method-MediaSet.md)   
 [MediaSet Data Type](../datatypes/devenv-MediaSet-Data-Type.md)   
 [EXPORTSTREAM Method \(Media\)](devenv-EXPORTSTREAM-Method-Media.md)   
 [EXPORTFILE Method \(Media\)](devenv-EXPORTFILE-Method-Media.md)
