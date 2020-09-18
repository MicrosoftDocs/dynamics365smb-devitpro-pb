---
title: "OptionMembers Property (Field)"
ms.custom: na
ms.date: 08/19/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# OptionMembers Property (Field)
Sets the list of options that are available in the field that is currently selected. 

  
## Applies to  
  
-   Fields  

## Example
In the code snippet below, you can see how the property is set.

```
field(2; OptionField; option)
{
    OptionMembers = "Option with ", "spaces and ", "other symbols!";
}
```

Setting the `OptionMembers` property is necessary to enable the `OptionCaptionML` property. For more information, see [OptionCaptionML Property](devenv-optioncaptionml-property.md).

## See Also  
[Properties](devenv-properties.md)  
[Report Object](../devenv-report-object.md)     
[Report Properties](devenv-report-properties.md)   
[OptionMembers Property (Report)](devenv-optionmembers-report-property.md)