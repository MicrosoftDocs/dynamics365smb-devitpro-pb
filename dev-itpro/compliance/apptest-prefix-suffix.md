---
title: "Prefix and suffix for naming in extensions"
description: "Use a prefix or suffix for names in your extension."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
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
```
table 70000000 MyPrefixSalesperson
```
```
table 70000001 SalespersonMySuffix
```

### Page
```
page 70000000 MyPrefixSalesperson
```
```
page 70000001 SalespersonMySuffix
```

### Page extension  
```
actions
{
    addafter(ApprovalEntries)
    {
        action(MyPrefixVacation)
```
```
actions
{
    addafter(ApprovalEntries)
    {
        action(VacationMySuffix)
```

### Codeunit
```
codeunit 70000000 MyPrefixSalesperson
```
```
codeunit 70000001 SalespersonMySuffix
```


## Benefits
There are two good reasons to why you may want to proactively use a prefix or suffix:

1. App A and App B both use the same field name (for a native Dynamics 365 table) of FAB Salesperson Code. The partner for App B already has the prefix/suffix reserved. A customer wants to install both apps but cannot due to collision of field name. App A will have to reserve a different unique prefix and submit an updated version of their app.  

2. Dynamics 365 developers want to use the name of Salesperson Code. App A (published for months), already has that field name. Microsoft will require the app to prefix its field names by submitting an updated version of their app.  

## General rules

- The prefix/suffix must be at least 3 characters
- The object/field name must start or end with the prefix/suffix
- If a conflict arises, the one who registered the prefix/suffix always wins
- For your own pages/tables/codeunits, you must set the prefix/suffix at the top object level
- For pages/tables in the base application of BC that you extend, you must set the prefix/suffix at the top object level
- For pages/tables of Business Central in the base application that you extend, you must also set at the control/field/action level
- Use the [AppSourceCop](../developer/devenv-using-code-analysis-tool.md) tool to find all missing prefixes and/or suffixes. Configuration options for this tool can be found [here](../developer/analyzers/appsourcecop.md). The Rules section explains the different checks that the analyzer will do. For prefix/suffix detection, refer to the Configuration section. It explains how to set your prefix in the AppSourceCop.json file.

## Examples of acceptable prefix/suffix

**No Delimiter**
- FABSalespersonCode
- SalespersonCodeFAB

**Space**
- "FAB Salesperson Code"
- "Salesperson Code FAB"

**Underscore**
- FAB_Salesperson_Code
- Salesperson_Code_FAB

*Contact us at d365val@microsoft.com to reserve the prefix/suffix of your choosing*

## See Also
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  