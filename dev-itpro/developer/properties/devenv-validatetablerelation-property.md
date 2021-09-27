---
title: "ValidateTableRelation Property"
description: "Sets whether to validate a table relationship."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# ValidateTableRelation Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether to validate a table relationship.

## Applies to
-   Table Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

**True** if you want to validate the table relationship; otherwise, **false**. The default is **true**.  

## Syntax

```AL
ValidateTableRelation = false;
```
  
## Remarks

For fields, use this property to determine whether to validate the user's entry based on the information already in the table set up through the [TableRelation Property](devenv-tablerelation-property.md) property.  
  
If you want to let users enter any value without validating the entry, then choose **false**. For example, on the item card, you can specify the vendor that you typically purchase the item from. Set this property to **false** to allow users to select a vendor that may not already be in the **Vendor** table.  
  
If you set the ValidateTableRelation property to **false**, then you should also set the TestTableRelation property to **false**. Otherwise, a database test on the field relations in a database may fail.  
  
## See Also  

[TestTableRelation Property](devenv-testtablerelation-property.md)