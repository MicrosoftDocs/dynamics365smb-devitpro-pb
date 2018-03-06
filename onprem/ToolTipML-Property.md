---
title: "ToolTipML Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cd79bfbf-483c-43b0-b884-6230aac3ec5c
caps.latest.revision: 17
manager: edupont
---
# ToolTipML Property
Sets the text used for the tooltip of an action, a field, a factbox, or an activity button.  

In the client, tooltips appear when you point to caption of the control.

## Applies To  

-   Actions in the ribbon  

-   Fields on pages  

    > [!NOTE]  
    >  List page field tooltips are only shown in the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_tablet_md](includes/nav_tablet_md.md)].

-   Factboxes  

-   Activity buttons  

    > [!NOTE]  
    >  Activity button tooltips are only shown in the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

-   ActionContainers  

    > [!NOTE]  
    >  ActionContainers tooltips are only shown on the [!INCLUDE[nav_web](includes/nav_web_md.md)] for the subtype **HomeItems**.  

## Remarks  
 ToolTipML is multilanguage enabled. This means that it can contain a list of strings for use by different languages. The text that is used is selected according to the user's current language setting. For more information, see [Multilanguage Development](Multilanguage-Development.md).  

 The ToolTipML property value has the following format.  

```  
<Language ID>=<tooltip>  
```  

 \<Language ID> is a Windows standard three-letter language ID and \<caption> is the caption text for this language. Semicolons are used to separate entries.  

 In the following example, values are set for Danish \(DAN\) and English \(ENG\).  

```  
DAN=Dette felt indeholder kundens navn;ENG=This field contains the customer name  
```  

## How to Enter ToolTipML Values  
 You can enter values for the ToolTipML property in two ways.  

-   Enter a [ToolTip Property](ToolTip-Property.md) value. This value is inserted in ToolTipML as the value for the language that is currently selected. If the language is set to Danish when a value is entered in ToolTip, ToolTipML is updated with a DAN=\<value> string. You have to use the abbreviated language name \(for example, DAN for Danish\).  

-   Choose the **AssistEdit** button in the ToolTipML Value field to open the **Multilanguage** editor. This is a page with two columns: Language and Value. The Language column is populated with all languages defined by Windows. Enter tooltip text in the Value field for the appropriate language and then choose the **OK** button to close the editor. If you press the Esc key to close the editor, the ToolTipML field is not updated.  

## See Also  
 [ToolTip Property](ToolTip-Property.md)
