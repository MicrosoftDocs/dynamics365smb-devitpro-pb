---
title: "PromotedCategory Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PromotedCategory Property
> **Version**: _Available from runtime version 1.0._

Sets a category for a promoted action.

## Applies to
-   Page Action

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**New**|Actions will appear in the New menu.|
|**Process**|Actions will appear in the Process menu.|
|**Report**|Actions will appear in the Report menu.|
|**Category4**|Actions will appear in the Category 4 menu.|
|**Category5**|Actions will appear in the Category 5 menu.|
|**Category6**|Actions will appear in the Category 6 menu.|
|**Category7**|Actions will appear in the Category 7 menu.|
|**Category8**|Actions will appear in the Category 8 menu.|
|**Category9**|Actions will appear in the Category 9 menu.|
|**Category10**|Actions will appear in the Category 10 menu.|
|**Category11**|Actions will appear in the Category 11 menu.|
|**Category12**|Actions will appear in the Category 12 menu.|
|**Category13**|Actions will appear in the Category 13 menu.|
|**Category14**|Actions will appear in the Category 14 menu.|
|**Category15**|Actions will appear in the Category 15 menu.|
|**Category16**|Actions will appear in the Category 16 menu.|
|**Category17**|Actions will appear in the Category 17 menu.|
|**Category18**|Actions will appear in the Category 18 menu.|
|**Category19**|Actions will appear in the Category 19 menu.|
|**Category20**|Actions will appear in the Category 20 menu.|
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

Promoted actions appear in the action bar on a page. You promote an action by setting the [Promoted Property](devenv-promoted-property.md). Categories allow you to group similar actions under a common caption. You can choose between 10 categories: New, Process, Report, and Category4 through Category10. By default, the category names are used as the captions in the ribbon. <!--For information about changing the captions, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to-Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  -->
  
## See Also  

[Properties](devenv-properties.md)
[Promoted Property](devenv-promoted-property.md)  
[Actions Overview](../devenv-actions-overview.md)  

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  