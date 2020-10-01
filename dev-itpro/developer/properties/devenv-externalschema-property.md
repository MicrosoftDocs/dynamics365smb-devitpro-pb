---
title: "ExternalSchema Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ExternalSchema Property
Specifies the name of the database schema of the external database.  
  
## Applies to  
  
- Tables  
  
## Property Value  
The name of the schema of the external database.  

## Syntax
```
ExternalSchema = 'schemaName';
```
 
## Remarks  
This property appears when you specify **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  
  
## See Also  
[TableType Property](devenv-tabletype-property.md)   
[ExternalSchema Property](devenv-externalschema-property.md)   
[Name Property](devenv-name-property.md)   
[Properties](devenv-properties.md)   
