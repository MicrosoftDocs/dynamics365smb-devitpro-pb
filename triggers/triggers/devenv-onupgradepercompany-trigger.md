---
title: OnUpgradePerCompany Trigger in AL for Business Central
description: Learn how the OnUpgradePerCompany trigger runs in AL upgrade codeunits in Business Central once for each company to perform the actual extension upgrade.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnUpgradePerCompany trigger

Runs during the upgrade of an extension.

## Applies to

- Upgrade codeunits. These codeunits have the [SubType Property \(Codeunit\)](../properties/devenv-subtype-codeunit-property.md) set to **Upgrade**.

> [!NOTE]
> This trigger is also available in upgrade codeunits for the base application, not just for extensions.

## Remarks

It is used to perform the actual upgrade. If an error occurs during runtime the extension upgrade is canceled.

This trigger is run once for each company in the database, and it is executed within its own system session for the company.

## Related information

[Triggers](devenv-triggers.md)  
[Codeunit Triggers](devenv-codeunit-triggers.md)
