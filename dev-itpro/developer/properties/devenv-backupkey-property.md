---
title: "BackupKey Property"
author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7ad43e31-536a-41d8-a234-7972afd18037
caps.latest.revision: 5
ms.author: solsen
---

# BackupKey Property
This property is used by the backup/restore system. Under normal circumstances, you do not need to set this property.  

## Applies to  
 Keys  

## Property Value  
 **True** if the enabled property of secondary keys will be restored during restore; otherwise, **false**. The default value is **false**.  

## Syntax
```AL
BackupKey = true;
```

## Remarks  
During backup, secondary keys where the [Enabled Property](devenv-enabled-property.md) is set to a value of **true** are marked with a BackupKey value of **true**, and the secondary indexes are not stored in the backup. When the backup is restored, the BackupKey value is checked to see whether it reenables secondary keys where BackupKey = true, and the indexes are recreated.  

You will normally only see the BackupKey set to **false** (the default), as it is only set to **true** during backup. If a backup restore is suspended during key creation (to be resumed at a later time), you can see and set the BackupKey property.  

## See Also  
[Enabled Property](devenv-enabled-property.md)
