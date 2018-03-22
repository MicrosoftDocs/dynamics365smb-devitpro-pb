---
title: "ExternalAccess Property"
ms.custom: na
ms.date: 02/09/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ddde23c8-cc94-4b5b-a5d7-83595ea4943a
caps.latest.revision: 2
author: SusanneWindfeldPedersen
---

 

# ExternalAccess Property
This property is specific to Dynamics 365 for Sales. The ExternalAccess property specifies the access to the underlying CRM entity when Dynamics 365 for Sales tables are generated using the cmdlet. 

## Applies To  

-   Fields  

## Property Values  

The ExternalAccess Property sets the access level as described in the table below:

|Property value| Description|
|------|-----------|
|Full  |Allows the full access to the external database.|
|Insert|Allows the insert access to the table fields in the external database.|
|Modify|Allows the Modify access to the external database. |
|Read  |Allows the read-only access to the external database.|

## Remarks  
 This property appears when you specify **CRM** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and [!INCLUDE[navnow_md](../includes/navnow_md.md)] database.  

## See Also  
 [TableType Property](devenv-tabletype-property.md)   
 [ExternalSchema Property](devenv-externalschema-property.md)   
 [Name Property](devenv-name-property.md)   
 [Properties](devenv-properties.md)   