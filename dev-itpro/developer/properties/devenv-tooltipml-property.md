---
title: "ToolTipML Property"
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cd79bfbf-483c-43b0-b884-6230aac3ec5c
caps.latest.revision: 17
author: SusanneWindfeldPedersen
---

 

# ToolTipML Property
Sets the text used for the tooltip of an action, a field, a factbox, or an activity button.  

In the client, tooltips appear when you point to caption of the control.

> [!NOTE] 
> The support for using the ML properties, such as **CaptionML** and **TooltipML**, is being deprecated, so it is recommended to refactor your extension to use the corresponding **Caption** or **Tooltip** property, which is being picked up in the .xliff file. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).

## Applies To  

-   Actions in the ribbon  

-   Fields on pages  

    > [!NOTE]  
    >  List page field tooltips are only shown in the [!INCLUDE[nav_web](../includes/nav_web_md.md)] and [!INCLUDE[nav_tablet_md](../includes/nav_tablet_md.md)].

-   Factboxes  

-   Activity buttons  

    > [!NOTE]  
    >  Activity button tooltips are only shown in the [!INCLUDE[nav_web](../includes/nav_web_md.md)].  

-   ActionContainers  

    > [!NOTE]  
    >  ActionContainers tooltips are only shown on the [!INCLUDE[nav_web](../includes/nav_web_md.md)] for the subtype **HomeItems**.  

## Remarks  
 ToolTipML is multilanguage enabled. This means that it can contain a list of strings for use by different languages. The text that is used is selected according to the user's current language setting. For more information, see [Multilanguage Development](../devenv-Multilanguage-Development.md).  

 The ToolTipML property value has the following format.  

```  
<Language ID>=<tooltip>  
```  

 <Language ID> is a Windows standard three-letter language ID and <caption> is the caption text for this language. Semicolons are used to separate entries.  

 In the following example, values are set for Danish (DAN) and English (ENG).  

```  
DAN=Dette felt indeholder kundens navn;ENG=This field contains the customer name  
```  

## See Also  
 [ToolTip Property](devenv-tooltip-property.md)
