---
title: "Differences in the Development Environments"
description: "Describes the various differences between the old and the new development environment"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/23/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# Differences in the Development Environments

Coming from the Dynamics NAV development environment and C/SIDE, it's good to know about some differences and optimizations between them. The following sections go through some of these changes, but it isn't an exhaustive list.

> [!TIP]  
> A very useful tool working in Visual Studio Code is IntelliSense, which gives you a list of options in the current context. To activate IntelliSense from anywhere in the code, press **Ctrl+Space**.

## General development approach

While you could change the existing Dynamics NAV source code using C/SIDE, the best approach to develop with the AL Language development environment is to work with [Extensions](devenv-dev-overview.md) only. It means that you can extend the existing code by adding new functionality or integrate your code using [Events](devenv-events-in-al.md). But, it isn't possible to change the existing code, for example in codeunits.

With Business Central 2019 release wave 2, the possibility to change or ["code-customize" the base application](devenv-publish-code-customization.md) was introduced for on-premise installations. But, it was also announced that in the future, code-customization won't be an option, only extension model will be used.

## Data types

|C/SIDE|AL Language Development Environment|
|------|---------------------------|
|Dates are parsed based on culture settings.| Locale independent and supports only: `yyyy-mm-ddD`.|
|Boolean values are expressed as **yes**/**no**.| Boolean values are expressed as **true**/**false**.|
|For tables, integers can allow decimal values. For example, 5.0 converts to an integer, 5.4 throws an error at runtime.| For tables, Min, Max, InitValue numbers with a fraction are expressed as `decimal`, thus they aren't a valid integer data type.|
|The largest constant integer can be `999999999999999`. | Transforms to `999'999'999'999'999.0`, a decimal value. In AL, this can be expressed as `999999999999999.0` or `999999999999999L`.|

## Syntax updates

|C/SIDE|AL Language Development Environment|
|------|---------------------------|
|The token for multilanguage comment is @@@.|A multilanguage comment is marked with `Comment`.|

Several properties are renamed, for example:

|C/SIDE|AL Language Development Environment|
|------|---------------------------|
|AutoFormatExpr|AutoFormatExpression|
|DataCaptionExpr|DataCaptionExpression|
|Layout|GridLayout|
|ProviderID|Provider|

> [!NOTE]  
> Property values are considered syntax elements; thus they must follow the standard AL escaping rules.

## Multilanguage properties

With the introduction of .xliff files, the ML properties, such as **CaptionML** and **TooltipML** aren't used for this translation method. Use the equivalent properties instead, such as **Caption** and **Tooltip**. Then, make sure the manifest is set up to generate the `/Translations` folder and use the generated .xliff files for translations of the extension. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

## Pages

The `ActionContainer` elements in AL have been renamed; the following table lists the renamed elements:

|C/SIDE|AL Language Development Environment|
|------|---------------------------|
|ActionItems       | `Processing`    |
|ActivityButtons   | `Sections`      |
|HomeItems         | `Embedding`     |
|NewDocumentItems  | `Creation`      |
|RelatedInformation| `Navigation`    |
|Reports           | `Reporting`     |

For instance, `area(Sections)` can be defined inside the `actions` section of the page.

Likewise, `Container` and `ContainerType` elements in C/SIDE are renamed to `area(Content|FactBoxes|RoleCenter)` and can be defined inside the `layout` section of the page.

> [!NOTE]  
> For backward compatibility, we continue to support adding non-part pages as parts. It's a good idea to redesign your page to only use Card part or List part, as we may remove support in a future update.

For syntax examples, see [Page Object](devenv-page-object.md) and [Page Extension Object](devenv-page-ext-object.md).

## Naming

Controls, actions, and methods names must be unique on pages. In C/SIDE, you could create a Part control with the same name as a method, which would give you an error at runtime. It's now prevented by disallowing duplicates. Similarly, trigger and trigger event names are disallowed on matching application object types. Likewise, actions and fields could have same names before, but that would have prevented page testability access, and will now throw a compilation error. 

> [!NOTE]  
> Name on Controls and Actions on Pages is mandatory now.

## Property dependencies

For some properties to work, they require you to set another property. An example is `PromotedCategory`, which requires that you've enabled the property `Promoted`. The following table lists some of the properties that have this dependency.

|Property|Depends on the property...|
|--------|-------------|
|PromotedCategory|Promoted|
|PromotedIsBig|Promoted|
|ValidateTableRelation|TableRelation|
|SourceTableTemporary|SourceTable|
|RunPageMode|RunObject|

## Limited functionality

The `InitValue` property of type `Duration` isn't allowed in the AL Language development environment. The `InitValue` of type `DateTime` is only allowed for the value `0DT`.  

## See Also

[Developing Extensions](devenv-dev-overview.md)   
[Get Started with AL](devenv-get-started.md)  
[AL Development Environment](devenv-reference-overview.md)  

