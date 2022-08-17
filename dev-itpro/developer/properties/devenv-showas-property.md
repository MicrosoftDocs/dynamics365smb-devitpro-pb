---
title: "ShowAs Property"
description: "Specifies how an action group should be rendered"
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
# ShowAs Property
> **Version**: _Available or changed with runtime version 10.0._

Specifies how an action group should be rendered

## Applies to
-   Page Action Group

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Standard**|Specifies that an action group should be rendered as a standard group.|
|**SplitButton**|Specifies that an action group should be rendered as a split button.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The first `actionref` defined in the `group` is the default action.

## Example

```al
page 50105 ActionRefPage
{
    actions
    {
        area(Promoted)
        {
            actionref(MyPromotedActionRef; MyBaseAction)
            {
            }

            group(Group1)
            {
                group(Group2)
                {
                    ShowAs = SplitButton; 
                    actionref(MySecondPromotedActionRef; MyBaseAction)
                    {
                    }
                }
            }
        }
        area(Processing)
        {
            action(MyBaseAction)
            {
                Visible = true;
                trigger OnAction()
                begin
                    Message('Hello world!');
                end;
            }
        }
    }
}
```




## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  