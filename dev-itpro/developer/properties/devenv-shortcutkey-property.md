---
title: "ShortCutKey Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b20579b0-444c-45d5-b98b-882d3255ad88
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

 # ShortCutKey Property
Sets a shortcut key for selecting an action.
  
  
## Applies To

-  Actions on pages.  

This property is fully functional in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] Web client.

## Syntax
```
ShortCutKey = 'Shift+Ctrl+D';
```

## Remarks  
Pressing the key that you designate with this property provides the same result as selecting the action.  

Some shortcut keys have default assignments. Do not reuse shortcut keys that are already assigned. For a list of these shortcuts, see [Keyboard Shortcuts for the Dynamics 365 Business Central Web Client](/dynamics365/business-central/keyboard-shortcuts). 

Note that the shortcut keys that you set with this property have precedence over the default shortcut keys of the web browser that you are using and that they will override their behavior.
  
## See Also

 [Properties](devenv-properties.md)
