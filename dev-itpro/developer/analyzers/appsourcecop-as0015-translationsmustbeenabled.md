---
title: "Please enable the TranslationFile feature in the app.json file for your project"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/25/2020
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
# AppSourceCop Rule AS0015
Please enable the TranslationFile feature in the app.json file for your project  

## Description
Please enable the TranslationFile feature in the app.json file for your project.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
To submit an app to AppSource, you must use XLIFF translation files. In the app.json file, the setting `"features": [ "TranslationFile" ]` must be enabled. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Working with Translation Files](../devenv-work-with-translation-files.md)  
