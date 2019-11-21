---
title: "Caption Property"
ms.custom: na
ms.date: 11/20/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Caption Property
Sets the text string that displays with the object, control, or other element in user interface for the current language.  

## Applies To  

- Codeunit objects  
- XMLport objects  
- Pages, including general page properties, Container, Group, Part, and Field controls.  
- Profile objects
- Query objects and query columns  
- Reports  
- Tables and table fields  
- XMLport objects  

## Syntax

```
Caption = 'Name';
```

## Remarks  
A caption is the text used to show the identity of a control. For example, in the caption bar of a page or a label for another control.  

> [!NOTE]  
> For query columns, when you run the query from Object Designer, the About This Query window that opens in the [!INCLUDE[rtc](../includes/rtc_md.md)] displays the value for the [Name Property](devenv-name-property.md) of the query column, not the Caption property or CaptionML Property.  

## See Also  
[ShowCaption Property](devenv-showcaption-property.md)  
[Multilanguage Development](../devenv-multilanguage-development.md)
