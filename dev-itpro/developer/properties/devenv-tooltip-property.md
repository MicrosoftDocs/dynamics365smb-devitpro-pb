---
title: "ToolTip Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ToolTip Property
Sets whether tooltips are provided for the given control, such as a field or action. The tooltip value is taken from the [ToolTipML Property](devenv-tooltipml-property.md) if this property is set.

In the client, tooltips appear when you point to the caption of the control.

## Applies to  

- Actions in the ribbon  

- Fields on pages

  > [!NOTE]  
  >  List page field tooltips are only shown in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] and [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)].

- Factboxes  

- Activity buttons  

  > [!NOTE]  
  >  Activity button tooltips are only shown in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)].  

- ActionContainers  

  > [!NOTE]  
  >  ActionContainers tooltips are only shown in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] for the subtype **Embedding**.  

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
The default is an empty string, which means there will be no tooltip. According to the user assistance model for [!INCLUDE[prodshort](../includes/prodshort.md)], apps are expected to apply tooltips to controls on pages.  

The following example illustrates how you can apply tooltips in an app:  

```
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
