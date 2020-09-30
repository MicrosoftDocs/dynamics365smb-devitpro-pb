---
title: "AdditionalSearchTerms Property"
description: "Describes the AdditionalSearchTerms Property in AL."
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# AdditionalSearchTerms Property

Specifies search terms (words and phrases) for the page or report. In addition to the caption of the page or report, the terms are used by the search feature (**Tell me**) in the Web client and mobile apps.

## Syntax

```
AdditionalSearchTerms = '<term>[,<term>]';
```

## Applies to

- Page objects
- Report objects

## Parameters
*Locked*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
If `true` the AdditionalSearchTerms is locked and should not be translated.  

*Comment*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Descriptive text for the AdditionalSearchTerms, for example, with regards to translation.

*MaxLength*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Sets the maximum length of the specific AdditionalSearchTerms.

## Property Values

|Value           |Description                                  |
|----------------|---------------------------------------------|
|`<term>`  |The search word or phrase, which can consist of letters, numbers and special characters. Separate each term by a comma.  |

## Remarks
For [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises, the [!INCLUDE[webserverinstance](../includes/webserverinstance.md)] configuration file (navsettings.json) includes a setting called `UseAdditionalSearchTerms` that enables or disables the use of additional search terms by the **Tell me**. For more information, see [Configuring [!INCLUDE[webserver](../includes/webserver.md)] Instances](../../administration/configure-web-server.md#Settings).

## Dependent Properties

The [UsageCategory property](devenv-usagecategory-property.md) must be set to a value other than `None` in order for the page to be searchable by **Tell me**.

## Example

The following code snippet uses the **AdditionalSearchTerms** property to add two search terms, **product** and **merchandise**, to a list page whose caption is **Items**.

```
page 50100 MyItems
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Item;
    UsageCategory = Lists;
    Caption = 'Items';
    AdditionalSearchTerms = 'product, merchandise';
    ...
}
```

## See Also

[Adding Pages and Reports to Tell me](../devenv-al-menusuite-functionality.md)  
[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[Report Object](../devenv-report-object.md)  
