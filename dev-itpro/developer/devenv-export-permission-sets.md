---
title: Export Permission Sets to XML
description: Learn more about exporting permission sets to XML in Business Central.
author: SusanneWindfeldPedersen
ms.date: 01/10/2025
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Export permission sets to XML

Permission sets that exist in [!INCLUDE [prod_short](includes/prod_short.md)] can be exported and packaged for your extension directly from the client, instead of defining XML by hand. These permission sets are also known as *tenant* permissions, and are shown in the UI as **Extension** permissions. The underlying functionality of permissions has changed with the latest version of [!INCLUDE [prod_short](includes/prod_short.md)].

> [!IMPORTANT]  
> With the latest version of [!INCLUDE [prod_short](includes/prod_short.md)] permissions are no longer defined as data in the application database. Permissions that can be created by using AL objects are called *system* permissions. Learn more in [Entitlements and permission sets overview](devenv-entitlements-and-permissionsets-overview.md).

## To export permission sets from [!INCLUDE [prod_short](includes/prod_short.md)]

1. In [!INCLUDE [prod_short](includes/prod_short.md)], search for **Permission Sets**, and then choose the relevant link.
2. On the **Permission Sets** page, choose the permissions that you want to export, and then choose **Export Permission Sets**.
3. Save the file to your extension folder.
4. Delete the permission sets from [!INCLUDE [prod_short](includes/prod_short.md)]. 

You can generate a permission set file which contains permissions to all the files in your extension. This makes it easier to start setting up permissions for your app. You can do this by simply creating an extension with some objects as described below.

## To export permission sets using Visual Studio Code

1. In Visual Studio Code, open your extension with objects; pages, reports, tables, queries, codeunits, and/or XMLports.  
2. Open the command palette using the `Ctrl+Shift+P` keys and select the **AL: Generate permission set as XML file containing current extension objects** command.  
    > [!NOTE]  
    > If you do this repeatedly, Visual Studio Code will probe for overwriting the file, there's no support for merging manual corrections into newly generated content.

Now, you have the XML file with default permissions to all your objects.

### Example from Visual Studio Code

The following example illustrates the generated .xml file from **MyProject** which contains a table with objectID 50106 and two object types are generated; `<ObjectType>0</ObjectType>` is `TableData` and `<ObjectType>1</ObjectType>` is `Table`.

> [!NOTE]  
> The maximum length of the RoleID attribute is 20 characters. If the RoleID exceeds this length, then the XML schema validation fails and the corresponding permission set file is not included in the resulting app package. You will get a warning in the Visual Studio output panel.


```xml
<?xml version="1.0" encoding="utf-8"?>
<PermissionSets>
  <PermissionSet RoleID="MyProject" RoleName="MyProject">
    <Permission>
      <ObjectID>50106</ObjectID>
      <ObjectType>0</ObjectType>
      <ReadPermission>1</ReadPermission>
      <InsertPermission>1</InsertPermission>
      <ModifyPermission>1</ModifyPermission>
      <DeletePermission>1</DeletePermission>
      <ExecutePermission>0</ExecutePermission>
      <SecurityFilter />
    </Permission>
    <Permission>
      <ObjectID>50106</ObjectID>
      <ObjectType>1</ObjectType>
      <ReadPermission>0</ReadPermission>
      <InsertPermission>0</InsertPermission>
      <ModifyPermission>0</ModifyPermission>
      <DeletePermission>0</DeletePermission>
      <ExecutePermission>1</ExecutePermission>
      <SecurityFilter />
    </Permission>
</PermissionSet>
</PermissionSets>

```

### Object type mapping

The mapping of object types in the XML such as `<ObjectType>0</ObjectType>` generated from Visual Studio Code is the following:

|Object type      |Number|
|-----------------|------|
|TableData        |  0   |
|Table            |  1   |
|Report           |  3   |
|Codeunit         |  5   |
|XMLPort          |  6   |
|Page             |  8   |
|Query            |  9   |
|FieldNumber      |  11  |
|PageExtension    |  14  |
|TableExtension   |  15  |
|Enum             |  16  |
|EnumExtension    |  17  |
|Profile          |  18  |
|ProfileExtension |  19  |

## Related information

[Entitlements and permission sets overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permissions on database objects](devenv-permissions-on-database-objects.md)  
[Permissions property](properties/devenv-permissions-property.md)  
[TestPermissions property](properties/devenv-testpermissions-property.md)  
