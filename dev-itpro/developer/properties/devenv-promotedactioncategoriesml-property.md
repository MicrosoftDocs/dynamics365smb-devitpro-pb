---
title: "PromotedActionCategoriesML Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 036a07c2-26b0-483b-96ae-4052fdfba6ad
caps.latest.revision: 2
author: SusanneWindfeldPedersen
---

# PromotedActionCategoriesML Property
Sets the caption of the group that you are promoting the action to.  
  
## Applies to  
  
- Pages

## Syntax
```
PromotedActionCategoriesML = ENU='New,Process,Report,Bank,Application', ESP='Nuevo, Procesar, Reportar, Banco, Aplicación';
```
 
## Remarks  
The PromotedActionCategoriesML property is multilanguage enabled, so it can contain a list of text strings in different languages. The string that is used is selected according to the user's language settings. For more information, see [Multilanguage Development](../devenv-work-with-translation-files.md).

Promoted actions appear in the action bar on a page. You promote an action by setting the [Promoted Property](devenv-promoted-property.md) to **true**. You use the  [PromotedCategory Property](devenv-promotedcategory-property.md) to set the category of an action, which allows you to group similar actions under a common caption. You can choose between 20 categories: New, Process, Report, and Category4 through Category20.

By default, the category names are used as the captions in the ribbon. You use this property to customize these captions. The new caption names must me expressed as a string list, where the first three places correspond to the captions of the New, Process and Report categories, respectively, the fourth place to Category4's caption, the fifth to Category5's and so on.
<!-- For information about changing the captions, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to--Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  -->
  
## See Also  
[Properties](devenv-properties.md)  
[Promoted Property](devenv-promoted-property.md)  
[PromotedActionCategories Property](devenv-promotedactioncategories-property.md)  
[PromotedCategory Property](devenv-promotedcategory-property.md)  
[Actions Overview](../devenv-actions-overview.md)  
