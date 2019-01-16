---
title: "AdditionalSearchTerms Property"
description: "Describes the AdditionalSearchTerms Property in AL."
author: jswymer
ms.custom: na
ms.date: 01/15/2019
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# AdditionalSearchTerms Property

Specifies search terms (words and phrases) for the page or report. In addition to the caption of the page or report, the terms are used by the search feature (**Tell me**) in the Web client and mobile apps.


## Syntax

```
AdditionalSearchTermsML = '<term>,<term>';
```

## Applies to

- Page objects
- Report objects

## Property Values

|Value           |Description                                  |
|----------------|---------------------------------------------|
|`<term>`  |The search word or phrase. Can consist of letters, numbers and special character.  |

## Remarks
For [!INCLUDE[prodshort](includes/prodshort.md)] on-premises, the [!INCLUDE[webserverinstance](includes/webserverinstance.md)] configuration file (navsettings.json) includes a setting called `UseAdditionalSearchTerms` that enables or disables the use of additional search terms by the **Tell me**. For more information, see [](../../administration/configure-web-server.md).

## Dependent Properties
[UsageCategory property](devenv-ussagecategory-property.md) 

## See Also
[Adding Pages and Reports to Tell me](../devenv-al-menusuite-functionality.md)  
[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[Report Object](../devenv-report-object.md)  
