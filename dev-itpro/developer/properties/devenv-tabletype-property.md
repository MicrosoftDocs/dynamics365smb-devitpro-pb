---
title: "TableType Property"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: bfdf1b47-b009-48b3-8b46-0612d66e0162
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

 

# TableType Property
Specifies the table type.  

## Applies To  

-   Tables  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**Normal**|Specifies the table as a normal table in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. This is the default value.|  
|**CRM**|Specifies the table as an integration table for integrating [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] with [!INCLUDE[crm](../includes/crm_md.md)]. The table is typically based on an entity in [!INCLUDE[crm](../includes/crm_md.md)], such as the Accounts entity.|  
|**ExternalSQL**|Specifies the table as a table or view in SQL Server that is not in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.|  
|**Exchange**|This is for internal use only.|
|**MicrosoftGraph**|This is for internal use only.|

## Remarks  
 Tables that are marked as **CRM** or **ExternalSQL** are considered to external tables that are not managed by [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. <!-- For more information, see [External Tables](External-Tables.md).  -->

> [!IMPORTANT]  
>  We advise against creating tables of type CRM manually. Instead, use the integration mapping functionality.
<!-- For more information, see [Introduction to Dynamics 365 for Sales Integration Customization in Dynamics NAV](Introduction-to-Dynamics-CRM-Integration-Customization-in-Dynamics-NAV.md).  
 -->
## See Also  
 [Properties](devenv-properties.md)
<!--  [External Tables](External-Tables.md)   
 [Table Designer](uiref/-$-S_2102-Table-Designer-$-.md)  -->
