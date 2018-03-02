---
title: "WRITE Method (BigText)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 41504b4f-3023-4be1-a180-04bc01b56c05
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# WRITE Method (BigText)
Streams a BigText object to a BLOB field in a table.  
  
## Syntax  
  
```  
  
[Ok := ] BigText.WRITE(OutStream)  
```  
  
#### Parameters  
 *BigText*  
 Type: BigText  
  
 The BigText that you want to write to a BLOB field.  
  
 *OutStream*  
 Type: OutStream  
  
 The stream to which you write a BigText.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 This optional return value specifies whether the write transaction was successful.  
  
## Remarks  
 To delete the content in a BigText variable, use the CLEAR method.  
  
```  
CLEAR(BigText)  
```  
  
## Example  
 This example shows how to stream a BigText to a BLOB field in a table.  
  
 This example requires that you define the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Bstr|BigText|Not applicable|  
|ItemRec|Record|Item|  
|Ostream|OutStream|Not applicable|  
  
```  
Bstr.ADDTEXT('This is the text string that we want to store in a BLOB field.');  
ItemRec.Picture.CREATEOUTSTREAM(Ostream);  
Bstr.WRITE(Ostream);  
ItemRec.INSERT;  
```  
  
## See Also  
 [BigText Data Type](../datatypes/devenv-BigText-Data-Type.md)