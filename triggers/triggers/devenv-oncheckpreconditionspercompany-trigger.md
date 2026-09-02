---
title: OnCheckPreconditionsPerCompany Trigger in AL
description: Learn how the OnCheckPreconditionsPerCompany trigger runs in AL upgrade codeunits in Business Central to verify requirements before an extension upgrade starts.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnCheckPreconditionsPerCompany trigger

Runs before an extension upgrade.

## Applies to

- Upgrade codeunits. These codeunits have the [SubType Property \(Codeunit\)](../properties/devenv-subtype-codeunit-property.md) set to **Upgrade**.

> [!NOTE]
> This trigger is also available in upgrade codeunits for the base application, not just for extensions.

## Remarks

It's used to check that certain requirements are met in order to run the upgrade. If an error occurs during runtime, the extension upgrade is canceled.

This trigger is run once for each company in the database, and it is executed within its own system session for the company.

## Related information

[Triggers](devenv-triggers.md)  
[Codeunit Triggers](devenv-codeunit-triggers.md)
