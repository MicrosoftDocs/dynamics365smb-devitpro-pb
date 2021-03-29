---
title: "LinkTableForceInsert Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# LinkTableForceInsert Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether data from the linked table is forcibly modified or inserted into a table to prevent an error from being generated.

## Applies to
-   Xml Port Table Element

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

**True** if you want to forcibly insert or modify data; otherwise, **false**. The default is **true**.  

## Syntax

```AL
LinkTableForceInsert = false;
```
  
## Remarks
 
This property works in combination with the [LinkFields Property](devenv-linkfields-property.md) and the [LinkTable Property](devenv-linktable-Property.md).  
  
Setting this property to **true** will forcibly insert or modify data from the linked table and run the [OnAfterInitRecord Trigger](../triggers/devenv-onafterinitrecord-trigger.md) on the main table.  
  
This feature is useful if you have a header to line relationship in your XML document. The table and the header information must be inserted before you can insert the line information. As a result, you can use this property to ensure that the header information is inserted before the XMLport starts reading the line information.  
  
## See Also

[LinkFields Property](devenv-linkfields-property.md)   
[LinkTable Property](devenv-linktable-Property.md)