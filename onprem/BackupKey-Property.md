---
title: "BackupKey Property"
author: edupont04
ms.custom: na
ms.date: 12/08/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7ad43e31-536a-41d8-a234-7972afd18037
caps.latest.revision: 5
ms.author: edupont
---
# BackupKey Property
This property is used by the backup/restore system. Under normal circumstances, you do not need to set this property.  

## Applies To  
 Keys  

## Property Value  
 **Yes** if the enabled property of secondary keys will be restored during restore; otherwise, **No**. The default value is **No**.  

## Remarks  
 During backup, secondary keys where the [Enabled Property](Enabled-Property.md) is set to a value of **Yes** are marked with a BackupKey value of **Yes**, and the secondary indexes are not stored in the backup. When the backup is restored, the BackupKey value is checked to see whether it reenables secondary keys where BackupKey = Yes, and the indexes are recreated.  

 You will normally only see the BackupKey set to **No** \(the default\), as it is only set to **Yes** during backup. If a backup restore is suspended during key creation \(to be resumed at a later time\), you can see and set the BackupKey property.  

## See Also  
 [Enabled Property](Enabled-Property.md)
