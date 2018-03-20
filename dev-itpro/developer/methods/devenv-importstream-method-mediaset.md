---
title: "IMPORTSTREAM Method (MediaSet)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: SusanneWindfeldPedersen
ms.service: dynamics365-financials
---

 

# IMPORTSTREAM Method (MediaSet)
Adds a media file, such as a JPEG image, from an InStream object to the MediaSet of record for displaying in the client. The media is imported to the database and included in a MediaSet for the record.

## Syntax  

```  
[Guid := ]Record.MediaSetField.IMPORTSTREAM(InStreamObject, Description[, MimeType])  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that you want to add the media to.  

 *MediaSetField*  
  Type: MediaSet  

  Specifies the field that you want to add the media to. The field must have the **MediaSet** data type.  

 *InStreamObject*  
 Type: InStream  

 Specifies the InStream object that contains the media that you want to use on the record.  

 *Description*  
 Type: Text  

 Specifies text that can be used in the client to describe the media files.  

 *MimeType*  
 Type: Text  

 [!INCLUDE[mimetype](../includes/mimetype_md.md)]

## Property Value/Return Value  
 Type: GUID  

 The unique ID assigned to the MediaSet of the record. You can also retrieve the ID by using the [MEDIAID Method \(MediaSet\)](devenv-MEDIAID-Method-MediaSet.md).  

## Remarks  
 You can use this method to upload media that you want to associate with a record to the database. For example, you can upload media to items in table **27 Item**. The method is similar to the [IMPORTSTREAM Method \(Media\)](devenv-IMPORTSTREAM-Method-Media.md) except that this method enables you to import multiple media objects on the same record.  

When a media is imported, it is assigned a unique identifier \(GUID\) and stored in the system table **2000000181 Tenant Media** of the application database.

In addition, the media object is assigned to a MediaSet which also has a specific GUID. This GUID is included in the MediaSet data type field as a reference to the media objects. The MediaSet and its GUID are created with the first media that is imported, and the information is stored in table **2000000183 Tenant Media Set**. All additional media objects for the record are then associated with the same MediaSet GUID.

## Example  
 This example uses the IMPORTSTREAM method to add images to records in table **27 Item** of the [!INCLUDE[demolonglight_md](../includes/demolonglight_md.md)].

 To support the example code that follows, you also have to complete these tasks:  

-   Create two sample image files that you want to use on item no. 1000 in table **27 Item**.

    Save the images as JPEG type, and give them the names 1000-v1.jpg and  1000-v2.jpg. Save the files in the *C:\images* folder on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance.

-   Verify that table **27 Item** has a field that is called **Picture** and has the data type **MediaSet**.

   This is field on which you will add the images. If the field is not present, then add it.

With these tasks in place, you can add and run the following AL code to import the images. For this code example, create a codeunit and add the code to the OnRun trigger.  

The code requires that you create the following variables and text constant:  

|  Variable name  |  DataType  |  Subtype  |  
|-----------------|------------|-----------|  
|itemRec|Record|Item|  
|fileName|Text||  
|inStreamObject|InStream||  
|importFile|File||
|count|Integer||  
|mediasetId|GUID||  

|  Text constant name  |  ConstValue  |  
|----------------------|--------------|  
|Text000|The files have been imported. Item %1 has %2 pictures in MediaSet: %3|

```  
itemRec.GET('1000');

fileName := 'C:\images\1000-v1.jpg';
importFile.OPEN(fileName);  
importFile.CREATEINSTREAM(inStreamObject);  
itemRec.Picture.IMPORTSTREAM(inStreamObject, 'Demo image for item ' + FORMAT(itemRec."No."));  
itemRec.MODIFY;  
importFile.CLOSE;  

fileName := 'C:\images\1000-v2.jpg';
importFile.OPEN(fileName);  
importFile.CREATEINSTREAM(inStreamObject);  
itemRec.Picture.IMPORTSTREAM(inStreamObject, 'Demo image for item ' + FORMAT(itemRec."No."));  
itemRec.MODIFY;  
importFile.CLOSE;

count := (itemRec.Picture.COUNT);
mediasetId := itemRec.Picture.MEDIAID;  
MESSAGE(Text000,itemRec."No.",count,mediasetId);  
```  

If you run system table **2000000181 Tenant Media**, you should see the new images in the list.

## See Also  
 [Working With Media on Records](../devenv-working-with-media-on-records.md)  
 [IMPORTFILE Method \(MediaSet\)](devenv-IMPORTFILE-Method-MediaSet.md)   
 [MediaSet Data Type](../datatypes/devenv-MediaSet-Data-Type.md)
