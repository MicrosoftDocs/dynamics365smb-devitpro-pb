---
title: "CaptionML Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 3390a39e-12ce-4d42-a55a-d00c48ca9a7c
caps.latest.revision: 21
author: SusanneWindfeldPedersen
---

# CaptionML Property
Sets the string that is used to identify a control or other object in the user interface.  

> [!NOTE]  
> To submit an app to AppSource, you must use .xliff translation files. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).

## Applies to  

- Codeunit objects  
- XMLport objects  
- Menu objects, menu buttons, menu groups, and menu items  
- Pages, including general page properties and Group, Part, and Field controls.  
- Profile objects
- Query objects and query columns  
- Report objects  
- Table objects and table fields  
- XMLport objects  

## Remarks  
The CaptionML property is multilanguage enabled, so it can contain a list of text strings in different languages. The string that is used is selected according to the user's language settings. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  

The CaptionML property has the following format.  

 `<Language ID>='<caption>'`

 `<Language ID>` is the standard Windows three-letter language ID, and `<caption>` is the caption text for this language. Use commas to separate entries.  

 The following example shows a CaptionML value.  

 `CaptionML = DEU='Name',DAN='Navn',ESP='Nombre',FRA='Nom';`

In this example, values are set for Danish (DAN), German Standard (DEU), Spanish Traditional Sort (ESP), and French Standard (FRA).  

> [!NOTE]  
>  On Role Center type pages, the CaptionML property value is used as the display name for the associated Profile in the client.

<!--
You can enter values for the CaptionML property in two ways:  

-   If you enter a value for the [Caption Property](devenv-caption-property.md), then the CaptionML property is set to the value of the current language. For example, if the current system language is Danish, then a value of `DAN ='<value>'` is placed in the CaptionML field.  

<!--
-   If you choose the **AssistButton** in the CaptionML value field, then the **Multilanguage Editor** opens and displays two columns: **Language** and **Value**. The **Language** column is populated with all languages that are defined by Windows. You specify the CaptionML value for a language by entering a value in the **Value** field for that language. You must close the **Multilanguage Editor** by choosing **OK**. If you press ESC to close the **Multilanguage Editor**, then the CaptionML field is not updated.  
-->

<!--
 When you export objects as XML, the CaptionML property values are included.  
-->

## Default Values

When the CaptionML property does not include an entry for the language used in the client at runtime, then a default value for the caption string will be used according to the following: 

1. If there is an `ENU` entry, then it's caption string is used. 
2. If there are no language entries in CaptionML property, then the caption string is determined according to the following table:

    |Object, control, or other element|Default caption|  
    |---------------------------------|---------------|  
    |Table object|Name property|  
    |Table Field|Name property|  
    |Report|Name property|  
    |XMLport|Name property|  
    |Codeunit|Name property|  
    |Menu button and menu item|Name property|  
    |Page objects and page controls (container, group, part, and field)|Name property| |Query objects|Name property|  
    |Query columns|CaptionML property of the underlying table field for the column|  

## See Also  
 [Caption Property](devenv-caption-property.md)   
 [Name Property](devenv-name-property.md)
