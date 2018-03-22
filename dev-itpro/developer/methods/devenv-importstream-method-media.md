---
title: "IMPORTSTREAM Method (Media)"
ms.custom: na
ms.date: 04/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: dynamics365-financials
---

 

# IMPORTSTREAM Method (Media)
Adds a media type \(MIME\), such as jpeg image, from an InStream object to a **Media** data type field of a record for displaying the media in the client. The media file is imported to the application database and a reference to the media is included in the **Media** data type field.  

## Syntax  

```  
[Guid := ]Record.MediaField.IMPORTSTREAM(InStream, Description[, MimeType][, FileName])  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that you want to add the media to.  

*MediaField*  
Type: Media

 Specifies the field that you want to add the media to. This field must be a **Media** data type.

 *InStream*  
 Type: InStream  

 Specifies the InStream object that contains the media that you want to use on the record.  

 *Description*  
 Type: Text  

 Specifies text that can be used in the client to describe the media file.  

 *MimeType*  
 Type: Text  

[!INCLUDE[mimetype](../includes/mimetype_md.md)]

 *FileName*  
 Type: Text  

Assigns a name to the media. You can use this parameter to give the media a user-friendly name to which you can code against. The text is stored in the **File Name** column of the **2000000184 Tenant Media** table. 

## Property Value/Return Value  
 Type: GUID  

 Specifies the unique ID that is assigned to the imported media object in the database table field. You can also retrieve the ID by using the [MEDIAID Method \(Media\)](devenv-MEDIAID-Method-Media.md).  

## Remarks  
 You can use this method to import media into the database, and associate the media with a record. For example, you can upload an image of all items in table **27 Item**. When media is imported, the object is stored in the system table **2000000184 Tenant Media** of the application database.  

If you import media on a record that already has a media object, and a modify operation is performed, the original media object will be permanently deleted from the database. However, if there are other rows in the same table that reference the original media object from the same field index, the original media object is not deleted from the database. This behavior allows a row to be copied.

## Example  
**Preparation:**   
To support the example code that follows, create the following objects:

-   A table that is named **My Items** and has the following characteristics (as a minimum):
    -   An **Integer** data type field that has the name **No.**.

        This field is used to give an item a number.
    -   A **Media** data type field that has the name **Image**.

        This is the field on which you will import the media file.
    - A field group that has the name **Brick** and includes the **No.** and **Image** fields.

        The field group is used to display the image on a page in the brick layout. <!-- LinksFor more information, see [How to: Display Data as Bricks](How-to-Display-Data-as-Bricks.md). -->
-   A page that is named **My Items** and has the following characteristics:

    -   List type page that uses the **My Items** table as its source.
    -   A repeater control that contains the fields of the **My Items** table.

        >[!NOTE]
        >It is not necessary to include the **Media** data type field on the page.

    Use the page to add one or more items to the table, assigning each item a number like 1,2,3, and so on.

-   JPEG image files for one or more items in the **My Items** table.
    -   Give each file a name that corresponds to an item number in the table, such as 1.jpg, 2.jpg, 3.jpg, and so on.
    -   Save the files in the *C:\images* folder on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].

**Code**  
With the objects in place, you can add and run the following AL code to import the images. For this code example, create a codeunit and add the code to the **OnRun** trigger of the codeunit.

This code iterates over records in the **My Items** table. For each record, it looks in the *C:\\images* folder for a file whose name matches the **No.** field of the record. If there is a match the file, an InStream object is created for the file, the media is imported into the record, and a confirmation message is returned.

The code requires that you create the following variable and text constants:

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|myItemRec|Record|My Items|   
|fileName|Text||  
|importFile|File||
|imageInStream|InStream||  
|imageID|GUID||  

|Text constant name|ConstValue|
|-------------------|--------------|
|Text000|An image with the following ID has been imported on item %1: %2|

```  
IF  myItemRec.FINDFIRST() THEN  
BEGIN  
  REPEAT  
    fileName := 'C:\images\' + FORMAT(myItemRec."No.") + '.jpg';  

    IF FILE.EXISTS(fileName) THEN BEGIN  
        importFile.OPEN(fileName);  
        importFile.CREATEINSTREAM(imageInstream);  
        imageID := myItemRec.Image.IMPORTSTREAM(imageInstream, 'Demo image for item ' + FORMAT( myItemRec."No."), '', fileName);  
        myItemRec.MODIFY;  
        MESSAGE(Text000, myItemRec."No.", imageID);  
        importFile.CLOSE;
    END;  
  UNTIL myItemRec.NEXT < 1;  
END;  
```  

## See Also  
 [Working With Media on Records](../devenv-working-with-media-on-records.md)  
 [IMPORTFILE Method \(Media\)](devenv-IMPORTFILE-Method-Media.md)   
 [IMPORTFILE Method \(MediaSet\)](devenv-IMPORTFILE-Method-MediaSet.md)   
 [IMPORTSTREAM Method \(MediaSet\)](devenv-IMPORTSTREAM-Method-MediaSet.md)   
 [MediaSet Data Type](../datatypes/devenv-MediaSet-Data-Type.md)
