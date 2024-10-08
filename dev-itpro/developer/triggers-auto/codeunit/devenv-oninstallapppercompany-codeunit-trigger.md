---
title: "OnInstallAppPerCompany (Codeunit) trigger"
description: "Runs during the installation or reinstallation of an extension."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnInstallAppPerCompany (Codeunit) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs during the installation or reinstallation of an extension.

> [!IMPORTANT]
> The [Subtype Property](../../properties/devenv-subtype-property.md) must be set to **Install** in the Codeunit.

## Syntax
```AL
trigger OnInstallAppPerCompany()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Includes code for company-related operations. 

This trigger is run once for each company in the database.

## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
