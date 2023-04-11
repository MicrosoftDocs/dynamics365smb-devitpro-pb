---
title: "Key Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e6241267-0114-4bb6-8994-918a18dcaa62
caps.latest.revision: 11
---
# Key Virtual Table
The **Key** virtual table contains information about the keys that are defined in each table in the database.  

The **Key** virtual table contains the following fields. These fields cannot be modified.

|Field|Description|  
|-----------|-----------------|  
|**TableNo**|The ID number for the table.|  
|**No.**|The number of the key.|  
|**TableName**|The name of the table.|  
|**Key**|The fields that make up the key.|  
|**SumIndexField**|The SumIndexFields that are defined for this key.|  
|**SQLIndex**|The actual fields that have been defined in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] and are used in the corresponding index on SQL Server instead of those defined in the key.|  
|**Enabled**|Whether the index is enabled.|  
|**MaintainSQLIndex**|Whether the MaintainSQLIndex property has been activated.|  
|**MaintainSIFTIndex**|Whether the MaintainSIFTIndex property has been activated.|  
|**Clustered**|Whether the key is clustered.|  

 You must create a tabular-type page to access the **Key** virtual table. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md).  

## See Also  
 [Virtual Tables](Virtual-Tables.md)
