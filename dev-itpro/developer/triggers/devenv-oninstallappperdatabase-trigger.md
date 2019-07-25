---
title: "OnInstallAppPerDatabase Trigger"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: feda29f9-b64a-4720-930b-b7cd96c73434
author: blrobl
---

# OnInstallAppPerDatabase Trigger
Runs during the installation or reinstallation of an extension.

## Applies To  
-  Install codeunits. These codeunits have the [SubType Property \(Codeunit\)](../properties/devenv-subtype-property-codeunit.md) set to **Install**.  

## Remarks  
Includes code for database-related operations.

This trigger is run once in the entire install process, in a single system session that does not open any company.

## See Also  
 [Triggers](devenv-triggers.md)  
 [Codeunit Triggers](devenv-codeunit-triggers.md)  