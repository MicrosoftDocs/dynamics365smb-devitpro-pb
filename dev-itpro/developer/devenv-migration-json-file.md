---
title: "The Migration.json File"
description: "Description of the json file for data migration for AL in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# The Migration.json File

[!INCLUDE[2019_releasewave2_15.3_onprem](../includes/2019_releasewave2_15.3_onprem.md)]

Data migration allows you to move table and field data between extensions. The `migration.json` file provides a pointer to the ID of an app that one or more tables will be moved to. This allows you to move table and field data from, for example, a code-customization on the base application to an extension of the base application. The `migration.json` file can be added into the app project of an extension that a table is moved from to specify the ID of the app that the table will be moved to. It can, for example, be placed at the root of the AL project. The `migration.json` file must be created manually following the steps and syntax as described below.

In the extension `app.json` file, ensure that `"target": "OnPrem"`. For more information, see [JSON Files](devenv-json-files.md).

## Creating the migration.json file

1) In the root folder of the app project that will migrate data to a different app project, choose **New File**.
2) Name the file `migration.json`.
3) Edit the file by adding one or more IDs inside the `"apprules":[]` section, such as the following:

```json
{ 
    "apprules": [ 
        { 
            "id": "12345678-abcd-abcd-abcd-1234567890ab" 
        } 
    ] 
} 
```
4) Save the `migration.json` file in the project.

You now have the migration file in place for the data migration from one app project to another. This will be used for performing the data migration steps. For more information, see [Migrating Tables and Fields Between Extensions](devenv-migrate-table-fields.md).

## See Also

[JSON Files](devenv-json-files.md)  
[Migrating Tables and Fields Between Extensions](devenv-migrate-table-fields.md) 
