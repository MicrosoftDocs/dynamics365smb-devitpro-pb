---
title: "ExternalSchema Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# ExternalSchema Property
> **Version**: _Available from runtime version 1.0._

Specifies the name of the database schema of the external database.

## Applies to
-   Table


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

The name of the schema of the external database.  

## Syntax

```AL
ExternalSchema = 'schemaName';
```
 
## Remarks  

This property appears when you specify **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  
  
## See Also  

[TableType Property](devenv-tabletype-property.md)   
[ExternalSchema Property](devenv-externalschema-property.md)   
[Name Property](devenv-name-property.md)   
[Properties](devenv-properties.md)   
