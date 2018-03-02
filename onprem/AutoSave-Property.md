---
title: "AutoSave Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7ed49a99-f761-4da3-bd68-18e15ea80c7b
caps.latest.revision: 12
---
# AutoSave Property
Sets whether imported records are automatically written to the table.  
  
## Applies To  
 Data items in XMLports  
  
## Property Value  
 **Yes** if the record is written to the table automatically; otherwise, **No**. The default value is **Yes**.  
  
## Remarks  
 This property applies to new records that are inserted into the table and existing records that are modified.  
  
 If AutoSave is set to **No**, then an imported record is not automatically written to the appropriate table. To insert or modify records manually, add code to the [OnBeforeInsertRecord Trigger](OnBeforeInsertRecord-Trigger.md) and the [OnBeforeModifyRecord Trigger](OnBeforeModifyRecord-Trigger.md). For example, set the AutoSave property to **No**, create a new function that evaluates the records, does some calculations, or retrieves additional data, and then call your new function from the OnBeforeInsertRecord and OnBeforeModifyRecord triggers. Use the OnAfterInitRecord trigger if you must evaluate the records before inserting or modifying them, or if you want to calculate or retrieve additional data before inserting or modifying the record.  
  
 If a record already exists and AutoSave is set to **Yes**, then the values of the [AutoReplace Property](AutoReplace-Property.md) and the [AutoUpdate Property](AutoUpdate-Property.md) determine whether the imported record overwrites or updates the existing record. If the record already exists and the values of the AutoReplace property and the AutoUpdate property are both **No**, then an error occurs.  
  
## See Also  
 [AutoReplace Property](AutoReplace-Property.md)   
 [AutoUpdate Property](AutoUpdate-Property.md)