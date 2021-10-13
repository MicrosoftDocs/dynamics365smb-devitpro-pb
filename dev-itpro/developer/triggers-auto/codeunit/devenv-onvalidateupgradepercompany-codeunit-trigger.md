---
title: "OnValidateUpgradePerCompany (Codeunit) Trigger"
description: "Runs after an extension upgrade."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# OnValidateUpgradePerCompany (Codeunit) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after an extension upgrade.

> [!IMPORTANT]
> The [Subtype Property](../../properties/devenv-subtype-property.md) must be set to **Upgrade** in the Codeunit.

## Syntax
```AL
trigger OnValidateUpgradePerCompany()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
>  This trigger is also available in upgrade codeunits for the base application, not just for extensions.  

## Remarks  
It is used to check that the upgrade was successful. If an error occurs during runtime the extension upgrade is canceled.

This trigger is run once for each company in the database, and it is executed within its own system session for the company.

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
