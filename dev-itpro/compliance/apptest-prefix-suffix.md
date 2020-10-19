---
title: "Prefix and suffix for naming in extensions"
description: "Use a prefix or suffix for names in your extension."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: rweigel
---

# Benefits and Guidelines for using a Prefix or Suffix

In your extension, the name of each new application object (table, page, codeunit), must contain a prefix or suffix. This rule applies to all objects. You can use the [Caption](../developer/properties/devenv-caption-property.md) values for what you decide to display to the user. When you modify a core Dynamics 365 object using a table extension or a page extension, the prefix/suffix must be defined at the control/field/action/group level.

## Examples

Declare your objects with a prefix as shown in the following examples.

### Table

```AL
table 70000000 MyPrefixSalesperson
```

```AL
table 70000001 SalespersonMySuffix
```

### Page

```AL
page 70000000 MyPrefixSalesperson
```

```
page 70000001 SalespersonMySuffix
```

### Page extension

```AL
actions
{
    addafter(ApprovalEntries)
    {
        action(MyPrefixVacation)
```

```AL
actions
{
    addafter(ApprovalEntries)
    {
        action(VacationMySuffix)
```

### Codeunit

```AL
codeunit 70000000 MyPrefixSalesperson
```

```AL
codeunit 70000001 SalespersonMySuffix
```

## Benefits

Apps in AppSource are required to register and use a prefix or a suffix. Only in vary rare cases will apps run into naming conflicts.  

Per-tenant extensions are not required to use a prefix or suffix, but we strongly recommend that you do so. You can use *pte* as prefix or suffix to avoid conflicts with AppSource apps or base objects.  

> [!NOTE]
> If your per-tenant extension causes a conflict with a new object in the base application or an updated AppSource app, then the per-tenant extension will be required to make the change.

## General rules

- The prefix/suffix must be at least 3 characters
- The object/field name must start or end with the prefix/suffix
- If a conflict arises, the one who registered the prefix/suffix always wins
- For your own pages/tables/codeunits, you must set the prefix/suffix at the top object level
- For pages/tables in the base application or other apps that you extend, you must set the prefix/suffix at the top object level and also at the control/field/action level
- Use the [AppSourceCop](../developer/devenv-using-code-analysis-tool.md) tool to find all missing prefixes and/or suffixes. Configuration options for this tool can be found [here](../developer/analyzers/appsourcecop.md). The Rules section explains the different checks that the analyzer will do. For prefix/suffix detection, refer to the Configuration section. It explains how to set your prefix in the AppSourceCop.json file.

## Examples – per-tenant extension

Let's say that you're creating a per-tenant extension, **myext** and you want to future-proof the naming by applying the prefix or suffix *pte*, which you are not required to register.  

Let's look at some examples:

| Prefixes                      | Suffixes                      |
|-------------------------------|-------------------------------|
| pte-myext-salespersoncode.al  | salespersoncode-myext-pte.al  |
| pte_myext_salespersoncode.al  | salespersoncode_myext_pte.al  |
| pte myext salesperson code.al | salesperson code myext pte.al |
| pteMyExtSalesPersonCode.al    | SalesPersonCodeMyExtPte.al    |

## Examples - AppSource app

Alternatively, let's say you're company is Fabrikam, and you're building an app called *Rentals*. First thing, you email [d365val@microsoft.com](mailto:d365val@microsoft.com) and register *fab* as your company affix.  

> [!TIP]
> It is always a good idea to supply a few suggestions in priority order to avoid back and forth communication.

A registered affix must be 3 letters, no more, no less, and you must provide the publisher name, which you will be using in app.json when you apply for an affix.  

Once you get confirmation from Microsoft, you are free to use object and field names that start with *fab* or end with *fab*. Here are some examples:

| Prefixes               | Suffixes               |
|------------------------|------------------------|
| fab-salespersoncode.al | salespersoncode-fab.al |
| fab_salespersoncode.al | salespersoncode_fab.al |
| fab salespersoncode.al | salespersoncode fab.al |
| FabSalesPersonCode.al  | SalesPersonCodefab.al  |

At Fabrikam, another team is building another app, so you request a special affix for your app so that the two Fabrikam apps can be kept apart. In this scenario, you do not have to register anything with Microsoft, as long as you do this with your company affix. Here are some examples:

| Prefixes               | Suffixes               |
|------------------------|------------------------|
|fab-rentals-salespersoncode.al|salespersoncode-rentals-fab.al|
|fab_rentals_salespersoncode.al|salespersoncode_rentals_fab.al|
|fab rentals salesperson code.al|salesperson code rentals fab.al|
|FabRentalsSalesPersonCode.al|SalesPersonCodeRentalsfab.al|

In this scenario, your appSourceCop.json configuration will specify something like `fab-rentals` and `rentals-fab` as values for `mandatoryaffixes`, even though only *fab* was registered with Microsoft.

> [!TIP]
> Contact us at [d365val@microsoft.com](mailto:d365val@microsoft.com) to reserve the prefix/suffix of your choosing.

## See Also

[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  