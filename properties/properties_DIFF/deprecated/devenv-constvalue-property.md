---
title: "ConstValue Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0e3ac7d5-83b5-4f92-b0d5-fd98fd932647
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

# ConstValue Property

Sets the value of the AL text constant for the current application language of the [!INCLUDE[d365_dev_short_md](../includes/d365_dev_short_md.md)].  
  
## Applies to  

**Local** and **global** text constants in the AL code of objects.  

## Syntax

```AL
ConstValue = Name;
```

## Remarks  

The **ConstValue** property sets the text string in the [ConstValueML Property](devenv-constvalueml-property.md) for the current application language of the [!INCLUDE[d365_dev_short_md](../includes/d365_dev_short_md.md)]. For example, if the application language of the [!INCLUDE[d365_dev_short_md](../includes/d365_dev_short_md.md)] is set to English (United States) and you set the **ConstValue** property to **test**, then the value **ENU=test** is included in the **ConstValueML** property.  
  
## See Also  

<!-- [How to: Change the Language in the User Interface](How-to--Change-the-Language-in-the-User-Interface.md) -->   
[Multilanguage Development](../devenv-multilanguage-development.md)