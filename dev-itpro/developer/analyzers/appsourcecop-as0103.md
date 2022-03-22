---
title: "AppSourceCop Warning AS0103"
description: "Table definitions must have a matching permission set."
ms.author: solsen
ms.custom: na
ms.date: 03/21/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0103
Table definitions must have a matching permission set.

## Description
Table definitions must have a matching permission set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To prevent runtime issues caused by missing permissions, all table definitions in your extension must be included in a permission set.

## How to fix this diagnostic?

Permissions can be defined either by using XML, or by using AL permission set objects.

To generate XML permission sets, you can use the dedicated command in Visual Studio Code:

1. Press **Ctrl+Shift+P** to open the command palette.
2. Select **AL: Generate permission set containing current extension objects**. This will generate the XML permission set for your extension.
3. Rebuild your extension by pressing **Ctrl+Shift+B** to package the permission set with your extension.

For more information about AL permission sets, see [Permission Set Object](../devenv-permissionset-object.md).

## Code examples not triggering the rule

For the following example, let's consider an extension that has the following source code:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
    }
}
```

### Example 1 - Permission defined in XML

```XML
<?xml version="1.0" encoding="utf-8"?>
<PermissionSets>
  <PermissionSet RoleID="ALPROJECT15" RoleName="ALProject15">
    <Permission>
      <ObjectID>50100</ObjectID>
      <ObjectType>0</ObjectType>
      <ReadPermission>1</ReadPermission>
      <InsertPermission>1</InsertPermission>
      <ModifyPermission>1</ModifyPermission>
      <DeletePermission>1</DeletePermission>
      <ExecutePermission>0</ExecutePermission>
      <SecurityFilter />
    </Permission>
  </PermissionSet>
</PermissionSets>
```

The XML permission set grants access to the table and thereby satisfies the validation.

### Example 2 - Permission defined in AL

```AL
permissionset 50100 MyPermissionSet
{
    Assignable = true;
    Permissions = tabledata MyTable = RIMD;
}
```

The AL permission set grants access to the table and thereby satisfies the validation.

> [!NOTE]  
> You can grant access to all your tables using `*`. For instance `tabledata * = R;` grants read access to all of them.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
