---
title: "PromotedActionCategories Property"
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

# PromotedActionCategories Property
Sets a category for a promoted action.
  
## Applies To  
  
- Pages

## Parameters
*Locked*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
If `true` the PromotedActionCategories is locked and should not be translated.  

*Comment*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Descriptive text for the PromotedActionCategories, for example, with regards to translation.

*MaxLength*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Sets the maximum length of the specific PromotedActionCategories.

## Syntax
```
PromotedActionCategories = 'New caption, Process caption, Report caption, Category4 caption';
```
 
## Remarks  
Promoted actions appear in the action bar on a page. You promote an action by setting the [Promoted Property](devenv-promoted-property.md) to **true**. You use the  [PromotedCategory Property](devenv-promotedcategory-property.md) to set the category of an action, which allows you to group similar actions under a common caption. You can choose between 20 categories: New, Process, Report, and Category4 through Category20.

By default, the category names are used as the captions in the ribbon. You use this property to customize these captions. The new caption names must me expressed as a string list, where the first three places correspond to the captions of the New, Process and Report categories, respectively, the fourth place to Category4's caption, the fifth to Category5's and so on.

## See Also  
[Properties](devenv-properties.md)   
[Promoted Property](devenv-promoted-property.md)  
[PromotedActionCategoriesML Property](devenv-promotedactioncategoriesml-property.md)  
[PromotedCategory Property](devenv-promotedcategory-property.md)  
[Actions Overview](../devenv-actions-overview.md)  
