---
title: "AutoUpdate property"
description: "Sets whether a record in the database with the same primary key as the record in the imported XmlPort is updated with values from the imported record."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AutoUpdate Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether a record in the database with the same primary key as the record in the imported XmlPort is updated with values from the imported record.

## Applies to
-   Xml Port Table Element

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  
 **True** if the records are updated; otherwise, **false**. The default value is **false**.  

## Syntax
```AL
AutoUpdate = true;
```

## Remarks  
When **AutoUpdate** is set to **true**, if a record exists in the database with the same primary key as a record in the imported XMLport, then the record in the database is updated with the values in the record from the XMLport. Fields that are not defined in the record from the XMLport remain the same in the record in the database.  

Set **AutoUpdate** to **true** when you import a file with partial information. For example, you can use this property if you create new prices for an item list in an external file where this file only contains item numbers and prices. In this case, you would want to update the price field, while retaining the information in the other fields.  

> [!WARNING]  
> If this property is set to **true**, then the [AutoReplace Property](devenv-autoreplace-property.md) has no effect.  

## Related information  
[AutoReplace Property](devenv-autoReplace-property.md)   
[AutoSave Property](devenv-autosave-property.md)
