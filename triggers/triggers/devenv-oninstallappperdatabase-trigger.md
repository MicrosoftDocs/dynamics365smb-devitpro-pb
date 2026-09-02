---
title: OnInstallAppPerDatabase Trigger in AL for Business Central
description: Learn how the OnInstallAppPerDatabase trigger runs once per database in AL install codeunits in Business Central when you install or reinstall an extension.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnInstallAppPerDatabase trigger

Runs during the installation or reinstallation of an extension.

## Applies to

- Install codeunits. These codeunits have the [SubType Property \(Codeunit\)](../properties/devenv-subtype-codeunit-property.md) set to **Install**.

## Remarks

Includes code for database-related operations.

This trigger is run once in the entire install process, in a single system session that does not open any company.

## Related information

[Triggers](devenv-triggers.md)  
[Codeunit Triggers](devenv-codeunit-triggers.md)
