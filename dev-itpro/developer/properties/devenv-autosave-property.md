---
title: "AutoSave Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AutoSave Property
> **Version**: _Available from runtime version 1.0._

Sets whether imported records are automatically written to the table.

## Applies to
-   Xml Port Table Element


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  
 **True** if the record is written to the table automatically; otherwise, **false**. The default value is **true**.  

## Syntax
```AL
AutoSave = false;
```

## Remarks  
This property applies to new records that are inserted into the table and existing records that are modified.  
  
If AutoSave is set to **false**, then an imported record is not automatically written to the appropriate table. To insert or modify records manually, add code to the [OnBeforeInsertRecord Trigger](../triggers/devenv-onbeforeinsertrecord-trigger.md) and the [OnBeforeModifyRecord Trigger](../triggers/devenv-onbeforemodifyrecord-trigger.md). For example, set the AutoSave property to **false**, create a new method that evaluates the records, does some calculations, or retrieves additional data, and then call your new method from the OnBeforeInsertRecord and OnBeforeModifyRecord triggers. Use the OnAfterInitRecord trigger if you must evaluate the records before inserting or modifying them, or if you want to calculate or retrieve additional data before inserting or modifying the record.  
  
If a record already exists and AutoSave is set to **true**, then the values of the [AutoReplace Property](devenv-autoreplace-property.md) and the [AutoUpdate Property](devenv-autoupdate-property.md) determine whether the imported record overwrites or updates the existing record. If the record already exists and the values of the AutoReplace property and the AutoUpdate property are both **false**, then an error occurs.  
  
## See Also  
[AutoReplace Property](devenv-autoreplace-property.md)   
[AutoUpdate Property](devenv-autoupdate-property.md)