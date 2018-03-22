---
title: "Prefix and suffix for naming in extensions"
description: "Use a prefix or suffix for names in your extension."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: rweigel

---

# Benefits and Guidelines for using a Prefix or Suffix

It is **required** to use a prefix or suffix for the name property of the fields in your extension. You would then use the Caption/CaptionML values for what to display to the user.

You must use a prefix/suffix when naming all new objects. When you modify a core Dynamics 365 object using a Table Extension or Page Extension, the prefix must be defined at the control or field level.

Declare your objects with a prefix as shown in the following examples.

**Table**  
```
table 70000000 MyPrefix Salesperson
```

**Page**  
```
page 70000000 MyPrefix Salesperson
```

**Codeunit**  
```
codeunit 70000000 MyPrefix Salesperson
```

**Page Extension**  
```
actions
{
    addafter(ApprovalEntries)
    {
        action(MyPrefix Vacation)
```

## Benefits

There are 2 good reasons to why you may want to proactively use a prefix or suffix

1.  App A and App B both use the same field name (for native Dynamics 365 table) of FAB Salesperson Code. The partner for App B already has the prefix/suffix reserved. A customer wants to install both apps but cannot due to collision of field name. App A will have to reserve a different unique prefix and submit an updated version of their app.  

2. Dynamics 365 developers want to use the name of Salesperson Code. App A (published for months), already has that field name. Microsoft will require the app to prefix its field names by submitting an updated version of their app.  

## General Rules

- Tag must be at least 3 characters
- The object/field name must start or end with the tag
- If a conflict arises, the one who registered the tag always wins

## Examples of Acceptable Prefix/Suffix
**No Delimiter**
- FABSalespersonCode
- SalespersonCodeFAB

**Space**
- FAB Salesperson Code
- Salesperson Code FAB

**Underscore**
- FAB_Salesperson_Code
- Salesperson_Code_FAB

*Contact us at d365val@microsoft.com to reserve the prefix/suffix of your choosing*

## See Also
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  