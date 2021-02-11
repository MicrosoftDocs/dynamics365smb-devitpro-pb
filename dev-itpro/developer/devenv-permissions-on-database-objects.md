---
title: "Permissions on Database Objects"
ms.custom: na
ms.date: 02/04/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Permissions on Database Objects

This section provides an overview of permissions on objects in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].
  
## Permissions

If you have been granted permission to read a page, then you can open the page and view the data that it displays. If, however, you do not have write permission, you are not allowed to enter data into this page.  
  
Sometimes, when you open a page it displays information from several tables. To access this page, you must have permission to view all the data displayed by the page. You might not have permission to read directly from all the tables that the page uses. In this case, you must have indirect permission to read from the tables in question. Having indirect permission to a table means that you cannot open the table and read from it but can only view the data it contains indirectly through another object, such as a page or report, that you have direct permission to access.  
  
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] has a number of standard predefined security permission sets. You can use these permission sets as defined or you can change a permission sets to suit your particular needs. You can also create your own permission sets and assign them the permissions that you want.  
  
### Permissions on Objects  

The following table describes the permissions that can be assigned for specific objects. When assigning permissions by using the object types [PermissionSet Object](devenv-permissionset-object.md) and [PermissionSet Extension Object](devenv-permissionset-ext-object.md) these permissions have been shortened. The table illustrates the abbreviations used.


|Permission|Description|Abbreviation in AL  |
|----------|-----------------|----------|
|Read      |You can read this object.| `R` for direct read access, `r` for indirect read access. |
|Insert    |You can insert data into this object.| `I` for direct insert permission, `i` for indirect insert permission. |
|Modify    |You can modify data in this object.| `M` for direct modify permission, `m` for indirect modify permission. |
|Delete    |You can delete data from this object.| `D` for direct delete permission, `d` for indirect delete permission.| 
|Wildcard  | The wildcard specifies all permissions. | `X` for direct `RIMD` permissions, `x` for indirect `rimd` permissions. |

These permissions can be combined into a group of permissions for any given object. For example:

```al
...
tabledata Customer = RIMD,
        tabledata "Payment Terms" = RMD,
        tabledata Currency = RM,
        tabledata "Sales Header" = RIM,
        tabledata "Sales Line" = RIMD;
...
```
  
## See Also

[Getting Started with AL](devenv-get-started.md)