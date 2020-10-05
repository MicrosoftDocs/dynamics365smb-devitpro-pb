---
title: "The count of option captions specified in the OptionCaption property is wrong."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# CodeCop Rule AA0224
The count of option captions specified in the OptionCaption property is wrong.  

## Description
The count of option captions specified in the OptionCaption property is wrong.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The number of option captions specified in the **OptionCaption** property must match the number of option values available for a variable or a field on a page or report.

## Example

The following code sample will raise a warning because the number of option values available for the page field `"VAT Posting"` is two, while only one option caption is defined in the **OptionCaption** property. 

```
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
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  