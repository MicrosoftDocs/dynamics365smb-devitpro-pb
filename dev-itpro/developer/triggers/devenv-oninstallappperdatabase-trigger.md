---
title: "OnInstallAppPerDatabase Trigger"
description: "OnInstallAppPerDatabase trigger in AL for Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: blrobl
---

# OnInstallAppPerDatabase Trigger
Runs during the installation or reinstallation of an extension.

## Applies to  
-  Install codeunits. These codeunits have the [SubType Property \(Codeunit\)](../properties/devenv-subtype-codeunit-property.md) set to **Install**.  

## Remarks  
Includes code for database-related operations.

This trigger is run once in the entire install process, in a single system session that does not open any company.

## See Also  
 [Triggers](devenv-triggers.md)  
 [Codeunit Triggers](devenv-codeunit-triggers.md)