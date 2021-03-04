---
title: "AdditionalSearchTerms Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AdditionalSearchTerms Property
> **Version**: _Available from runtime version 3.0._

Specifies search terms (words and phrases) for the page. In addition to the page caption, the terms are used by the search feature in the Web client and mobile apps. Separate terms with a comma.

## Applies to
-   Page
-   Report


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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

## Syntax

```AL
AdditionalSearchTerms = '<term>[,<term>]';
```

## Remarks
For [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises, the [!INCLUDE[webserverinstance](../includes/webserverinstance.md)] configuration file (navsettings.json) includes a setting called `UseAdditionalSearchTerms` that enables or disables the use of additional search terms by the **Tell me**. For more information, see [Configuring [!INCLUDE[webserver](../includes/webserver.md)] Instances](../../administration/configure-web-server.md#Settings).

## Dependent Properties

The [UsageCategory property](devenv-usagecategory-property.md) must be set to a value other than `None` in order for the page to be searchable by **Tell me**.

## Example

The following code snippet uses the **AdditionalSearchTerms** property to add two search terms, **product** and **merchandise**, to a list page whose caption is **Items**.

```AL
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
