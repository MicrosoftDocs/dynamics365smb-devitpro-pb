---
title: "AutoSplitKey Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f4af0163-90aa-486c-a907-f04636499be3
caps.latest.revision: 8
manager: edupont
---
# AutoSplitKey Property
Sets whether a key is automatically created for a new record placed between the current record and the previous record.  
  
## Applies To  
  
-   Pages  
  
## Property Value  
 **Yes** if the key is automatically created for the new record; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 To set this property to a value of **Yes**, the following conditions must be met:  
  
-   The current key must be the primary key.  
  
-   The last field in the primary field must be an [Integer Data Type](Integer-Data-Type.md), [BigInteger Data Type](BigInteger-Data-Type.md), [GUID Data Type](GUID-Data-Type.md), or [Decimal Data Type](Decimal-Data-Type.md) field.  
  
## See Also  
 [Properties](Properties.md)