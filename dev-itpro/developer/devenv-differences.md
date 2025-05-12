---
title: Differences in the development environments
description: Describes the various differences between the C/SIDE and AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 03/19/2025
ms.topic: article
ms.author: solsen
ms.reviewer: solsen
ms.custom: evergreen
---

# Differences in the development environments

Coming from the Dynamics NAV development environment and C/SIDE, it's good to know about some differences and optimizations between them. The following sections go through some of these changes, but it isn't an exhaustive list.

> [!TIP]  
> A useful tool in Visual Studio Code is IntelliSense, which gives you a list of options in the current context. To activate IntelliSense from anywhere in the code, select <kbd>Ctrl</kbd>+<kbd>Space</kbd>.

## General development approach

While you could change the existing Dynamics NAV source code using C/SIDE, the best approach to develop with the AL Language development environment is to work with [Extensions](devenv-dev-overview.md) only. It means you can extend the existing code by adding new functionality or integrate your code using [Events](devenv-events-in-al.md). However, you can't change the existing code, for example in codeunits.

With Business Central 2019 release wave 2, the possibility to change or ["code-customize" the base application](devenv-publish-code-customization.md) was introduced for on-premises installations. But, it was also announced that in the future, code-customization isn't an option, only the extension model is used.

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

With the introduction of .xliff files, the ML properties, such as **CaptionML** and **TooltipML** aren't used for this translation method. Use the equivalent properties instead, such as **Caption** and **Tooltip**. Then, make sure the manifest is set up to generate the `/Translations` folder and use the generated .xliff files for translations of the extension. Learn more in [Working with translation files](devenv-work-with-translation-files.md).

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

For instance, define `area(Sections)` inside the `actions` section of the page.

Likewise, `Container` and `ContainerType` elements in C/SIDE are renamed to `area(Content|FactBoxes|RoleCenter)` and can be defined inside the `layout` section of the page.

> [!NOTE]  
> For backward compatibility, we continue to support adding non-part pages as parts. It's a good idea to redesign your page to only use Card part or List part, as we might remove support in a future update.

For syntax examples, see [Page object](devenv-page-object.md) and [Page extension object](devenv-page-ext-object.md).

## Naming

Controls, actions, and methods names must be unique on pages. In C/SIDE, you could create a Part control with the same name as a method, which would give you an error at runtime. It's now prevented by disallowing duplicates. Similarly, trigger and trigger event names are disallowed on matching application object types. Likewise, actions and fields could have same names before, but that would have prevented page testability access, and will now throw a compilation error. 

> [!NOTE]  
> Names on controls and actions on pages are now mandatory.

## Property dependencies

For some properties to work, you need to set another property. For example, `PromotedCategory` requires that you enable the property `Promoted`. The following table lists some of the properties that have this dependency.

|Property|Depends on the property...|
|--------|-------------|
|PromotedCategory|Promoted|
|PromotedIsBig|Promoted|
|ValidateTableRelation|TableRelation|
|SourceTableTemporary|SourceTable|
|RunPageMode|RunObject|

## Limited functionality

The `InitValue` property of type `Duration` isn't allowed in the AL Language development environment. The `InitValue` of type `DateTime` is only allowed for the value `0DT`.  

## Related information

[Developing extensions](devenv-dev-overview.md)   
[Get started with AL](devenv-get-started.md)  
[AL development environment](devenv-reference-overview.md)  
