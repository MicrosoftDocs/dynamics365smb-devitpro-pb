---
title: "Drive Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 93d2b178-6675-4a16-accf-eb00798ee818
caps.latest.revision: 8
---
# Drive Virtual Table
The **Drive** virtual table gives you an overview of the logical drives on your computer. The **Drive** virtual table contains the following fields.  
  
|Field|Description|  
|-----------|-----------------|  
|**DriveName**|The name of the drive, such as drive C or D.|  
|**Removable**|Indicates whether the disk is removable \(a CD-ROM or similar\) or a hard disk.|  
|**SizeInKilobyte**|The total size of the disk.|  
|**FreeInKilobyte**|The amount of free space on the disk.|  
  
 You must create a tabular-type page to access the **Drive** virtual table.  
  
> [!NOTE]  
>  If there is no disk in your disk drive, the **SizeInKilobyte** and **FreeInKilobyte** fields will contain the value -1.  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
