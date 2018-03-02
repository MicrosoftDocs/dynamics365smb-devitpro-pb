---
title: "LinkTableForceInsert Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 695880ad-2a9c-489a-a058-a586089826eb
caps.latest.revision: 9
manager: edupont
---
# LinkTableForceInsert Property
Sets whether data from the linked table is forcibly modified or inserted into a table to prevent an error from being generated.  
  
## Applies To  
 XMLports  
  
## Property Value  
 **Yes** if you want to forcibly insert or modify data; otherwise, **No**. The default is **Yes**.  
  
## Remarks  
 This property works in combination with the [LinkFields Property](LinkFields-Property.md) and the [LinkTable Property](LinkTable-Property.md).  
  
 Setting this property to **Yes** will forcibly insert or modify data from the linked table and run the [OnAfterInitRecord Trigger](OnAfterInitRecord-Trigger.md) on the main table.  
  
 This feature is useful if you have a header to line relationship in your XML document. The table and the header information must be inserted before you can insert the line information. As a result, you can use this property to ensure that the header information is inserted before the XMLport starts reading the line information.  
  
## See Also  
 [LinkFields Property](LinkFields-Property.md)   
 [LinkTable Property](LinkTable-Property.md)