---
title: "EXPORTSTREAM Function (Media)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# EXPORTSTREAM Function (Media)
Export the current media object \(such as a JPEG image\) that is used on record to an OUTSTREAM object.  

The OUTSTREAM object can be created from a BLOB field, a FILE or from a .NET Framework interoperability object. In the record, the media is referenced in a **Media** data type field.  

## Syntax  

```  
[Ok := ]Record.MediaField.EXPORTSTREAM(OutStream)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 Specifies the record that includes the media.  

 Media  
 Type: Media  

 Specifies the **Media** data type field of the record that includes the media.  

 *OutStream*  
 Type: OutStream  

 Specifies the OutStream object that is created by the object that will receive the media content.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the media was successfully exported; otherwise, **false**.  

## Remarks  
 The OutStream object must be a valid and writeable stream that is created by the receiving object. The EXPORTSTREAM function does not create the OutStream object. It only uses the object for writing data.  

## Example  
 This example uses the EXPORTSTREAM to iterate over a sample table named **My Items** table and export any media that is used on records to an OutStream that is created on a file object.  

 This example assumes that the **My Item** table contains a **Media** data type field that is named **Image**, and that you have already imported some media on records. For information about importing media, see [IMPORTFILE Function \(Media\)](IMPORTFILE-Function--Media-.md) or [IMPORTSTREAM Function \(Media\)](IMPORTSTREAM-Function--Media-.md).  

 The example code requires that you create the following variables and text constant:  

|  Variable name  |  DataType  |  Subtype  |  
|-----------------|------------|-----------|  
|myItemRec|Record|My Items|  
|fileName|Text||  
|exportFile|File||  
|dataOutStream|OutStream||  
|count|Integer| |


|  Text constant name  |  ConstValue  |
|----------------------|--------------|
|Text000|%1 media files were exported.|

```  
IF myItemRec.FINDFIRST() THEN  
BEGIN  
  REPEAT  
    IF myItemRec.Image.HASVALUE THEN
    BEGIN
      fileName := 'C:\images\export\' + 'ItemPictureFromStream' + FORMAT(myItemRec."No.") + '.jpg';  
      exportFile.CREATE(fileName);  
      exportFile.CREATEOUTSTREAM(dataOutStream);
      myItemRec.Image.EXPORTSTREAM(dataOutStream);
      count := count + 1;  
      exportFile.CLOSE;
    END  
  UNTIL myItemRec.NEXT < 1;
  MESSAGE(Text000, count);
END;  

```  

## See Also  
 [Working With Media on Records](Working-With-Media-on-Records.md)  
 [IMPORTSTREAM Function \(Media\)](IMPORTSTREAM-Function--Media-.md)   
 [IMPORTFILE Function \(MediaSet\)](IMPORTFILE-Function--MediaSet-.md)   
 [IMPORTSTREAM Function \(MediaSet\)](IMPORTSTREAM-Function--MediaSet-.md)   
 [MediaSet Data Type](MediaSet-Data-Type.md)   
 [EXPORTFILE Function \(Media\)](EXPORTFILE-Function--Media-.md)
