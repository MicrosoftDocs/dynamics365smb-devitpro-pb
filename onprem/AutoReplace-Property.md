---
title: "AutoReplace Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6a09a5b0-1106-45a4-83b5-367138884339
caps.latest.revision: 11
---
# AutoReplace Property
Sets whether imported records automatically replace existing records with the same primary key.  
  
## Applies To  
 Data items in XMLports.  
  
## Property Value  
 **Yes** if the records are replaced; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 If a record with the same primary key is found in the database, then the record is initialized with the initial value for each field and then populated with the values in the imported record. Any field in the record that is not present in the imported record retains its initial value. For more information about initial values, see [InitValue Property](InitValue-Property.md).  
  
> [!WARNING]  
>  If this property is set to **Yes**, then the [AutoUpdate Property](AutoUpdate-Property.md) has no effect.  
  
## See Also  
 [AutoUpdate Property](AutoUpdate-Property.md)   
 [AutoSave Property](AutoSave-Property.md)