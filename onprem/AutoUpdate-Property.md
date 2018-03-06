---
title: "AutoUpdate Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 49de51bb-b82f-42be-964e-aadd40e3b331
caps.latest.revision: 11
---
# AutoUpdate Property
Sets whether a record in the database with the same primary key as the record in the imported XMLport is updated with values from the imported record.  
  
## Applies To  
 Data items in XMLports.  
  
## Property Value  
 **Yes** if the records are updated; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 When **AutoUpdate** is set to **Yes**, if a record exists in the database with the same primary key as a record in the imported XMLport, then the record in the database is updated with the values in the record from the XMLport. Fields that are not defined in the record from the XMLport remain the same in the record in the database.  
  
 Set **AutoUpdate** to **Yes** when you import a file with partial information. For example, you can use this property if you create new prices for an item list in an external file where this file only contains item numbers and prices. In this case, you would want to update the price field, while retaining the information in the other fields.  
  
> [!WARNING]  
>  If this property is set to **Yes**, then the [AutoReplace Property](AutoReplace-Property.md) has no effect.  
  
## See Also  
 [AutoReplace Property](AutoReplace-Property.md)   
 [AutoSave Property](AutoSave-Property.md)