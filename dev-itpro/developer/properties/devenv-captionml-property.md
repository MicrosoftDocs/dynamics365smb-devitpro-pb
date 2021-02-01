---
title: "CaptionML Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CaptionML Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the text string that displays with the object, control, or other element in user interface for the current language.

## Applies to
-   Table
-   Table Field
-   Page Field
-   Field Group
-   Page
-   Request Page
-   Page Label
-   Page Group
-   Page Part
-   Page System Part
-   Page Action
-   Page Action Group
-   Page Action Separator
-   Xml Port
-   Report
-   Query
-   Query Column
-   Query Filter
-   Report Column
-   Enum Value
-   Page View
-   Profile
-   Enum Type
-   Permission Set

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!NOTE]  
> To submit an app to AppSource, you must use .xliff translation files. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).

The CaptionML property is multilanguage enabled, so it can contain a list of text strings in different languages. The string that is used is selected according to the user's language settings. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  

The CaptionML property has the following format.  

 `<Language ID>='<caption>'`

 `<Language ID>` is the standard Windows three-letter language ID, and `<caption>` is the caption text for this language. Use commas to separate entries.  

 The following example shows a CaptionML value.  

 `CaptionML = DEU='Name',DAN='Navn',ESP='Nombre',FRA='Nom';`

In this example, values are set for Danish (DAN), German Standard (DEU), Spanish Traditional Sort (ESP), and French Standard (FRA).  

> [!NOTE]  
>  On Role Center type pages, the CaptionML property value is used as the display name for the associated Profile in the client.

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
    |Page objects and page controls (container, group, part, and field)|Name property|
    |Query objects|Name property|  
    |Query columns|CaptionML property of the underlying table field for the column|  

## See Also  
 [Caption Property](devenv-caption-property.md)   
 [Name Property](devenv-name-property.md)
