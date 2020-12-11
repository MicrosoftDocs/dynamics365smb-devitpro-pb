---
title: "OptionString Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c77a75d8-8bff-42fd-8b1a-4eaf745be70f
caps.latest.revision: 10
author: SusanneWindfeldPedersen
---


<!-- This topic is being redirected -->

# OptionString Property
Sets the option values for a field, text box, or variable. OptionString is multilanguage enabled.  

## Applies to  

-   Fields  

-   Variables  

## Syntax
```
OptionString = Ship,Invoice,All;
```

## Remarks  
 If the [OptionCaptionML Property](devenv-optioncaptionml-property.md) is set, then users see the OptionCaptionML values as the option values. However, the value that is used in AL code or that is stored in the database will be the corresponding value from the OptionString property.  

 This allows you to present strings to users in different languages. The strings that are displayed to users are selected according to the user's current language setting. For more information, see [Multilanguage Development](../devenv-Multilanguage-Development.md). If the [OptionCaptionML Property](devenv-optioncaptionml-property.md) is not set, then users will see the values from OptionString.  

 For other multilanguage enabled properties ([Caption Property](devenv-caption-property.md), [ToolTip Property](devenv-tooltip-property.md), and [ReqFilterHeading Property](devenv-reqfilterheading-property.md)), there is a relationship between the property itself and the multilanguage counterpart. The only connection between the OptionString and OptionCaptionML properties is that if the OptionCaptionML property is not set, then the strings displayed are taken from the OptionString property.  

 For Option fields and variables, use this property to list the options you want to be accepted (and displayed, if OptionCaptionML is not set). You can enter a maximum of 250 characters. Separate the options with a comma. <1For example: option1,option2,option3.  

 For controls, you can use this property to limit the number of options that the user can select. You cannot add options; if you do, a run-time error occurs when users select an option outside the set of options defined for the field or variable.  

 This property setting is checked recursively during validation.  

## See Also  
 [OptionCaptionML Property](devenv-optioncaptionml-property.md)  
 [Properties](devenv-properties.md)  
 [Table Properties](devenv-table-properties.md)  
