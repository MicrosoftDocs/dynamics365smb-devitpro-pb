---
title: Permissions on Database Objects
description: This article provides an overview of permissions on objects in Business Central.
ms.date: 06/02/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
author: SusanneWindfeldPedersen
---

# Permissions on database objects

This article provides an overview of permissions on objects in [!INCLUDE [prod_short](includes/prod_short.md)].
  
## Permissions

If you're granted permission to read a page, then you can open the page and view the data that it displays. If, however, you don't have write permission, you aren't allowed to enter data into that page.  
  
Sometimes, when you open a page it displays information from several tables. To access the page, you must have permission to view all the data displayed by the page. You might not have permission to read directly from all the tables that the page uses. In such a case, you must have *indirect permission* to read from these tables. Having *indirect permission to a table* means you can't directly open or read data from the table itself. Instead, you can only view the table's data when it's displayed through another object (like a page or report) that you have *direct permission* to access. The data is accessible only "indirectly" through these intermediary objects.
  
[!INCLUDE [prod_short](includes/prod_short.md)] has many standard predefined security permission sets. You can use these permission sets as defined or you can change a permission set to suit your particular needs. You can also create your own permission sets and assign them the permissions that you want.  
  
### Permissions on objects  

The following table describes the permissions that can be assigned for specific objects. When assigning permissions by using the object types [PermissionSet object](devenv-permissionset-object.md) and [PermissionSet extension object](devenv-permissionset-ext-object.md) these permissions have been shortened. The table illustrates the abbreviations used.

Permissions on `tabledata` are specified with the following abbreviations:

|Permission|Description|Abbreviation in AL  |
|----------|-----------------|----------|
|Read      |You can read data.| `R` for direct read access, `r` for indirect read access. |
|Insert    |You can insert data.| `I` for direct insert permission, `i` for indirect insert permission. |
|Modify    |You can modify data.| `M` for direct modify permission, `m` for indirect modify permission. |
|Delete    |You can delete data.| `D` for direct delete permission, `d` for indirect delete permission.|

Permissions on *all objects* are specified with the following abbreviations:

|Permission|Description|Abbreviation in AL  |
|----------|-----------------|----------|
|Execute   |You can run this object. | `X` for direct execute permissions, `x` for indirect execute permissions. |

#### Wildcard

The wildcard `*` can be used as a shortcut to assign multiple permissions at a time, such as:

```al
Permissions = codeunit * = X;
```

> [!IMPORTANT]  
> The wildcard must be used with caution, because when it's used in a permission set it grants the permission to all objects of that type across all permissions. If a permission set with a wildcard is included in an entitlement, it only covers the objects of that type in the current extension.

## Example

All of the permissions illustrated above can be combined into a group of permissions for any given object. For example:

```al
...
Permissions =     
    tabledata Customer = RIMD,        // Full access
    tabledata "Payment Terms" = RMD,  // Full read, modify, and delete access - no insert
    tabledata Currency = rimd,        // Full indirect access
    tabledata "Sales Header" = RIM,   // full read, insert, and modify access - no delete
    tabledata "Sales Line" = RIMD,    // Full access
    report "Sales Statistics" = X;    // Full access
...
```

## Related information

[Get started with AL](devenv-get-started.md)  
[Entitlements and permission set overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission set object](devenv-permissionset-object.md)  
[Permissions on database objects](devenv-permissions-on-database-objects.md)  
