---
title: "Permission Sets should not be defined in XML files."
ms.author: solsen
ms.custom: na
ms.date: 03/30/2021
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

## Example of XML file triggering the rule

```XML
<?xml version="1.0" encoding=""utf-8""?>
<PermissionSets>
  <PermissionSet RoleID="TestProjectPermissionSet" RoleName="Default">
    <Permission>
      <ObjectType>8</ObjectType>
      <ObjectID>70000001</ObjectID>
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

## How to fix this diagnostic
You can convert XML Permission Sets to AL objects. You can see more on the [upgrade page](../../upgrade/upgrade-permissions.md).

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  