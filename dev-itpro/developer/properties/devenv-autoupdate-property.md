---
title: "AutoUpdate Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 49de51bb-b82f-42be-964e-aadd40e3b331
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---

# AutoUpdate Property
Sets whether a record in the database with the same primary key as the record in the imported XMLport is updated with values from the imported record.  

## Applies to  
Table elements in XMLports.  

## Property Value  
 **True** if the records are updated; otherwise, **false**. The default value is **true**.  

## Syntax
```
AutoUpdate = true;
```

## Remarks  
When **AutoUpdate** is set to **true**, if a record exists in the database with the same primary key as a record in the imported XMLport, then the record in the database is updated with the values in the record from the XMLport. Fields that are not defined in the record from the XMLport remain the same in the record in the database.  

Set **AutoUpdate** to **true** when you import a file with partial information. For example, you can use this property if you create new prices for an item list in an external file where this file only contains item numbers and prices. In this case, you would want to update the price field, while retaining the information in the other fields.  

> [!WARNING]  
> If this property is set to **true**, then the [AutoReplace Property](devenv-autoreplace-property.md) has no effect.  

## See Also  
[AutoReplace Property](devenv-autoReplace-property.md)   
[AutoSave Property](devenv-autosave-property.md)
