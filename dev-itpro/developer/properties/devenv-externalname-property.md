---
title: "ExternalName Property"
ms.custom: na
ms.date: 06/01/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ddde23c8-cc94-4b5b-a5d7-83595ea4943a
caps.latest.revision: 2
author: SusanneWindfeldPedersen
---

 

# ExternalName Property
Specifies the name of the original table in the external database.  

 Specify this property if the original name is different from the name that you specify in the **Name** property. This means that you can use a different name for the table in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  

## Applies To  

-   Tables  

## Property Value  
 The name of the table in the external database.  

## Remarks  
 This property appears when you specify **CRM** or **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  

## See Also  
 [TableType Property](devenv-tabletype-property.md)   
 [ExternalSchema Property](devenv-externalschema-property.md)   
 [Name Property](devenv-name-property.md)   
 [Properties](devenv-properties.md)   