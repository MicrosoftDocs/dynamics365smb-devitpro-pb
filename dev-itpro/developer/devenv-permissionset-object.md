---
title: "Permission Set Object"
description: "Description of the permission set object in AL for Business Central    ."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/30/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Permission Set Object

The permission set object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] describes which objects an administrator or a partner has assigned to a user. Permission sets are included in an [Entitlement Object](devenv-entitlement-object.md) that constitutes the set of permissions that a customer is entitled to use. With a [Permission Set Extension Object](devenv-permissionset-ext-object.md) you can make *additive* changes to an existing permission set. This means that you cannot remove permissions from a permission set with an extension object.

For information about which permissions can be assigned to objects, see [Permissions on Database Objects](devenv-permissions-on-database-objects.md).

## Designing with cautiousness

If a permission set is extended through AL, that extension will make additive changes to the permission set. This means that an extension can provide elevated privileges to an otherwise limited set of permissions. Building permission sets that can be extended must be done carefully with this in mind.

## Snippet support

Typing the shortcut `tpermissionset` will create the basic layout for a permission set object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Permission set example

The following example illustrates a permissionset `Sales Person` with permissions given to data in tables, each with different level of access. The <!-- [Assignable property](properties/devenv-assignable-property.md)--> [Assignable property](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-assignable-property?branch=new-properties) is set to `true` which allows the permissionset to be assigned to a user. The <!--[Permissions property](properties/devenv-permissions-property.md)--> [Permissions property](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-permissions-property?branch=new-properties) is set to the list of objects to give permissions to. The `RIMD` access assigned to data in the `Customer` table provides full access, whereas, for example, access is limited for data in the `Currency` table only allowing full read and modify permission. 


```al
permissionset 50134 "Sales Person"
{
    Assignable = true;
    Caption = 'Sales Person';

    Permissions = 
        tabledata Customer = RIMD,
        tabledata "Payment Terms" = RMD,
        tabledata Currency = RM,
        tabledata "Sales Header" = RIM,
        tabledata "Sales Line" = RIMD;
}

```

The following example of a permissionset illustrates assigned permissions to run codeunits. With the <!-- [IncludedPermissionSets property](properties/devenv-includedpermissionsets-property.md) -->[IncludedPermissionSets property](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-includedpermissionsets-property?branch=new-properties), we specify that the permissionset `Sales Person` is also included in `MyPermissionSet`.

```al
permissionset 50130 MyPermissionSet 
{ 
    Assignable = true;
    Caption = 'My PermissionSet';
    IncludedPermissionSets = "Sales Person"; 

    Permissions = 
        codeunitSomeCode = x, 
        tabledata Vendor = RIm,
        codeunitAccSchedManagement= X; 
} 
```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Entitlements and Permission Set Overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)  
[Permissions on Database Objects](devenv-permissions-on-database-objects.md)  
[Assignable Property](properties/devenv-assignable-property.md)  
[IncludedPermissionSets](properties/devenv-includedpermissionsets-property.md)  
[Permissions Property](properties/devenv-permissions-property.md)
