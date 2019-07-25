---
title: "ShortCutKey Property"
ms.custom: na
ms.date: 04/01/2019
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

This property only applies to the [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)]. The property is ignored in the Web client.

## Syntax
```
ShortCutKey = 'Shift+Ctrl+D';
```

## Remarks  
Pressing the key that you designate with this property provides the same result as selecting the action.  

Some shortcut keys have default assignments. Do not reuse shortcut keys that are already assigned. For a list of these shortcuts, see [Keyboard Shortcuts for the Dynamics NAV Windows Client](https://docs.microsoft.com/en-us/dynamics-nav-app/keyboard-shortcuts-windows-client). 
  
## See Also  
 [Properties](devenv-properties.md)