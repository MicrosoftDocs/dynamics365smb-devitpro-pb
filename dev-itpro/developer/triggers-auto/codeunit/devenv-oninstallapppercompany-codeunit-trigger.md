---
title: "OnInstallAppPerCompany (Codeunit) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnInstallAppPerCompany (Codeunit) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs during the installation or reinstallation of an extension.

> [!IMPORTANT]
> The [Subtype Property](../../properties/devenv-subtype-property.md) must be set to **Install** in the Codeunit.

## Syntax
```
trigger OnInstallAppPerCompany()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Includes code for company-related operations. 

This trigger is run once for each company in the database.

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
