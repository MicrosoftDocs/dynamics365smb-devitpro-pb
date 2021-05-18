---
title: "AppSourceCop Rule AS0093"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
# AppSourceCop Rule AS0093
Entitlements cannot be defined in an extension.

## Description
Entitlements cannot be defined in an extension because their use is restricted to Microsoft only.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Example of code triggering the rule
```AL
entitlement MyLicense
{
    Type = PerUserServicePlan;
    Id = 'planid';
}
```

## How to fix this diagnostic?
Remove the offending Entitlement object(s) from your extension and use one of the built-in entitlements, for more information see [Entitlements and Permissions Sets Overview](../devenv-entitlements-and-permissionsets-overview.md) provided in [!INCLUDE [prod_short](../includes/prod_short.md)]. It is currently not possible to create user-defined entitlements.


## See Also  
[Entitlement Object](../devenv-entitlement-object.md)
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
