---
title: "ExternalName Property"
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
# ExternalName Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the name of the original table in the external database.

Specify this property if the original name is different from the name that you specify in the Name property. This means that you can use a different name for the table.

## Applies to
-   Table
-   Table Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  
The name of the table in the external database.  

## Syntax

```AL
ExternalName = 'organization';
```

## Remarks

This property appears when you specify **CDS** or **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  

## See Also

[TableType Property](devenv-tabletype-property.md)   
[ExternalSchema Property](devenv-externalschema-property.md)   
[Name Property](./devenv-properties.md)   
[Properties](devenv-properties.md)