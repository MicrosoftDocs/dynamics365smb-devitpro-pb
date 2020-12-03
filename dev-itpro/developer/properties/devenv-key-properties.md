---
title: "Key Properties"
ms.custom: na
ms.date: 11/10/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Key Properties

The keys associated with a table have properties that describe their behavior, just as tables and fields do. When you create a key, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] automatically suggests a number of default values for these properties. Depending on the purpose of the key, you will sometimes want to change these default values.  

 [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] contains the following properties for keys.  

|Property Name|Use|  
|-------------------|---------|  
|[Enabled](devenv-enabled-property.md)|Determines whether the system will maintain any indexes for the key. You cannot use a key unless it is enabled.|  
|[Key](devenv-key-property.md)|Defines the key name and fields.|  
|[SumIndexFields](devenv-sumindexfields-property.md)|Determines the fields for which the system will maintain a SumIndex.|  
|[MaintainSQLIndex](devenv-maintainsql-index-property.md)|Determines whether a SQL Server index corresponding to the fields in the key should be created.|  
|[MaintainSIFTIndex](devenv-maintainsift-index-property.md)|Determines whether SIFT indexes (indexed views) structures should be created in SQL Server to support the corresponding SumIndexFields for the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] key.|  
|[Clustered](devenv-clustered-property.md)|Sets a value that indicates whether the key defines the clustered index for the table.|  
|[SQLIndex](devenv-sql-index-property.md)|Sets the actual fields and field order that are used in the corresponding index on SQL Server.|  
|[Unique](devenv-unique-property.md)|Sets whether the value of a key must be unique.| 

## See Also  

[Table Keys](../devenv-table-keys.md)
