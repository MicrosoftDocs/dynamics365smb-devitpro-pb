---
title: "AppSourceCop Warning AS0087"
description: "Translations of enum value captions must not contain commas."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0087
Translations of enum value captions must not contain commas

## Description
Translations of enum value captions must not contain commas. Commas in captions will result in values with wrong captions both in the UI and potential unexpected results in connection with formatting and evaluating enums.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This warning ensures that translations of enum value captions don't include commas, which can cause issues in the user interface and during the processing of enums. Commas can interfere with the correct display and handling of enum values, leading to misleading or incorrect information being shown to users. Additionally, commas can cause problems when enums are formatted or evaluated programmatically, potentially leading to unexpected behavior or errors.

## How to fix this diagnostic?

To resolve this warning, follow these steps:

1. Locate the enum value captions in your code that contain commas in their translations.
2. Modify the translations to remove any commas from the captions.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  