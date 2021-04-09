---
title: "ToolTipML Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# ToolTipML Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the text used for the tooltip of an action, a field, a FactBox, or an activity button. In the client, tooltips appear when you point to caption of the control.

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
> To submit an app to AppSource, you must use .xliff translation files. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).

> [!NOTE]  
> List page field tooltips are only shown in the [!INCLUDE[nav_web](../includes/nav_web_md.md)] and [!INCLUDE[nav_tablet_md](../includes/nav_tablet_md.md)].

> [!NOTE]  
> Activity button tooltips are only shown in the [!INCLUDE[nav_web](../includes/nav_web_md.md)].  

> [!NOTE]  
> ActionContainers tooltips are only shown on the [!INCLUDE[nav_web](../includes/nav_web_md.md)] for the subtype **Embedding**.  

## Remarks  

ToolTipML is multilanguage-enabled. This means that it can contain a list of strings for use by different languages. The text that is used is selected according to the user's current language setting. For more information, see [Multilanguage Development](../devenv-work-with-translation-files.md).  

The ToolTipML property value has the following format.  

```AL
<Language ID>=<tooltip>  
```  

`<Language ID>` is a Windows standard three-letter language ID and `<caption>` is the caption text for this language. Semicolons are used to separate entries.  

In the following example, values are set for Danish (DAN) and English (ENG).  

```AL
DAN=Dette felt indeholder kundens navn;ENG=This field contains the customer name  
```  

## See Also

[ToolTip Property](devenv-tooltip-property.md)  
[Guidelines for tooltip text](../../user-assistance.md#guidelines-for-tooltip-text)  
