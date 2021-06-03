---
title: "Translations Overview"
description: "An overview of the translation layers of Business Central and the extension model"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Translations Overview

Your [!INCLUDE[prod_short](../includes/prod_short.md)] app can be translated to other languages to adjust it to the market need. Because of the layered architecture of the extension model, the translation(s) that are displayed to the user depends on a number of things as explained in this topic.

In [!INCLUDE[prod_short](../includes/prod_short.md)] translations are done using XLIFF files, which is a standardized format used for computer-based translations. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

## The life of a caption 

Translations can be applied using multiple properties, and there are multiple opportunities to change them. The caption of a page, for example, can be changed from multiple places. With that flexibility, a defined structure is in place and a page name, for example, will be translated (overwritten) as follows: 

1. Page Name
2. Page Caption
3. Page Extension Caption
4. Translation app 
5. Page Customization 

> [!NOTE]  
> Translations provided using profile configuration cannot be overwritten by any apps. 

## Translations in the same layer

If there are *multiple translations on the same layer*, then it is possible to control which translations are *applied last* by setting a dependency in the `app.json` file to the app on the layer where the translation is intended to be applied last.

For example, if you want to change the text provided from  **Translation app XYZ**, you can create another translation app, and in the `app.json` file of that new translation app, you must then specify a dependency on **Translation app XYZ** to make sure that the translation in *the new app is applied after* and thereby overwrites the original translation.

```al
"dependencies": 
  [
    {"id": "f1f12588-13cb-47fd-b94a-cddce44e9a8f", "name": "Translation app XYZ", "publisher": "Default publisher", "version": "1.0.0.0"}
  ]
```

For more information, see [JSON Files](devenv-json-files.md).

## Translations in different layers

When [!INCLUDE[prod_short](../includes/prod_short.md)] is extended more layers for translation are typically introduced. A layer can come from extensions and/or from a translation app. When *translations from different layers* are picked up, one translation from each observed culture is kept and when it is overwritten, only the specified culture changes. The following image illustrates an example of three different layers of translations. A base object, an extension object, and a language app all contribute with languages/translation and the result illustrates how the base object and extension object translations are overwritten by the language app.

![Translation Overwrites](../media/Translation_1.png "Translation Overwrites")

## Picking the language to display

Once translations on the different layers have been collected, the translations that display on the user interface are then picked, based on the context. The illustration below uses the following definitions:

**Local language**  
The language that the user specifies in [!INCLUDE[prod_short](../includes/prod_short.md)] under **Settings**.

**Global language**  
By default it is the same as the local language, but the global language can be changed from AL code.

**Default Language**  
Is defined by a server setting for [!INCLUDE[prod_short](../includes/prod_short.md)] on-prem. For [!INCLUDE[prod_short](../includes/prod_short.md)] online it is set to the same language that was selected when signing up for [!INCLUDE[prod_short](../includes/prod_short.md)].

**Primary language (global or local)**  
Defined as the primary culture of a language. For `es-MX` (Spanish-Mexico), for example, the primary language will be `es-ES` (Spanish-Spain).

**Field Caption**  
If the page control is based on a table field, and if no translations are found on the page, then the translation found on the table field is used.

![Translation](../media/Translation_2.png "Translations to display")

The illustration shows examples of how translations for a page caption, a control caption, an enum caption, and a text constant are found. The search is sequential and starts at number 1, and stops searching when the the first translation is met. So, if you, for example, have an enum and no translations are found for the local language or the primary local language, the search stops at the global language because a match is found, and will use that translation in the UI.


## See Also

[Working with Translation Files](devenv-work-with-translation-files.md)  
[CaptionML Property](properties/devenv-captionml-property.md)  
