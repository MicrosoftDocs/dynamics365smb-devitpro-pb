---
title: "ExternalAccess Property"
description: "Specifies the type of access to the original table field in the external database."
ms.author: solsen
ms.custom: na
ms.date: 12/08/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExternalAccess Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the type of access to the original table field in the external database.

## Applies to
-   Table Field

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Full**|runtime version 1.0|Allows the full access to the external database.|
|**Insert**|runtime version 1.0|Allows the insert access to the table fields in the external database.|
|**Modify**|runtime version 1.0|Allows the Modify access to the external database.|
|**Read**|runtime version 1.0|Allows the read-only access to the external database.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
ExternalAccess = Full;
```

## Remarks

This property appears when you specify **CDS** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and [!INCLUDE[navnow_md](../includes/navnow_md.md)] database.  

## See Also  

[TableType Property](devenv-tabletype-property.md)   
[ExternalSchema Property](devenv-externalschema-property.md)   
[Name Property](./devenv-properties.md)   
[Properties](devenv-properties.md)