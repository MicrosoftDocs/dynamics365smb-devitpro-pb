---
title: "Translations Overview"
description: ""
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


## The life of a caption 

Translations can be applied using multiple properties, and there are multiple opportunities to change them. For example, the caption of a page can be changed from multiple places. The following list shows the order in which a page caption will be overwritten. 

1. Page Name 
2. Page Caption 
3. Page Extension Caption 
4. Translation app 
5. Page Customization 

Translations provided using profile configuration cannot be overwritten by any apps. 

## Translations in the same layer

If there are multiple translations on the same layer, then it is possible to control which translations are applied last by setting a dependency in the `app.json` file to the layers where the translation is intended to be applied last.

For example, if you want to change the text provided from  **Translation app XYZ**, another translation app can be made, and in the `app.json` file you must then specify a dependency on **Translation app XYZ** to make sure that it is applied after and thereby overwrites the original translation.

## Overwrites

When translations from the different layers are picked up, one translation from each observed culture is kept and when it is overwritten, only the specified culture changes. In the following example, we have a caption and its page extension caption. 



## See Also

[Working with Translation Files](devenv-work-with-translation-files.md)  
