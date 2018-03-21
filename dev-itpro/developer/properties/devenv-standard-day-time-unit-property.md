---
title: "Standard Day-Time Unit Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d8f29b3d-868c-41a5-af46-2fd484c7a0ce
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# Standard Day-Time Unit Property
Sets the unit of measure that is used when you enter data into duration fields.  
  
## Applies To  
 Fields of the Duration data type.  
  
## Remarks  
 The units of measure that you can enter are: **day**, **hour**, **minute**, **second**, and **millisecond**.  
  
 The default value is **hour**.  
  
 Duration is always stored as milliseconds.  
  
> [!NOTE]  
>  Even if you change the value of this property, you must enter both the value and the units of measure in the duration field. For example, enter **3 minutes**.  
  
## See Also  
 [Properties](devenv-properties.md)