---
title: "OptionOrdinalValues Property"
description: Specifies the list of option values when you set the ExternalType property for synchronizing the database with external tables.
ms.custom: na
ms.date: 02/09/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c77a75d8-8bff-42fd-8b1a-4eaf745be70f
caps.latest.revision: 10
author: SusanneWindfeldPedersen
---

 

# OptionOrdinalValues Property
Specifies the list of ordinal values and the position of the option member values in the external database. You can set this property, if the **ExternalType property** is set to Picklist. 

## Applies to  

-   Fields 

## Property values
The position of the option members value in the external database. You can set -1, 1, 2, but you cannot set the value to 0. 

## Remarks  
This property is used when you specify **CRM** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  

## See Also  
[Properties](devenv-properties.md)  
[Table Properties](devenv-table-properties.md)  

