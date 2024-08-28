---
title: "AppSourceCop Warning AS0056"
description: "The country/region codes specified in the 'supportedCountries' property must be valid ISO 3166-1 alpha-2 codes."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0056
The country/region codes specified in the 'supportedCountries' property must be valid ISO 3166-1 alpha-2 codes

## Description
The country/region codes specified in the 'supportedCountries' property must be valid ISO 3166-1 alpha-2 codes. Each code must correspond to a country/region for which the product allows AppSource submissions. See [Country/Regional availability and Supported Translations](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/compliance/apptest-countries-and-translations) for more information.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To resolve this warning, you need to ensure that all country/region codes specified in the 'supportedCountries' property are valid ISO 3166-1 alpha-2 codes. Here are the steps:

1. Locate the 'supportedCountries' property in your app.json file.
2. Check each code to ensure it's a valid ISO 3166-1 alpha-2 code. You can refer to the [ISO 3166-1 alpha-2 code list](https://www.iso.org/iso-3166-country-codes.html) for reference.
3. Replace any non-valid codes with valid ones.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)