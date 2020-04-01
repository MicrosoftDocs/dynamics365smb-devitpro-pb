---
title: "ExternalType Property"
description: Specifies the name of the orginal table in the external database. 
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ExternalType Property
Specifies the data type of the corresponding field data type in the external database table. For example, tables in Dynamics 365 Sales database.

## Applies To  

- Fields 

## Property Value

- String  
- Picklist

> [!NOTE]  
> The field values are dependent on the providers for the TableType to interpret the process. The different providers use it differently. For example, MicrosoftGraph vs CDS. 

## Syntax
```
ExternalType = 'String';
```

## Remarks  
This property is used when you specify **CDS**, **MicrosoftGraph** or **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and [!INCLUDE[navnow_md](../includes/navnow_md.md)] database.  

## See Also  
[TableType Property](devenv-tabletype-property.md)  
[ExternalSchema Property](devenv-externalschema-property.md)  
[Name Property](devenv-name-property.md)  
[Properties](devenv-properties.md)  