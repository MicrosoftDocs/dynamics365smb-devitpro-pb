---
title: "DataPerCompany Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataPerCompany Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that indicates whether the table data applies to all companies in the database or only the current company.

## Applies to
-   Table

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

**True** if data is available only to this company; otherwise, **false**. The default value is **true**.  

## Syntax

```AL
DataPerCompany = true;
```

## Remarks

Whether the value of this property can be changed is dependent on if the table holds data or not.

The value `true` means that data is available to the current company only, this is the default value. You can only set this property to `true` if the table is empty in all companies, or if the table holds data in only one company. You cannot change the value to `false` if there is data in the table in any of the companies. 

## See Also  

[Properties](devenv-properties.md)  
[DataSource Property](devenv-datasource-property.md)  