---
title: "The Migration.json File"
description: "Description of the json file for data migration for AL in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/10/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---
# Migrating Tables and Fields

Data migration allows you to move table and field data between extensions. The `migration.json` file provides a pointer to the ID of an app that one or more tables will be moved to. The `migration.json` file can be added into the app project of an extension that a table is moved from to specify the ID of the app that the table will be moved to.

![Data migration](../media/data-migration-tables-fields.png "data migration")  

1. Created a target extension for containing the base table object.
2. Copied the table object code from the original extension. Deleted the field that I wanted in the table extension.
3. Noted the appId of the new extensions
4. Compiled the first version of this extension.
5. In the original extension, added a migration.json file that included the appId of the target extension:

    ```
    { 
    "apprules": [ 
        { 
            "id": "2f3b6c0a-fb6a-4289-ae8a-ded32a991059" 
        } 
    ] 
    } 
    ```
6. Set up a dependency on the new extension I made for the table object
7. Add a table extension object that extended the table in the new extension
8. Added a field to the table extension object that is identical to the field in the original table.
9. Deleted the original table object.
10. Compiled a new version of the extension
11. Published the target extension first, then the new version of original extension.
12. Uninstalled the old version of the original extension.
13. Synced the target extension. This created an empty table, owned by the target extension.
14. Synced the new version of the original extension. The migrated the data in the table to the target extension tables. The columns in the original table were deleted.
15. Installed the new target extension
16. Upgraded the original extension. Not really necessary in my case.



1.    Crated a target extension.
2.    Added a table that exactly matched the definition in the original extension.
3.    Compiled the first version of this extension.
4.    In the original extension, added a migration.json file that included the appId of the target extension:
{ 
    "apprules": [ 
        { 
            "id": "2f3b6c0a-fb6a-4289-ae8a-ded32a991059" 
        } 
    ] 
} 

5.    Deleted the table object,
6.    Compiled a new version of the extension
7.    Published the target extension and new version of original extension.
8.    Uninstalled the old version of the original extension.
9.    Synced the target extension. This created an empty table, owned by the target extension.
10.    Synced the new version of the original extension. The migrated the data in the table to the target extension tables. The columns in the original table were deleted.
11.    Installed the new target extension
12.    Upgraded the original extension. Not really necessary in my case.


## Syntax for the migration.json file

```
{ 

    "apprules": [ 

        { 

            "id": "12345678-abcd-abcd-abcd-1234567890ab" 

        } 

    ] 

} 
 
```

## See Also

[JSON Files](devenv-json-files.md)  

