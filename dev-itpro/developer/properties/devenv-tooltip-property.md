---
title: "ToolTip Property"
description: "Sets the string used for the tooltip of an action, a field, a FactBox, or an activity button."
ms.author: solsen
ms.custom: na
ms.date: 08/04/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ToolTip Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the string used for the tooltip of an action, a field, a FactBox, or an activity button.
	
In the client, tooltips appear when you point to the caption of the control.

## Applies to
-   Page Label
-   Page Field
-   Page Part
-   Page System Part
-   Page Chart Part
-   Page Action Area
-   Page Action
-   Page Action Group
-   Page Custom Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> List page field tooltips are only shown in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] and [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)].

> [!NOTE]  
> Activity button tooltips are only shown in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)].  

> [!NOTE]  
> ActionContainers tooltips are only shown in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] for the subtype **Embedding**.  

## Parameters

*Locked*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
If `true` the ToolTip is locked and should not be translated.  

*Comment*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Descriptive text for the ToolTip, for example, with regards to translation.

*MaxLength*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Sets the maximum length of the specific ToolTip.

## Remarks

The default is an empty string, which means there will be no tooltip. According to the user assistance model for [!INCLUDE[prod_short](../includes/prod_short.md)], apps are expected to apply tooltips to controls on pages. Tooltips can be up to 1024 characters long, exceeding this does not throw an error, but the rest of the tooltip is truncated `...`. The best practice is to not exceed 200 characters. For more information, see [Guidelines for tooltip text](../../user-assistance.md#guidelines-for-tooltip-text).

The following example illustrates how you can apply tooltips in an app:  

```AL
field("Reward ID";"Reward ID")
{
    ApplicationArea = All;
    ToolTip = 'Specifies the level of reward that the customer has at this point.';
}
```

Or, with parameters:


```AL
field("Reward ID";"Reward ID")
{
    ApplicationArea = All;
    ToolTip = 'Specifies the level of reward that the customer has at this point.', Locked = true, Comment = 'Keep like this, do not translate.', MaxLength = 100;
}
```

## See Also

[User Assistance Model](../../user-assistance.md)  
[Guidelines for tooltip text](../../user-assistance.md#guidelines-for-tooltip-text)  
[Configuring the Help Experience](../../deployment/configure-help.md)  
[ToolTipML Property](devenv-tooltipml-property.md)  
[Building Your First Sample Extension With Extension Objects, Install Code, and Upgrade Code](../devenv-extension-example.md)  
[Multilanguage Development](../devenv-work-with-translation-files.md)
