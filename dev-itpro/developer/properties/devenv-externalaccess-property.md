---
title: "ExternalAccess Property"
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
# ExternalAccess Property
> **Version**: _Available from runtime version 1.0._

Specifies the type of access to the original table field in the external database.

## Applies to
-   Table Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Full**|Allows the full access to the external database.|
|**Insert**|Allows the insert access to the table fields in the external database.|
|**Modify**|Allows the Modify access to the external database.|
|**Read**|Allows the read-only access to the external database.|

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
[Name Property](devenv-name-property.md)   
[Properties](devenv-properties.md)   