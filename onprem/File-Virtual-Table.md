---
title: "File Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 80425fe1-fd65-45db-83fc-5801bf9e7dec
caps.latest.revision: 11
---
# File Virtual Table
The **File** virtual table gives you an overview of the files in a directory on your disk. The **File** virtual table contains the following fields.  
  
|Field|Description|  
|-----------|-----------------|  
|**Path**|The filter on the **Path** field determines which directory is shown.|  
|**IsFile**|The value Yes indicates that the entry is a file; the value No indicates that the entry is a directory.|  
|**Name**|The name of the file or directory.|  
|**Size**|The size of the file in bytes.|  
|**Date**|The date the file was last modified.|  
|**Time**|The time the file was last modified.|  
|**Data**|A BLOB field with the contents of the file.|  
  
 You must create a tabular-type page to access the **File** virtual table.  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
