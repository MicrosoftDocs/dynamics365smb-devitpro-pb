---
title: "PromotedCategory Property"
description: "Sets a category for a promoted action."
ms.author: solsen
ms.custom: na
ms.date: 12/08/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PromotedCategory Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a category for a promoted action.

## Applies to
-   Page Action

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**New**|runtime version 1.0|Actions will appear in the New menu.|
|**Process**|runtime version 1.0|Actions will appear in the Process menu.|
|**Report**|runtime version 1.0|Actions will appear in the Report menu.|
|**Category4**|runtime version 1.0|Actions will appear in the Category 4 menu.|
|**Category5**|runtime version 1.0|Actions will appear in the Category 5 menu.|
|**Category6**|runtime version 1.0|Actions will appear in the Category 6 menu.|
|**Category7**|runtime version 1.0|Actions will appear in the Category 7 menu.|
|**Category8**|runtime version 1.0|Actions will appear in the Category 8 menu.|
|**Category9**|runtime version 1.0|Actions will appear in the Category 9 menu.|
|**Category10**|runtime version 1.0|Actions will appear in the Category 10 menu.|
|**Category11**|runtime version 1.0|Actions will appear in the Category 11 menu.|
|**Category12**|runtime version 1.0|Actions will appear in the Category 12 menu.|
|**Category13**|runtime version 1.0|Actions will appear in the Category 13 menu.|
|**Category14**|runtime version 1.0|Actions will appear in the Category 14 menu.|
|**Category15**|runtime version 1.0|Actions will appear in the Category 15 menu.|
|**Category16**|runtime version 1.0|Actions will appear in the Category 16 menu.|
|**Category17**|runtime version 1.0|Actions will appear in the Category 17 menu.|
|**Category18**|runtime version 1.0|Actions will appear in the Category 18 menu.|
|**Category19**|runtime version 1.0|Actions will appear in the Category 19 menu.|
|**Category20**|runtime version 1.0|Actions will appear in the Category 20 menu.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example

The following code sample illustrates how to set the **PromotedCategory** property.

```AL
page 50110 PageName
{
    PageType = Card;

    actions
    {
        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action("My Actions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

...
```
  
## Remarks

> [!NOTE]  
> With [!INCLUDE [prod_short](../includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Promoting actions is defined in a specific section of the page definition and contains a reference to the action. For more information, see [Promoted Actions](../devenv-promoted-actions.md).

Promoted actions appear in the action bar on a page. You promote an action by setting the [Promoted Property](devenv-promoted-property.md). Categories allow you to group similar actions under a common caption. You can choose between 10 categories: New, Process, Report, and Category4 through Category10. By default, the category names are used as the captions in the ribbon. <!--For information about changing the captions, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to-Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  -->
  
## See Also  

[Properties](devenv-properties.md)
[Promoted Property](devenv-promoted-property.md)  
[Actions Overview](../devenv-actions-overview.md)  