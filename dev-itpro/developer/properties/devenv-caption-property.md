---
title: "Caption Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Caption Property
Sets the text string that displays with the object, control, or other element in user interface for the current language. The property has three optional parameters; `Locked`, `Comment`, and `MaxLength`.

## Applies to  

- Codeunit objects  
- XMLport objects  
- Pages; including general page properties, Container, Group, Part, and Field controls.  
- Profile objects
- Query objects and query columns  
- Reports  
- Tables and table fields  
- XMLport objects  


## Parameters
*Locked*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
If `true` the Caption is locked and should not be translated.  

*Comment*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Descriptive text for the Caption, for example, with regards to translation.

*MaxLength*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Sets the maximum length of the specific Caption.

## Syntax
```
Caption = 'Name';
```

```
Caption = 'Name', Locked = true, Comment = 'Keep like this, do not translate.', MaxLength = 20;
```

## Remarks  
A caption is the text used to show the identity of a control. For example, in the caption bar of a page or a label for another control.  

> [!NOTE]  
> For query columns, when you run the query from Object Designer, the About This Query window that opens in the [!INCLUDE[rtc](../includes/rtc_md.md)] displays the value for the [Name Property](devenv-name-property.md) of the query column, not the Caption property or CaptionML Property.  

## See Also  
[ShowCaption Property](devenv-showcaption-property.md)  
[Multilanguage Development](../devenv-multilanguage-development.md)
