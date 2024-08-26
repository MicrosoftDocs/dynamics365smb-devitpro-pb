---
title: "CodeCop Warning AA0224"
description: "The count of option captions specified in the OptionCaption property is wrong."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0224
The count of option captions specified in the OptionCaption property is wrong.

## Description
The count of option captions specified in the OptionCaption property is wrong.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The number of option captions specified in the **OptionCaption** property must match the number of option values available for a variable or a field on a page or report.

## Example

The following code sample will raise a warning because the number of option values available for the page field `"VAT Posting"` is two, while only one option caption is defined in the **OptionCaption** property. 

```AL
page 50100 MyPage
{
    layout
    {
        area(Content)
        {
            field("VAT Posting"; postingOptions)
            {
                OptionCaption = 'Automatic VAT Entry';
            }
        }
    }

    var
        postingOptions: Option "Automatic VAT Entry" , "Manual VAT Entry";
}
```


## See Also  
[CodeCop Analyzer](codecop.md)  
[OptionCaption Property](../properties/devenv-optioncaption-property.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  