---
title: "ShortcutKey Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ShortcutKey Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a shortcut key for selecting a menu item.

## Applies to
-   Page Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
ShortCutKey = 'Shift+Ctrl+D';
```

## Remarks

Pressing the key that you designate with this property provides the same result as selecting the action.  

Some shortcut keys have default assignments. Do not reuse shortcut keys that are already assigned. For a list of these shortcuts, see [Keyboard Shortcuts for the Dynamics 365 Business Central Web Client](/dynamics365/business-central/keyboard-shortcuts). 

Note that the shortcut keys that you set with this property have precedence over the default shortcut keys of the web browser that you are using and that they will override their behavior.
  
## See Also

[Properties](devenv-properties.md)
