---
title: "Key Properties"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 801dacf4-db90-4457-84cf-272cf9262dc7
caps.latest.revision: 12
manager: edupont
---
# Key Properties
The keys associated with a table have properties that describe their behavior, just as tables and fields do. When you create a key, [!INCLUDE[navnow](includes/navnow_md.md)] automatically suggests a number of default values for these properties. Depending on the purpose of the key, you will sometimes want to change these default values.  

 [!INCLUDE[navnow](includes/navnow_md.md)] contains the following properties for keys.  

|Property Name|Use|  
|-------------------|---------|  
|[Enabled Property](Enabled-Property.md)|Determines whether the system will maintain an index for the key. You cannot use a key unless it is enabled.|  
|[Key Property](Key-Property.md)|Defines the key.|  
|[SumIndexFields Property](SumIndexFields-Property.md)|Determines the fields for which the system will maintain a SumIndex.|  
|[MaintainSQLIndex Property](MaintainSQLIndex-Property.md)|Determines whether a SQL Server index corresponding to the [!INCLUDE[navnow](includes/navnow_md.md)] key should be created.|  
|[MaintainSIFTIndex Property](MaintainSIFTIndex-Property.md)|Determines whether SIFT structures should be created in SQL Server to support the corresponding SumIndexFields for the [!INCLUDE[navnow](includes/navnow_md.md)] key.|  
|[Clustered Property](Clustered-Property.md)|Sets a value that indicates whether the index is clustered.|  
|[SQLIndex Property](SQLIndex-Property.md)|Sets the actual fields that are used in the corresponding index on SQL Server.|  

## See Also  
 [How to: View or Modify Properties on a Key](How-to--View-or-Modify-Properties-on-a-Key.md)   
 [Table Keys](Table-Keys.md)
