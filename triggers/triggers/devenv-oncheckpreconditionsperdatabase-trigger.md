---
title: "OnCheckPreconditionsPerDatabase Trigger"
description: "OnCheckPreconditionsPerDatabase trigger in AL for Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
ms.assetid: feda29f9-b64a-4720-930b-b7cd96c73434
author: blrobl
---

# OnCheckPreconditionsPerDatabase Trigger
Runs before an extension upgrade.

## Applies to  
-  Upgrade codeunits. These codeunits have the [SubType Property \(Codeunit\)](../properties/devenv-subtype-codeunit-property.md) set to **Upgrade**.  

> [!NOTE]  
>  This trigger is also available in upgrade codeunits for the base application, not just for extensions.  

## Remarks  
It is used to check that certain requirements are met in order to run the upgrade.If an error occurs during runtime the extension upgrade is canceled.

This trigger is run once in the entire upgrade process, in a single system session that does not open any company.

## See Also  
 [Triggers](devenv-triggers.md)  
 [Codeunit Triggers](devenv-codeunit-triggers.md)