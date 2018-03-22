---
title: "Caption Property"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9de475d3-eb64-4306-86b5-9f61232bd6df
caps.latest.revision: 16
author: SusanneWindfeldPedersen
---

# Caption Property
Sets the text string that displays with the object, control, or other element in user interface for the current language.  

## Applies To  

-   Codeunit objects  

-   XMLport objects  

-   Pages, including general page properties, Container, Group, Part, and Field controls.  

-   Query objects and query columns  

-   Reports  

-   Tables and table fields  

-   XMLport objects  

## Remarks  
 A caption is the text used to show the identity of a control (for example, in the caption bar of a page or a label for another control).  

 The Caption property value is taken from the value of the [CaptionML Property](devenv-captionml-property.md) for the current user language if the CaptionML Property is set. If you enter a value for the Caption Property, then the value is included in CaptionML property for the current language. For example, if the current system language is Danish, then a value of **DAN =<value>** is placed in the CaptionML field.  

> [!NOTE]  
>  For query columns, when you run the query from Object Designer, the About This Query window that opens in the [!INCLUDE[rtc](../includes/rtc_md.md)] displays the value for the [Name Property](devenv-name-property.md) of the query column, not the Caption property or CaptionML Property.  

## See Also  
 [ShowCaption Property](devenv-showcaption-property.md)   
 [Multilanguage Development](../devenv-multilanguage-development.md)
