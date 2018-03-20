---
title: "Key Properties"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 801dacf4-db90-4457-84cf-272cf9262dc7
caps.latest.revision: 12
author: SusanneWindfeldPedersen
---

 

# Key Properties
The keys associated with a table have properties that describe their behavior, just as tables and fields do. When you create a key, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] automatically suggests a number of default values for these properties. Depending on the purpose of the key, you will sometimes want to change these default values.  

 [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] contains the following properties for keys.  

|Property Name|Use|  
|-------------------|---------|  
|[Enabled Property](devenv-enabled-property.md)|Determines whether the system will maintain an index for the key. You cannot use a key unless it is enabled.|  
|[Key Property](devenv-key-property.md)|Defines the key.|  
|[SumIndexFields Property](devenv-sumindexfields-property.md)|Determines the fields for which the system will maintain a SumIndex.|  
|[MaintainSQLIndex Property](devenv-maintainsql-index-property.md)|Determines whether a SQL Server index corresponding to the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] key should be created.|  
|[MaintainSIFTIndex Property](devenv-maintainsift-index-property.md)|Determines whether SIFT structures should be created in SQL Server to support the corresponding SumIndexFields for the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] key.|  
|[Clustered Property](devenv-clustered-property.md)|Sets a value that indicates whether the index is clustered.|  
|[SQLIndex Property](devenv-sql-index-property.md)|Sets the actual fields that are used in the corresponding index on SQL Server.|  

## See Also  
 <!-- [How to: View or Modify Properties on a Key](How-to--View-or-Modify-Properties-on-a-Key.md)   -->
 [Table Keys](../devenv-table-keys.md)
