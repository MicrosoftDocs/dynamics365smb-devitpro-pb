---
title: "ToolTip Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ToolTip Property
> **Version**: _Available from runtime version 1.0._

Sets whether tooltips are provided for the given control, such as a field or action. The tooltip value is taken from the ToolTipML Property if this property is set.

## Applies to
-   Page Label
-   Page Field
-   Page Part
-   Page System Part
-   Page Chart Part
-   Page Action Area
-   Page Action
-   Page Action Group


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

The default is an empty string, which means there will be no tooltip. According to the user assistance model for [!INCLUDE[prod_short](../includes/prod_short.md)], apps are expected to apply tooltips to controls on pages.  

The following example illustrates how you can apply tooltips in an app:  

```AL
field("Reward ID";"Reward ID")
{
    ApplicationArea = All;
    ToolTip = 'Specifies the level of reward that the customer has at this point.';
}
```

## See Also

[User Assistance Model](../../user-assistance.md)  
[Guidelines for tooltip text](../../user-assistance.md#guidelines-for-tooltip-text)  
[Configuring the Help Experience](../../deployment/configure-help.md)  
[ToolTipML Property](devenv-tooltipml-property.md)  
[Building Your First Sample Extension With Extension Objects, Install Code, and Upgrade Code](../devenv-extension-example.md)  
[Multilanguage Development](../devenv-work-with-translation-files.md)
