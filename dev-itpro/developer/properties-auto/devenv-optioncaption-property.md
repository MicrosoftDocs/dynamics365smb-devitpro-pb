---
title: "OptionCaption Property"
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
# OptionCaption Property
> **Version**: _Available from runtime version 1.0._

Sets the text string options that are displayed to the user.

## Applies to
-   Field
-   Page Field
-   Report Column

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
field(1300; "Payment Prediction"; Option)
{
    OptionMembers = " ",Late,"On-Time";
    OptionCaption = ' ,Late,On-Time';
}
```

```AL
field(1301; "Prediction Confidence"; Option)
{
    OptionMembers = " ",Low,Medium,High;
    OptionCaption = ' ,Low,Medium,High';
}
```

## Remarks

**OptionCaption** sets the text used to show the option values available for a variable or a field on a page or report. The [OptionString Property](devenv-optionstring-property.md) contains the set of values that are acceptable choices. If you have set the [OptionCaptionML Property](devenv-optioncaptionml-property.md), this overrides the OptionCaption setting.  
  
## See Also  

[OptionString Property](devenv-optionstring-property.md)  
[OptionCaptionML Property](devenv-optioncaptionml-property.md)  