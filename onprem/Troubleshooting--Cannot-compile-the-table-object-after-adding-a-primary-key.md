---
title: "Troubleshooting: Cannot compile the table object after adding a primary key"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 50de6d90-2b9b-4e3a-90a2-6bde5648259d
caps.latest.revision: 2
---
# Troubleshooting: Cannot compile the table object after adding a primary key
After adding a primary key to a table, you cannot compile the table object.  
  
## Resolution  
 This error can occur when the record size is close to the maximum value. The maximum record size in [!INCLUDE[navnow](includes/navnow_md.md)] is 8000 bytes. To resolve this issue, limit the number of primary keys.  
  
## See Also  
 [How to: Define Primary and Secondary Keys](How-to--Define-Primary-and-Secondary-Keys.md)