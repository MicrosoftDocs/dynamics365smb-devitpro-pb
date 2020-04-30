---
title: "ExternalName Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ExternalName Property
Specifies the name of the original table in the external database.  

Specify this property if the original name is different from the name that you specify in the **Name** property. This means that you can use a different name for the table in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  

## Applies To  

- Tables  

## Property Value  
The name of the table in the external database.  

## Syntax
```
ExternalName = 'organization';
```

## Remarks  
This property appears when you specify **CDS** or **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  

## See Also  
[TableType Property](devenv-tabletype-property.md)   
[ExternalSchema Property](devenv-externalschema-property.md)   
[Name Property](devenv-name-property.md)   
[Properties](devenv-properties.md)   