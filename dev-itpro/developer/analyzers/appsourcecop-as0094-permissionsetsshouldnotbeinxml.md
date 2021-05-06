---
title: "AppSourceCop Rule AS0094"
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
# AppSourceCop Rule AS0094
Permission Sets should not be defined in XML files.

## Description
Permission sets should not be defined in XML. Instead, use the dedicated AL object for 'PermissionSet'.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example of XML file triggering the rule

```XML
<?xml version="1.0" encoding=""utf-8""?>
<PermissionSets>
  <PermissionSet RoleID="TestProjectPermissionSet" RoleName="Default">
    <Permission>
      <ObjectType>8</ObjectType>
      <ObjectID>70001</ObjectID>
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

### Converted into a PermissionSet object
For a table called "Floor Manager" with object ID 70001, we can convert the above permissions defined in XML into a permission set object defined in AL as shown below:

```AL
permissionset 50130 MyPermissionSet 
{ 
    Assignable = true;
    Caption = 'My PermissionSet';

    Permissions = 
        tabledata "Floor Manager" = RIMD
} 

```

The `RIMD` access allows access to **R**ead, **I**nsert, **M**odify, and **D**elete entries in the table. This can be modified by adding and removing letters corresponding to the first letter of the permission that you want to (dis)allow. This permission set can then be assigned to users/roles.

## How to fix this diagnostic?
You can convert XML permission sets to AL objects. For more information, see [Upgrading Permissions Sets and Permissions](../../upgrade/upgrade-permissions.md).

## See Also
[PermissionSet Object](../devenv-permissionset-object.md)
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
