---
title: "PasteIsValid Property"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7f3e261c-65ba-4adc-9fba-344a6eca8146
caps.latest.revision: 6
manager: edupont
---
# PasteIsValid Property
Sets whether inserting records into this table using the paste command is enabled.  
  
## Applies To  
 Tables  
  
## Property Value  
 **Yes** if you want to allow insert by pasting; otherwise, **No**. The default value is **Yes**.  
  
## Remarks  
 If records are usually inserted in the table through an external code unit function, set the PasteIsValid property equal to **No**.  
  
 The [OnInsert Trigger](OnInsert-Trigger.md) of the table is executed when a record is inserted by pasting.  
  
## See Also  
 [OnInsert Trigger](OnInsert-Trigger.md)