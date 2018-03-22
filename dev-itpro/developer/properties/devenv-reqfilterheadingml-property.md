---
title: "ReqFilterHeadingML Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 2ee40a72-9b03-4ddf-878a-324921671ec9
caps.latest.revision: 13
author: SusanneWindfeldPedersen
---

# ReqFilterHeadingML Property
Sets the text used as a [ReqFilterHeading Property](devenv-reqfilterheading-property.md) for a request page tab.  

> [!NOTE] 
> The support for using the ML properties, such as **CaptionML** and **TooltipML**, is being deprecated, so it is recommended to refactor your extension to use the corresponding **Caption** or **Tooltip** property, which is being picked up in the .xliff file. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).
  
## Applies To  
  
-   Data items on reports.  
  
-   Table elements on XMLports.  
  
## Remarks  
 **ReqFilterHeadingML** is multilanguage enabled. This means that it can contain a list of text in different languages. The text that is used will be selected according to the current language setting of the user. The **ReqFilterHeadingML** property has the following format.  
  
 <*Language ID*>=<*ReqFilterHeading*>  
  
 <*Language ID*> is a Windows standard three-letter language ID and <*ReqFilterHeading*> is the caption text for this language. Semicolons separate entries.  
  
 You can enter values for the **ReqFilterHeadingML** property in the following ways:  
  
-   If you enter a **ReqFilterHeading**, this value will be inserted in **ReqFilterHeadingML** as the value for the language that is currently selected. If the language is set to Danish when a value is entered in **ReqFilterHeading**, **ReqFilterHeadingML** will be updated with a DAN=<*value*> string. You have to use the abbreviated name (DAN for Danish, for example) of the languages.  
  
-   When you choose the **AssistEdit** button in the **ReqFilterHeadingML** field, the **Multilanguage Editor** window opens. This window has two columns: **Language** and **Value**. The **Language** column is populated with all languages defined by Windows. For your convenience, the full names of the languages are displayed. The **ReqFilterHeadingML** value for a language is added by entering a value in the **Value** field for that language. To save the values that you set, you must close this window by choosing the **OK** button. If you close it by pressing the Esc key, then the **ReqFilterHeadingML** field is not updated.  
  
## See Also  
 [Multilanguage Development](../devenv-multilanguage-development.md)