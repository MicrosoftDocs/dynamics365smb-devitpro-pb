---
title: "ToolTip Property"
description: "Sets the string used for the tooltip of an action, a field, a FactBox, or an activity button."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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
-   Page System Action
-   Page File Upload Action
-   Table Field

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

The default is an empty string, which means there will be no tooltip. According to the user assistance model for [!INCLUDE[prod_short](../includes/prod_short.md)], apps are expected to apply tooltips to controls on pages. Tooltips can be up to 1024 characters long, exceeding this doesn't throw an error, but the rest of the tooltip is truncated `...`. The best practice is to not exceed 200 characters. For more information, see [Guidelines for tooltip text](../../user-assistance.md#guidelines-for-tooltip-text).

With the `Locked` parameter, you can specify that the tooltip shouldn't be translated. This is useful when the tooltip is a technical term or a proper name, for example. The `Comment` parameter is used to provide additional information about the tooltip, for example, to explain why the tooltip shouldn't be translated. The `MaxLength` parameter is used to specify the maximum length of the tooltip. If the tooltip exceeds the maximum length, the rest of the tooltip is truncated `...`.

> [!NOTE]  
> With runtime version 13.0, the `ToolTip` property is available also for table fields. A table field tooltip will, like the caption, be applied on page controls that reference the table field. This allows you to specify the tooltip in one place and have it applied to all controls that reference the table field. With runtime 13.0, there's a new code action to help move the tooltip from page controls to table fields or clean them up from the page in case of duplicates. For more information, see [AL code actions](../devenv-code-actions.md).


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

## See also

[User assistance model](../../user-assistance.md)  
[Guidelines for tooltip text](../../user-assistance.md#guidelines-for-tooltip-text)  
[Configuring the help experience](../../deployment/configure-help.md)  
[ToolTipML property](devenv-tooltipml-property.md)  
[Build your first sample extension with extension objects, install code, and upgrade code](../devenv-extension-example.md)  
[Multilanguage development](../devenv-work-with-translation-files.md)
