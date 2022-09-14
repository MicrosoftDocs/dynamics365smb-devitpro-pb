---
title: "PromotedOnly Property"
description: "Specifies whether the selected action is promoted only, which means that it will appear only on the Home tab in the ribbon and not on the tab (ActionContainer control) where it is defined."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PromotedOnly Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies whether the selected action is promoted only, which means that it will appear only on the Home tab in the ribbon and not on the tab (ActionContainer control) where it is defined.

## Applies to
-   Page Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

 **True** to set the action as promoted only; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
PromotedOnly = true;
```
 
## Remarks

> [!NOTE]  
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Promoting actions is defined in a specific section of the page definition and contains a reference to the action. For more information, see [Promoted Actions](../devenv-promoted-actions.md).

This property is only applicable when the [Promoted Property](devenv-promoted-property.md) is set to **true**. For example, if you have an action defined under the **ActionItems** action container, and you set the **Promoted** and **PromotedOnly** properties to **true**, then in the client, the action will be shown on the **Home** tab but will be hidden on the **Actions** tab.  
  
This property in not relevant on the tablet and phone because only promoted actions are displayed on these clients.  
  
## See Also  

[Actions Overview](../devenv-actions-overview.md)  
[PromotedOnly Property](devenv-promotedonly-property.md)  
