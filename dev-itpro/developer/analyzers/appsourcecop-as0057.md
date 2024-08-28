---
title: "AppSourceCop Hidden AS0057"
description: "Translations must be provided for all the locales in which the application will be available."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Hidden AS0057
Translations must be provided for all the locales in which the application will be available

## Description
Translations must be provided for all the locales in which the application will be available.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when translations aren't provided for all the locales in which the application is intended to be available. Each locale represents a specific language and region, and providing translations ensures that users in different locales can use the application in their preferred language.

## How to fix this diagnostic?

To resolve this error, you need to provide translations for all the locales in which the application will be available. Here are the steps:

1. Determine all the locales in which your application will be available.
2. Create translation files for each locale, ensuring that all user-facing text is translated.
3. Add the translation files to your project and reference them appropriately.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  